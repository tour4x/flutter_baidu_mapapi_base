import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_baidu_mapapi_base_platform_interface.dart';

/// An implementation of [FlutterBaiduMapapiBasePlatform] that uses method channels.
class MethodChannelFlutterBaiduMapapiBase extends FlutterBaiduMapapiBasePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_baidu_mapapi_base');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
