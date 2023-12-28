package com.vfi.smartpos.system_service.aidl.settings;

public class SettingsActions {

    public class SystemTimeActions {
        //set system time sync auto network time
        public static final String SET_AUTO_SYSTEM_TIME_STATE = "SET_AUTO_SYSTEM_TIME_STATE";
        //set system time zone sync auto network time zone
        public static final String SET_AUTO_SYSTEM_TIME_ZONE_STATE = "SET_AUTO_SYSTEM_TIME_ZONE_STATE";
        //set system time, time format is yyyyMMdd HHmmss
        public static final String SET_SYSTEM_TIME = "SET_SYSTEM_TIME";
        //set system time zone
        public static final String SET_SYSTEM_TIME_ZONE = "SET_SYSTEM_TIME_ZONE";
        //get system time whether to sync auto network time
        public static final String GET_AUTO_SYSTEM_TIME_STATE = "GET_AUTO_SYSTEM_TIME_STATE";
        //get system time zone whether to sync auto network time zone
        public static final String GET_AUTO_SYSTEM_TIME_ZONE_STATE = "GET_AUTO_SYSTEM_TIME_ZONE_STATE";
        //get system time hour format; is 24 or 12
        public static final String GET_SYSTEM_TIME_HOUR_FORMAT = "GET_SYSTEM_TIME_HOUR_FORMAT";
    }

    public class LauncherActions {
        //set default launcher, but efficient after reboot.
        public static final String SET_LAUNCHER = "SET_LAUNCHER";
    }
}
