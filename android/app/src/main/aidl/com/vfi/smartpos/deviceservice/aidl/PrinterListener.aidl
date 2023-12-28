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
	 * <ul>
	 * <li>ERROR_NONE(0x00) - normal</li>
	 * <li>ERROR_PAPERENDED(0xF0) - Paper out</li>
	 * <li>ERROR_NOCONTENT(0xF1) - no content</li>
     * <li>ERROR_HARDERR(0xF2) - printer error</li>
     * <li>ERROR_OVERHEAT(0xF3) - over heat</li>
     * <li>ERROR_NOBM(0xF6) - no black mark</li>
     * <li>ERROR_BUSY(0xF7) - printer is busy</li>
     * <li>ERROR_MOTORERR(0xFB) - moto error</li>
     * <li>ERROR_LOWVOL(0xE1) - battery low</li>
     * <li>ERROR_NOTTF(0xE2) - no ttf</li>
     * <li>ERROR_BITMAP_TOOWIDE(0xE3) - width of bitmap too wide</li>
     * </ul>
	 */
	void onError(int error);
}
