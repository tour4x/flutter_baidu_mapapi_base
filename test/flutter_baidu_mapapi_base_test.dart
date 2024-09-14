import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base_platform_interface.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBaiduMapapiBasePlatform
    with MockPlatformInterfaceMixin
    implements FlutterBaiduMapapiBasePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBaiduMapapiBasePlatform initialPlatform = FlutterBaiduMapapiBasePlatform.instance;

  test('$MethodChannelFlutterBaiduMapapiBase is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBaiduMapapiBase>());
  });

  test('getPlatformVersion', () async {
    FlutterBaiduMapapiBase flutterBaiduMapapiBasePlugin = FlutterBaiduMapapiBase();
    MockFlutterBaiduMapapiBasePlatform fakePlatform = MockFlutterBaiduMapapiBasePlatform();
    FlutterBaiduMapapiBasePlatform.instance = fakePlatform;

    expect(await flutterBaiduMapapiBasePlugin.getPlatformVersion(), '42');
  });
}
