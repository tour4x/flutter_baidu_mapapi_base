import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base_method_channel.dart';

void main() {
  MethodChannelFlutterBaiduMapapiBase platform = MethodChannelFlutterBaiduMapapiBase();
  const MethodChannel channel = MethodChannel('flutter_baidu_mapapi_base');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
