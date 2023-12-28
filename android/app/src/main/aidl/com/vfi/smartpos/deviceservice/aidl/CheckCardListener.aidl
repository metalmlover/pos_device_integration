package com.vfi.smartpos.deviceservice.aidl;

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
 *
 * \cn_
 * @brief 检卡过程监听接口定义
 *
 * \_en_
 * @brief the listener of check card
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface CheckCardListener {
	/**
     * \cn_
     * @brief 检测到磁条卡
     *
	 * @param track - 磁卡数据 | the track information
	 * <ul>
     * <li>PAN(String) - 主账号（卡号）| the main / pan number</li>
     * <li>TRACK1(String) - 磁道1数据 | track No.1 </li>
     * <li>TRACK2(String) - 磁道2数据 | track No.2 </li>
     * <li>TRACK3(String) - 磁道3数据 | track No.3 </li>
     * <li>SERVICE_CODE(String) - 服务码 | service code </li>
     * <li>EXPIRED_DATE(String) - 卡片有效期 | the valid date (before) </li>
	 * </ul>
     * \_en_
     * @brief found magnetic card
     *
	 * @param track the track information
	 * <ul>
     * <li>PAN(String) the main / pan number</li>
     * <li>TRACK1(String) track 1 </li>
     * <li>TRACK2(String) track 2 </li>
     * <li>TRACK3(String) track 3 </li>
     * <li>SERVICE_CODE(String) service code </li>
     * <li>EXPIRED_DATE(String) the expired date </li>
	 * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see onCardPowerUp, onCardActivate
	 */
	void onCardSwiped(in Bundle track);
	
	/**
     * \cn_
     * @brief IC卡上电成功
     *
     * \_en_
     * @brief found smart card
     *
     * run the IPBOC#startEMV to start EMV workflow
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IPBOC#startEMV
     *
	 */
	void onCardPowerUp();
	
	/**
     * \cn_
     * @brief 非接卡激活成功
     *
     * \_en_
     * @brief found contactless card
     *
     * run the IPBOC#startEMV to start EMV workflow
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IPBOC#startEMV
     *
	 */
	void onCardActivate();
	
	/**
     * \cn_
     * @brief 检卡超时
     *
     * \_en_
     * @brief timeout
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */	
	void onTimeout();
	
	/**
     * \cn_
     * @brief 检卡出错
     *
	 * @param error - 错误码 | the error code
	 * <ul>
	 * <li>SERVICE_CRASH(99) - 服务崩溃 </li>
	 * <li>REQUEST_EXCEPTION(100) - 请求异常</li>
	 * <li>MAG_SWIPE_ERROR(1) - 刷卡失败</li>
	 * <li>IC_INSERT_ERROR(2) - 插卡失败</li>
	 * <li>IC_POWERUP_ERROR(3) - 卡上电失败</li>
	 * <li>RF_PASS_ERROR(4) - 非接挥卡失败</li>
	 * <li>RF_ACTIVATE_ERROR(5) - 非接卡激活失败</li>
	 * <li>MULTI_CARD_CONFLICT_ERROR(6) - 多卡冲突</li>
	 * <li>M1_CARD_UNSUPPORT_EMV_ERROR(7) - [M1Sn]M1卡不支持EMV</li>
	 * </ul>
	 * @param message - 错误描述
     * \_en_
     * @brief While error got
     *
	 * @param error the error code
	 * <ul>
	 * <li>SERVICE_CRASH(99) - service crash </li>
	 * <li>REQUEST_EXCEPTION(100) - request cause exception</li>
	 * <li>MAG_SWIPE_ERROR(1) - read magnetic error</li>
	 * <li>IC_INSERT_ERROR(2) - read smart card error</li>
	 * <li>IC_POWERUP_ERROR(3) - smart card cannot power up</li>
	 * <li>RF_PASS_ERROR(4) - read contactless card error</li>
	 * <li>RF_ACTIVATE_ERROR(5) - contactless card active error</li>
	 * <li>MULTI_CARD_CONFLICT_ERROR(6) - found multi-cards</li>
	 * <li>M1_CARD_UNSUPPORT_EMV_ERROR(7) - [M1Sn]M1 card unsupport in EMV process</li>
	 * </ul>
	 * @param message the description.
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */	
	void onError(int error, String message);
}
