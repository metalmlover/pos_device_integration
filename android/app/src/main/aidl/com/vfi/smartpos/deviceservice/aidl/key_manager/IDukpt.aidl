// IDukpt.aidl
package com.vfi.smartpos.deviceservice.aidl.key_manager;

// Declare any non-default types here with import statements

interface IDukpt {

	/**
     * \en_
     * @brief load the DUKPT key
     *
	 * @param keyId the id (index 0~4)
	 * @param ksn the key serial number
	 * @param key the key
	 * @param checkValue the check value (default NULL)
	 * @param extend - extend param
     * <ul>
     *     <li>isPlainKey(boolean) default value is true(key is plain key), value is false means the key is a encrypt key that encrypt by TEK</li>
     *     <li>TEKIndex(int) index of TEK,if isPlainKey is false, need to set this paramater</li>
     *     <li>KSNAutoIncrease(boolean) default value is true, if value is false, application use increaseKSN() to  increase KSN manually</li>
     * </ul>
	 * @return true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see increaseKSN
     *
	 */
	boolean loadDukptKey(int keyId, in byte[] ksn, in byte[] key, in byte[] checkValue, in Bundle extend);

	byte[] increaseKSN(int index);

	/**
     * \en_
     * @brief calcute the MAC with given type
     *
	 * @param keyId the index of dukpt key(0~4)
	 * @param type Calculation mode <BR>
	 *     |---0x00-MAC X99;<BR>
	 *     |---0x01-MAC X919;<BR>
	 *     |---0x02-ECB (CUP standard ECB algorithm);<BR>
	 *     |---0x03-MAC 9606;<BR>
	 *     |---0x04-CBC MAC calculation;<BR>
	 * @param CBCInitVec - CBC initial vector. fixed length 8, can be null, default 8 bytes 0x00
	 * @param data the source date
	 * @param desType encrypt type<BR>
     *     |--0x00-des<BR>
     *     |--0x01-3des<BR>
     *     |--0x02-sm4<BR>
     *     |--0x03-aes<BR>
	 * @param extend - extend param
     * <ul>
     *     <li>variantRequestKey(boolean) true-Message Authentication, request or both ways; false-Message Authentication, response(default)</li>
     * </ul>
	 * @return the mac value, null means failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see loadWorkKey loadWorkKeyWithDecryptType calcMAC
	 */
    byte[] calculateMAC(int keyId, int type, in byte[] CBCInitVec, in byte[] data, int desType, in Bundle extend);

    /**
     * \en_
     * @brief encrypt data
     * @param encryptType<BR>
     *    |---TYPE_DES - 0x00 DES Type<BR>
     *    |---TYPE_3DES - 0x01 3DES Type<BR>
     *    |---TYPE_SM4 - 0x02 SM4 Type<BR>
     *    |---TYPE_AES - 0x03 AES Type<BR>
	 * @param algorithmModel<BR>
	 *     |--0x01 CBC encrypt<BR>
	 *     |--0x02 ECB encrypt<BR>
	 *     |--0x03 CBC decrypt<BR>
	 *     |--0x04 ECB decrypt<BR>
	 * @param data the source date
	 * @param initVec cbc init vector
	 * @param extend - extend param
     * <ul>
     *     <li class="strike">variantRequestKey(boolean) true-Data Encryption request or both ways; false-Data Encryption response(default)</li>
     *     <li>dukptDispersionType(byte)</li> <BR>
     *           |---0x00 Data Encryption request or both ways<BR>
     *           |---0x01 Data Encryption response (default)<BR>
     *           |---0x02 Customize, use Pin Variant constant<BR>
     * </ul>
     *
     * @return the encrypted data, null means failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
     * <br/>
     */
	byte[] calculateData(int keyId, int encryptType, int algorithmModel, in byte[] data, in byte[] initVec, in Bundle extend);

    /**
     * \en_
     * @brief get the current KSN
     *
     * @return the current dukpt ksn
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	 byte[] getDukptKsn(int keyIdx);

    /**
     * \en_
     * @brief get the last error
     *
     * @return the description of the last error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
	String getLastError();

    /**
     * \en_
     * @brief get dukpt config file for debug(just support debug version service)
     * @return true-success false-failed
     * \en_e
     * \code{.java}
     * \endcode
     * @version 2.6.0.0
     * @see
     */
	boolean getDukptCFG(String savePath);


    /**
     * \en_
     * @brief set dukpt config file
	 * @param keyData
     * <ul>
     *     <li>keyId(int)</li>
     *     <li>ksn(String) optional, keep current value if not set</li>
     *     <li>autoIncrease(boolean) optional, keep current value if not set</li>
     * </ul>
     * @return true-success false-failed
     * \en_e
     * \code{.java}
     * \endcode
     * @version 2.6.0.0
     * @see
     */
	boolean setDukptCFG(in Bundle keyData);
}
