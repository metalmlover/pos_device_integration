package com.vfi.smartpos.deviceservice.aidl;

/**
 * 读手机芯片卡结果监听器 | the listener of uni-pay mobile card
 * @author: baoxl
 */
interface UPCardListener {
	/**
	 * 读卡成功回调 | on success
	 * @param data - 芯片卡卡数据 | the date
	 * <ul>
     * <li>PAN(String) - 主账号（卡号）| PAN</li>
     * <li>TRACK2(String) - 磁道2数据 | track 2</li>
     * <li>TRACK3(String) - 磁道3数据 | track 3</li>
     * <li>CARD_SN(String) - 卡片序列号 | card serial number</li>
     * <li>EXPIRED_DATE(String) - 卡片有效期 | expired date</li>
     * <li>TLV_DATA(String) - 带标签（DF32，DF33，DF34）TLV数据 | the TLV date, DF32, DF33, DF34 </li>
	 * </ul>
	 */
	void onRead(out Bundle data);
	
	/**
	 * 读卡错误回调 | on error
	 * @param error - 错误码 | the error code
	 * <ul>
	 * <li>ERROR_DETECT_CARD(1) - 识别卡失败 | error on detect card</li>
	 * <li>ERROR_READ_SN(2) - 读卡序列号失败 | error on read serial number</li>
	 * <li>ERROR_READ_TRACK(3) - 读卡信息失败 | error on read track information</li>
	 * <li>ERROR_SERVICE_CRASH(4) - 设备服务异常 | service crash </li>
	 * <li>ERROR_NULL_DRIVER(5) - 非接驱动为null | not CTLS driver</li>
	 * </ul>
	 * @param message - 错误描述
	 */	
	void onError(int error, String message);
}
