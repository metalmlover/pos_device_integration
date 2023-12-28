// IAppInstallObserver.aidl
package com.vfi.smartpos.system_service.aidl;

interface IAppInstallObserver {
    /* Install Callback：returnCode：0-sucess，other value-fail */
    void onInstallFinished(String packageName,int returnCode);
}
