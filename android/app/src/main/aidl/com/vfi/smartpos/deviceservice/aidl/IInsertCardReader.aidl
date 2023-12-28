package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 接触式IC读卡器对象
 *
 * \_en_
 * @brief the object of smart card (contact card, or IC card)
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see IMagCardReader IRFCardReader
 *
 * @author: baoxl
 */
interface IInsertCardReader {
	/**
     * \cn_
     * @brief 卡上电
     *
	 * @return 上电成功true，上电失败false
     * \_en_
     * @brief power up the card
     *
	 * @return true for success, false for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see powerDown
     *
	 */
	boolean powerUp();
	
	/**
     * \cn_
     * @brief 卡下电
     *
	 * @return 关闭成功true，失败false。
     * \_en_
     * @brief power down the card
     *
	 * @return true for success, false for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see powerUp
	 *
	 */
	boolean powerDown();
	
	/**
     * \cn_
     * @brief 卡片是否在位
     *
	 * @return 卡在位true，卡不在位false。
     * \_en_
     * @brief check if the card avalible
     *
	 * @return true for available, false for unavailable
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 *  |
	 */
	boolean isCardIn();
	
	/**
     * \cn_
     * @brief APDU数据通讯
     *
	 * @param apdu - apdu数据
	 * @return 成功返回卡片应答数据，失败返回null。
     * \_en_
     * @brief execute an apdu command
     *
	 * @param apdu apdu command input
	 * @return response of the command, null means no response got
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	byte[] exchangeApdu(in byte[] apdu);

	/**
     * \cn_
     * @brief PSAM卡卡片是否在位
     *
     * @return 卡在位true，卡不在位false。
     * \_en_
     * @brief
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
     */
    boolean isPSAMCardExists();
}
