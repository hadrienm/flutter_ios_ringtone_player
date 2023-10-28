import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_ringtone_player/flutter_ios_ringtone_player.dart';
import 'package:flutter_ios_ringtone_player/flutter_ios_ringtone_player_platform_interface.dart';
import 'package:flutter_ios_ringtone_player/flutter_ios_ringtone_player_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIosRingtonePlayerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIosRingtonePlayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIosRingtonePlayerPlatform initialPlatform = FlutterIosRingtonePlayerPlatform.instance;

  test('$MethodChannelFlutterIosRingtonePlayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIosRingtonePlayer>());
  });

  test('getPlatformVersion', () async {
    FlutterIosRingtonePlayer flutterIosRingtonePlayerPlugin = FlutterIosRingtonePlayer();
    MockFlutterIosRingtonePlayerPlatform fakePlatform = MockFlutterIosRingtonePlayerPlatform();
    FlutterIosRingtonePlayerPlatform.instance = fakePlatform;

    expect(await flutterIosRingtonePlayerPlugin.getPlatformVersion(), '42');
  });
}
