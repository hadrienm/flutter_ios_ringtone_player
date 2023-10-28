
import 'package:flutter/services.dart';

class FlutterIosRingtonePlayer {
  static const _channel = MethodChannel('flutter_ios_ringtone_player');

  static Future<String?> getPlatformVersion() async {
    return await _channel.invokeMethod<String>('getPlatformVersion');
  }

  static Future<void> play({required int soundId}) async {
    await _channel.invokeMethod<void>('play', {
      'soundId': soundId,
    });
  }

  static Future<void> stop({required int soundId}) async {
    await _channel.invokeMethod<void>('stop', {
      'soundId': soundId,
    });
  }
}
