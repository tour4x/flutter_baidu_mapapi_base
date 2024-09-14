import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos';

import { CoordType, getAppIdentifier, Initializer, VersionInfo } from '@bdmap/base';

/** FlutterBmfbasePlugin **/
export default class FlutterBmfbasePlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;

  constructor() {
  }

  getUniqueClassName(): string {
    return "FlutterBmfbasePlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_bmfbase");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  private kSetAPIKey : string = 'flutter_bmfbase/sdk/setApiKey';

  /// 隐私政策

  private kSetPrivacyAPIKey : string = 'flutter_bmfbase/sdk/setAgreePrivacy';

  private getNativeBaseVersion : string = 'flutter_bmfbase/sdk/getNativeBaseVersion'

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "getPlatformVersion") {
      result.success("OpenHarmony ^ ^ ")
    } else if (call.method == this.kSetPrivacyAPIKey) {
      getAppIdentifier().then((value) => console.info('获取appIdentifier' + ':' + value))
      let isAgree : boolean = call.argument('isAgree')
      console.info(this.kSetPrivacyAPIKey + ':' + isAgree)
    } else if (call.method == this.kSetAPIKey) {
      getAppIdentifier().then((value) => console.info('获取appIdentifier' + ':' + value))
      let apiKey : string = call.argument('apiKey')
      console.info(this.kSetAPIKey + ':' + apiKey)
      Initializer.getInstance().initialize(apiKey)
      Initializer.coordType = CoordType.GCJ02//flutter地图类型和ohos不一致，固定gcj02
    }else if (call.method == this.getNativeBaseVersion) {
      let version : string = VersionInfo.getApiVersion()
      console.info(this.getNativeBaseVersion + ':' + version)
      result.success({'version':version})
    }else {
      result.notImplemented()
    }
  }
}