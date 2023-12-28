package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 非接寻卡过程监听接口定义
 *
 * \_en_
 * @brief listener of CTLS search
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see
 */
interface RFSearchListener {
	/**
     * \en_
     * @brief on card pass
     *
	 * @param cardType the card type<BR>
	 * <ul><BR>
     * <li>S50_CARD(0x00) S50, mifare card</li><BR>
     * <li>S70_CARD(0x01) - S70, mifare card</li><BR>
     * <li>PRO_CARD(0x02) - PRO card</li><BR>
     * <li>S50_PRO_CARD(0x03) - S50 PRO card</li><BR>
     * <li>S70_PRO_CARD(0x04) - S70 PRO card </li><BR>
     * <li>CPU_CARD_A(0x05) - CPU A card(contactless card)</li><BR>
     * <li>CPU_CARD_B(0x06) - CPU B card(contactless card)</li><BR>
     * <li>Mifare_UltraLight(0x07) - Mifare UltraLight card(M0)</li><BR>
     * <li>Mifare_Desfire(0x08) - Mifare Desfire card(M3)</li><BR>
	 * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	void onCardPass(int cardType);
	
	/**
     * \en_
     * @brief on failure
     *
	 * @param error the error code<BR>
	 * <ul><BR>
	 * <li>ERROR_TRANSERR(0xA2) error on transation, communication</li><BR>
	 * <li>ERROR_PROTERR(0xA3) the response is illegal</li><BR>
	 * <li>ERROR_MULTIERR(0x84)multi-cards found</li><BR>
	 * <li>ERROR_CARDTIMEOUT(0xA7) timeout</li><BR>
	 * <li>ERROR_CARDNOACT(0xB3) card (pro, typeB) not actived</li><BR>
	 * <li>ERROR_MCSERVICE_CRASH(0xff01) mater service crash</li><BR>
	 * <li>ERROR_REQUEST_EXCEPTION(0xff02) request exception </li><BR>
	 * </ul><BR>
	 * @param message - the message
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	void onFail(int error, String message);
}
