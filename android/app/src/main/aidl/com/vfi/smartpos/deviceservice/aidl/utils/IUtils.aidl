// IUtils.aidl
package com.vfi.smartpos.deviceservice.aidl.utils;

import com.vfi.smartpos.deviceservice.aidl.utils.IImage;
import com.vfi.smartpos.deviceservice.aidl.utils.IStrUtils;

interface IUtils {
    IImage getImage();
    IStrUtils getStrUtils();
}
