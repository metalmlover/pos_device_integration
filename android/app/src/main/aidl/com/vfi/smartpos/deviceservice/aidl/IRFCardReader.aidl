package com.vfi.smartpos.deviceservice.aidl;

import com.vfi.smartpos.deviceservice.aidl.RFSearchListener;

/**
 * \cn_
 * @brief 非接触式IC读卡器对象
 *
 * \_en_
 * @brief the object of Contactless card, Mifare card, Memory card
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see IMagCardReader IInsertCardReader
 *
 *
 * @author: baoxl
 */
interface IRFCardReader {
	/**
     * \cn_
     * @brief 非接寻卡上电
     *
	 * @param listener - 寻卡监听器
	 * @param timeout - 超时时间
     * \_en_
     * @brief search card
     *
	 * @param listener the call back listener
	 * @param timeout timeout in second, should >= 1 sec
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see stopSearch RFSearchListener
     *
	 */
	void searchCard(RFSearchListener listener, int timeout);
	
	/**
     * \cn_
     * @brief 停止寻卡操作
     *
     * \_en_
     * @brief stop search
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	void stopSearch();
	
	/**
     * \cn_
     * @brief 激活卡片
     *
	 * @param driver - 驱动名称
	 * <ul>
     * <li>"S50" - S50卡</li>
     * <li>"S70" - S70卡</li>
     * <li>"CPU" - CPU卡</li>
     * <li>"PRO" - PRO、S5O_PRO、S70_PRO卡</li>
	 * </ul>
	 * @param responseData - 激活卡片应答数据
	 * @return 返回0表示激活成功，其他失败。
     * \_en_
     * @brief active the card
     *
	 * @param driver the driver name
	 * <ul>
     * <li>"S50" - S50(M1) card</li><BR>
     * <li>"S70" - S70(M1) card</li><BR>
     * <li>"CPU" - CUP card</li><BR>
     * <li>"PRO" - PRO、S5O_PRO、S70_PRO</li><BR>
	 * </ul>
	 * @param responseData - the response data from the card
	 * @return 0 for success, others means failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	int activate(String driver, out byte[] responseData);
	
	/**
     * \cn_
     * @brief 同stopSearch
     *
     * \_en_
     * @brief same as stopSearch
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see stopSearch
	 *
	 */
	void halt();

	/**
     * \cn_
     * @brief 卡片是否在位
     *
	 * @return 卡在位true，卡不在位false。
     * \_en_
     * @brief check the card is present
     *
	 * @return true while the card is exist, false while the card is not present
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 *
	 */
	boolean isExist();
	
	/**
     * \cn_
     * @brief APDU数据通讯
     *
	 * @param apdu - apdu数据 | the APDU
	 * @return 成功返回卡片应答数据。 | @return the response APDU
     * \_en_
     * @brief exchange APDU command
     *
	 * @param apdu - the APDU
	 * @return the response APDU
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	byte[] exchangeApdu(in byte[] apdu);
	
	/**
     * \cn_
     * @brief 卡片复位
     *
	 * @return 卡片复位应答数据。
     * \_en_
     * @brief reset the card
     *
	 * @return the response from the card
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	byte[] cardReset();

	/**
     * \cn_
     * @brief 认证(根据块号) | author the block (with given block No.)
     *
	 * <ul>
	 * <li>对卡执行读写，修改的操作时必须先进行认证，而且同时只能认证一个扇区，在对不同的扇区进行操作时需要再做认证。</li><br/>
	 * <li>该接口需要指定认证块的具体位置</li>
	 * </ul>
	 * @param blockNo 块号，从0开始 | the block No.(index) start at 0
	 * @param keyType 密钥类型 KEY_A(0) 或者 KEY_B(1) | the key type, KEY_A or KEY_B
	 * @param key     密钥，6字节长 | the key, length: 6
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief author the block (with given block No.)
     *
	 * @param blockNo the block No.(index) start at 0
	 * @param keyType the key type, KEY_A(0) or KEY_B(1)
	 * @param key     the key, length: 6
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see authSector
     *
	 *
	 */
	int authBlock(int blockNo, int keyType, in byte[] key);
	
