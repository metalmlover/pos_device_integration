// IStrUtils.aidl
package com.vfi.smartpos.deviceservice.aidl.utils;

// Declare any non-default types here with import statements

interface IStrUtils {
    String bytes2HexStr(in byte[] data);
    byte[] hexStr2Bytes(String data);
}
