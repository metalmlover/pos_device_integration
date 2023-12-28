package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 磁条卡刷卡结果回调
 *
 * \_en_
 * @brief the call back of magnetic card
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see IMagCardReader, IMagCardReader#searchCard
 *
 * @author: baoxl
 */
interface MagCardListener {
	/**
     * \cn_
     * @brief 刷卡成功回调
     *
	 * @param track - 磁卡数据对象 | the card information
     * <ul>
     * <li>PAN(String) - 主账号（卡号）| the PAN</li>
     * <li>TRACK1(String) - 磁道1数据 | the track 1</li>
     * <li>TRACK2(String) - 磁道2数据 | track 2</li>
     * <li>TRACK3(String) - 磁道3数据 | track 3</li>
     * <li>SERVICE_CODE(String) - 服务码 | the service code</li>
     * <li>EXPIRED_DATE(String) - 卡片有效期 | the expired date</li>
     * </ul>
     * \_en_
     * @brief Success while IMagCardReader#searchCard found magnetic card
     *
	 * @param track the card information
     * <ul>
     * <li>PAN(String) the PAN</li><BR>
     * <li>TRACK1(String) the track 1</li><BR>
     * <li>TRACK2(String) track 2</li><BR>
     * <li>TRACK3(String) track 3</li><BR>
     * <li>SERVICE_CODE(String) the service code</li><BR>
     * <li>EXPIRED_DATE(String) the expired date</li><BR>
     * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	void onSuccess(in Bundle track);

	/**
     * \cn_
     * @brief 刷卡失败回调
     *
     * \_en_
     * @brief Error while IMagCardReader#searchCard found magnetic card
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
      *  |
      * @param error - 错误码 | the error code
      * <ul>
      * <li>SERVICE_CRASH(99) - 服务崩溃 | service crash</li>
      * <li>REQUEST_EXCEPTION(100) - 请求异常 | request exception</li>
      * <li>MAG_SWIPE_ERROR(1) - 刷卡失败 | magnetic card swipe failure</li>
      * </ul>
      * @param message - 错误描述 | the message
      */
     void onError(int error,String message );
	
	/**
     * \cn_
     * @brief
     *
     * \_en_
     * @brief
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 * 刷卡超时回调 | timeout occur
	 */
	void onTimeout();
}
