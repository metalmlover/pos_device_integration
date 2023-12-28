// IAppDeleteObserver.aidl
package com.vfi.smartpos.system_service.aidl;

interface IAppDeleteObserver {
    /* Del Callback returnCode：0-sucess，other value-fail */
    void onDeleteFinished(String packageName,int returnCode);
}
