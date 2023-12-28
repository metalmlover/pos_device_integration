// SystemService.aidl
package com.vfi.smartpos.system_service.aidl;

import android.os.Bundle;
import com.vfi.smartpos.system_service.aidl.IAppInstallObserver;
import com.vfi.smartpos.system_service.aidl.IAppDeleteObserver;
import com.vfi.smartpos.system_service.aidl.networks.INetworkManager;
import com.vfi.smartpos.system_service.aidl.settings.ISettingsManager;

interface ISystemManager {
	/**
	 * Install an apk <br/>
	 * @param apkPath - apk's absolute url.
	 * @param observer - callback handler.
	 * @param installerPackageName - packagename of installer apk.
	 */
    void installApp(String apkPath, IAppInstallObserver observer, String installerPackageName);

	/**
	 * remove an apk <br/>
	 * @param packageName - package name which need to remove.
	 * @param observer - callback handler.
	 */
    void uninstallApp(String packageName, IAppDeleteObserver observer);
    void reboot();

    void isMaskHomeKey(boolean state);
    void isMaskStatusBard(boolean state);

    boolean chekcK21Update(String sysBin, String appBin);
    void updateROM(String zipPath);

    INetworkManager getNetworkManager();

    /*
    Status list:
    0: off
    1: sensor only
    2: battery saving
    3: high accuracy

    Tip:
    If turn on status 2 or 3 from 0 or 1,
    system will pop up a window to let user allow IZat for hardware acceleration
    */
    void setLocationMode( int status );

    /**
    * return ADB command is enable or not
    */
    boolean isAdbMode();

    /**
    * kill application
    *
    * packageName: application packageName;
    */
    boolean killApplication(String packageName);

    /**
    * restart application
    *
    * packageName: application packageName;
    */
    boolean restartApplication(String packageName);

    /**
    * init logcat configuration.
    *
    * logcatBufferSize: set logcat buffer size.
    * if logcatBufferSize == 0, set default logcat buffer size
    * logcatBufferSizeSuffix: set logcat buffer size suffix. 0: "M", 1: "K".
    */
    void initLogcat(int logcatBufferSize, int logcatBufferSizeSuffix, in Bundle bundle);

    /**
    * get log buffer file
    *
    * logcatFileName: specify the log file name
    * if logcatFileName == null, set default logcat file name
    * compressType: set logcat compress type. 0: "none", 1: "gz".
    *
    * user needs to delete log file.
    * if the log file locates in default log path, it will be deleted 7 days after creation.
    */
    String getLogcat(String logcatFileName, int compressType);

    /**
    * Get the usage count of all apps to be used at the specific time range
    *
    * @param beginTime get apps info begin time
    * For example, beginTime = Calendar.getInstance().setDate(date).getTimeInMillis();
    * @param endTime get apps info end time
    * For example, endTime = Calendar.getInstance().getTimeInMillis();
    * @Bundle "UsageStatsList" : json string of List<UsageStats> object.
    */
    Bundle getLaunchAppsInfo(long beginTime, long endTime);

    /**
    * get SettingsManager to execute settings actions
    * @return ISettingsManager
    **/
    ISettingsManager getSettingsManager();
}