    /**
     * \cn_
     * @brief 认证(根扇区号)
     *
	 * <ul>
	 * <li>对卡执行读写，修改的操作时必须先进行认证，而且同时只能认证一个扇区，在对不同的扇区进行操作时需要再做认证。</li><br/>
	 * <li>该接口只需要指定要操作的扇区，会自动对该扇区的第3块(从0起)进行认证操作</li>
	 * </ul>
	 * @param sectorNo 	扇区号，从0开始 | the sector No.(index) start at 0.
	 * @param keyType	密钥类型 KEY_A 或者 KEY_B | the key type KEY_A or KEY_B
	 * @param key		密钥,6字节长 | the key, length: 6
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief author the sector ( with given sector No.)
     *
	 * @param sectorNo 	the sector No.(index) start at 0.
	 * @param keyType	the key type KEY_A(0) or KEY_B(1)
	 * @param key		the key, length: 6
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see authBlock
     *
	 */
	int authSector(int sectorNo, int keyType, in byte[] key);
	
	/**
     * \cn_
     * @brief 读块数据
     *
	 * @param blockNo - 块号 | the block No.
	 * @param data - 读取返回的块数据(16字节数据) | the data from the block, length: 16
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief read a block
     *
	 * @param blockNo the block No.
	 * @param data the data from the block, length: 16
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see writeBlock
     *
	 *
	 */
	int readBlock(int blockNo, out byte[] data);
	
	/**
     * \cn_
     * @brief 写块数据
     *
     * 必须是16个字节的数据，没有达到字节数将认为是错误。
	 * @param blockNo - 块号 | the block No.
	 * @param data - 指定数据写到指定的块里 | the source data
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief write a block
     *
     * The length MUST be 16, others will cause error
	 * @param blockNo the block No.
	 * @param data the source data
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see readBlock
     *
	 *
	 */
	int writeBlock(int blockNo, in byte[] data);
	
	/**
     * \cn_
     * @brief 加值
     *
     * 把指定的值加至一数值块中
	 * @param blockNo - 块号 | the block No.
	 * @param value - 数据 | the value
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief increase value
     *
     * increase the value on given block
	 * @param blockNo the block No.
	 * @param value the value
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see decreaseValue
     *
	 *
	 *
	 */
	int increaseValue(int blockNo, int value);
	
	/**
     * \cn_
     * @brief 减值
     *
	 * 从一数值块中减去指定的值 | decrease the value on given block<br/>
	 * @param blockNo - 块号 | the block No.
	 * @param value - 数据 | the value
	 * @return 成功0x00，其他失败 | 0 means success, others while failure
     * \_en_
     * @brief decrease value
     *
	 * decrease the value on given block
	 * @param blockNo the block No.
	 * @param value the value
	 * @return 0 means success, others while failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see increaseValue
	 */
	int decreaseValue(int blockNo, int value);

	/**
     * \en_
     * @brief get card info in RFSearchListener.onCardPass callback
     *
	 * @return bundle of cardInfo
     * <ul>
     *     <li>sn(ByteArray)</li>
     *     <li>...</li>
     * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see RFSearchListener.onCardPass
	 */
	Bundle getCardInfo();

	/**
     * \en_
     * @brief restore blockNo
	 * @param blockNo the block No.
     *
	 * @return result 0x00-sucess; 0x01-blockNo error; 0x02-operate failed; 0xff-other error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	byte restore(byte blockNo);

	/**
     * \en_
     * @brief transfer blockNo
	 * @param blockNo set block No.
     *
	 * @return result 0x00-sucess; 0x01-blockNo error; 0x02-operate failed; 0xff-other error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	byte transfer(byte blockNo);

	/**
     * \en_
     * @brief Close Rf Field
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	void CloseRfField();
}
