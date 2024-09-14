import { CoordType, Initializer, VersionInfo } from '@bdmap/base';
/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import common from '@ohos.app.ability.common';
import { FlutterPage, MethodCall, MethodResult } from '@ohos/flutter_ohos'

let storage = LocalStorage.getShared()
const EVENT_BACK_PRESS = 'EVENT_BACK_PRESS'

@Entry(storage)
@Component
struct Index {
  private context = getContext(this) as common.UIAbilityContext
  @LocalStorageLink('viewId') viewId: string = "";

  build() {
    Column() {
      FlutterPage({ viewId: this.viewId })
    }
  }

  onBackPress(): boolean {
    this.context.eventHub.emit(EVENT_BACK_PRESS)
    return true
  }

  private kSetAPIKey : string = 'flutter_bmfbase/sdk/setApiKey';

  /// 隐私政策
  private kSetPrivacyAPIKey : string = 'flutter_bmfbase/sdk/setAgreePrivacy';

  private getNativeBaseVersion : string = 'flutter_bmfbase/sdk/getNativeBaseVersion'

  onMethodCall(call: MethodCall, result: MethodResult): void {
      if (call.method == "getPlatformVersion") {
        result.success("OpenHarmony ^ ^ ")
      } else if (call.method == this.kSetPrivacyAPIKey) {
        let isAgree : boolean = call.argument('isAgree')
        console.info(this.kSetPrivacyAPIKey + isAgree)
      } else if (call.method == this.kSetAPIKey) {
        let apiKey : string = call.argument('apiKey')
        console.info(this.kSetAPIKey + apiKey)
        Initializer.getInstance().initialize(apiKey)
        Initializer.coordType = CoordType.GCJ02
      }else if (call.method == this.getNativeBaseVersion) {
        let version : string = VersionInfo.getApiVersion()
        console.info(this.getNativeBaseVersion + version)
        result.success({'version':version})
      }else {
        result.notImplemented()
      }
    }
}