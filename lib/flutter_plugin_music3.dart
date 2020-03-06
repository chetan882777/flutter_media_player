import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginMusic3 {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_music3');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get pauseAudio async {
    final String version = await _channel.invokeMethod('pauseAudio');
    return version;
  }

  static Future<String> get playAudio async {
    final String version = await _channel.invokeMethod('payAudio');
    return version;
  }
}
