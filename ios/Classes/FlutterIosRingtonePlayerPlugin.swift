import Flutter
import UIKit
import AVFoundation


class SoundPlayer {
    static var shared = SoundPlayer()

    private var audioSession: AVAudioSession

    init() {
        audioSession = AVAudioSession.sharedInstance()
        setupAudioSession()
    }

    private func setupAudioSession() {
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [])
            try audioSession.setActive(true)
        } catch {
            print("Error setting up AVAudioSession: \(error)")
        }
    }

    func playSystemSound(soundId: SystemSoundID) {
        AudioServicesPlaySystemSound(soundId)
    }

    func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }

    func stopSound(soundId: SystemSoundID) {
        AudioServicesDisposeSystemSoundID(soundId)
    }
}

public class FlutterIosRingtonePlayerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_ios_ringtone_player", binaryMessenger: registrar.messenger())
    let instance = FlutterIosRingtonePlayerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "play":
        let arguments = call.arguments as! [String: Any]
        let soundId = arguments["soundId"] as! UInt32

        SoundPlayer.shared.playSystemSound(soundId: soundId)
    case "stop":
        let arguments = call.arguments as! [String: Any]
        let soundId = arguments["soundId"] as! UInt32

        SoundPlayer.shared.stopSound(soundId: soundId)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
