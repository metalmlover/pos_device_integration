package com.vfi.smartpos.deviceservice.aidl;

/**
 * 打印结果监听器 | listener of printer
 * @author: baoxl
 */
interface PrinterListener {
	/**
	 * 打印成功回调 | on print finished
	 */
	void onFinish();
	
	/**
	 * 打印失败回调 | on error occur
	 * @param error - 错误码 | the error code
	 */
	void onError(int error);
}
