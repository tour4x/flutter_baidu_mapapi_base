import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_baidu_mapapi_base_method_channel.dart';

abstract class FlutterBaiduMapapiBasePlatform extends PlatformInterface {
  /// Constructs a FlutterBaiduMapapiBasePlatform.
  FlutterBaiduMapapiBasePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBaiduMapapiBasePlatform _instance = MethodChannelFlutterBaiduMapapiBase();

  /// The default instance of [FlutterBaiduMapapiBasePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBaiduMapapiBase].
  static FlutterBaiduMapapiBasePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBaiduMapapiBasePlatform] when
  /// they register themselves.
  static set instance(FlutterBaiduMapapiBasePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
