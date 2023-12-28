// IEMV.aidl
package com.vfi.smartpos.deviceservice.aidl;
import com.vfi.smartpos.deviceservice.aidl.CheckCardListener;
import com.vfi.smartpos.deviceservice.aidl.UPCardListener;
import com.vfi.smartpos.deviceservice.aidl.EMVHandler;
import com.vfi.smartpos.deviceservice.aidl.OnlineResultHandler;
import com.vfi.smartpos.deviceservice.aidl.CandidateAppInfo;
import com.vfi.smartpos.deviceservice.aidl.DRLData;
import com.vfi.smartpos.deviceservice.aidl.BLKData;
import com.vfi.smartpos.deviceservice.aidl.IssuerUpdateHandler;
import com.vfi.smartpos.deviceservice.aidl.EMVTransParams;

/**
 * \_en_
 * @brief EMV object for processing EMV
 *
 * \en_e
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface IEMV {
    /**
     * \_en_
     * @brief check card, non-block method
     *
     * @param cardOption the card type (list)
     * <ul>
     * <li>supportMagCard(boolean) support magnetic card</li>
     * <li>supportSmartCard(boolean) support Smart card</li>
     * <li>supportCTLSCard(boolean) support CTLS card</li>
     * </ul>
     * @param timeout the time out(seconds)
     * @param listener the listerner while found card
     * @version
     * @see stopCheckCard startEMV CheckCardListener
     */
	void checkCard(in Bundle cardOption, int timeout, CheckCardListener listener);

    /**
     * \_en_
     * @brief stop check card
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see checkCard startEMV CheckCardListener
     */
	void stopCheckCard();

    /**
     * \_en_
     * @brief start EMV process
     *
     * @param transflow processing type
     * <ul>
     * <li>1：EMV processing</li>
     * <li>2：EMV simplified processing</li>
     * </ul>
     * @param intent request setting
     * <ul>
     * <li>cardType(int): card type
     *      * CARD_INSERT(0)- smart IC card
     *      * CARD_RF(1)- CTLS card </li>
     * <li>transProcessCode(byte): (1Byte) Translation type (9C first two digits of the ISO 8583:1987 Processing Code)</li>
     * <li>authAmount(long): auth-amount (transaction amount)</li>
     * <li>isSupportSM(boolean): is support SM </li>
     * <li>isForceOnline(boolean): is force online </li>
     * <li>merchantName(String):merchant Name (var. bytes)</li>
     * <li>merchantId(String): merchant ID (15 bytes)</li>
     * <li>terminalId(String):terminal ID (8 bytes)</li>
     * <li>transCurrCode(String): currency code(5F2A), if not set, kernel will find the tag in AID string.</li>
     * <li>otherAmount(String): set Other Amount (9F03) value</li>
     * <li>panConfirmTimeOut(int): set timeout of pan confirm, if not set then default 60s(just support smart card)</li>
     * <li>appSelectTimeOut(int): set timeout of selectApp, if not set then default 60s(just support smart card)</li>
     * <li>traceNo(String):trace no (var. bytes)</li>
     * <li>ctlsPriority(byte): CTLS application priority, no necessary, b0-MCCS MyDebit priorty b1-terminal priorty b2~b7 to be define</li>
     * <li>isForceOffline(boolean): is force offline, no necessary, false is default (just support AMEX kernel)</li>
     * <li>ctlsAidsForSingleTrans(ArrayList<String>): CTLS transaction input temporary aid params(AID + KernelID(9F2A01xx) + transType(DF2901xx) + transCurrCode(DF2A02xxxx))</li>
     * <li>isTerminalTypeSetInAID(boolean): default value is false(default vaule is 0x22), you should confirm this tag(9F35) in your AID String when you set this tag is true.</li>
     * <li>ctlsEmvAbortWhenAppBlocked(boolean): when CTLS app blocked then EMV abort</li>
     * </ul>
     * @param handler the call back handler, please refer EMVHandler
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see startEMV abortEMV
     */
	void startEMV(int processType, in Bundle intent, EMVHandler handler);

    /**
     * \_en_
     * @brief stop EMV
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     * */
	void abortEMV();

    /**
     * \_en_
     * @brief update AID parameter
     *
     * @param operation the setting
     * <ul>
     * <li>1：append</li>
     * <li>2：remove</li>
     * <li>3：clear all</li>
     * </ul>
     * @param aidType type of AID parameter
     * <ul>
     * <li>1：contact(smart card)</li>
     * <li>2：contactless</li>
     * </ul>
     * @param aid the AID parameter
     * @return result, true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see getAID
     */
    boolean updateAID(int operation,int aidType, String aid);

    /**
     * \_en_
     * @brief update CA public KEY
     *
     * @param operation the setting
     * <ul>
     * <li>1：append</li>
     * <li>2：remove</li>
     * <li>3：clear all</li>
     * </ul>
     * @param rid the CA public KEY
     * @return true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see getRID
     */
    boolean updateRID(int operation, String rid);

    /**
     * @Deprecated
     * \_en_
     * @brief import amount
     *
     * There is nothing in this method. The amount should be set while call the startEMV.
     * @param amount the amount
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see startEMV
     */
    void importAmount(long amount);

    /**
     * \_en_
     * @brief select application (multi-application card)
     *
     * @param index the index of application, start from 1, and 0 means cancel
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onSelectApplication
     */
    void importAppSelection(int index);

    /**
     * \_en_
     * @brief import the PIN
     *
     * @param option(int) - 操作选项 | the option
     * <ul>
     * <li> CANCEL(0) cancel</li>
     * <li> CONFIRM(1) confirm</li>
     * </ul>
     * @param pin the PIN data
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onRequestInputPIN
     */
    void importPin(int option, in byte[] pin);

    /**
     * \_en_
     * @brief import the result of card hodler verification
     *
     * @param option the option
     * <ul>
     * <li> CANCEL(0) cancel ( BYPASS )</li>
     * <li> CONFIRM(1) confirm</li>
     * <li> NOTMATCH(2) not match</li>
     * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onConfirmCertInfo
     */
    void importCertConfirmResult(int option);

    /**
     * \_en_
     * @brief import the result of card verification
     *
     * @param pass true on pass, false on error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onConfirmCardInfo
     */
    void importCardConfirmResult(boolean pass);


    /**
     * \_en_
     * @brief input the online response
     *
     * @param onlineResult  set the result ( response )
     * <ul>
     * <li> isOnline(boolean)is online</li>
     * <li> respCode(String) the response code</li>
     * <li> authCode(String) the authorize code</li>
     * <li> field55(String) the response of field 55 data</li>
     * </ul>
     * @param handler the result , please refer OnlineResultHandler
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onRequestOnlineProcess
     */
    void importOnlineResult(in Bundle onlineResult, OnlineResultHandler handler);

    /**
     * \_en_
     * @brief set EMV (kernel) data in trans process (DCC)
     *
     * In emv flow(onConfirmCardInfo callback or onRequestInputPIN callback), you can modify the emv data. <b>just support smartcard</b><br>
     * for example:<br>
     * 1.firt you set aidString 5F2A=0156, but in onConfirmCardInfo callback you want to reset this tag 5F2A=0116, you can use this interface.<br>
     * 2.second you set authAmount=100(9F02) in startEmv, in onConfirmCardInfo callback you can reset the auth amount.
     * @param tlvList the TLV list
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    void setEMVData(in List<String> tlvList);

    /**
     * \_en_
     * @brief get kernal data list in Tag-Length-Value format
     *
	 * @param taglist the tag list want query
	 * @return the response in TLV format, null means no response got
     * \en_e
     * \code{.java}
     {
         String[] strlist = {"9F33", "9F40", "9F10", "9F26", "95", "9F37", "9F1E", "9F36",
                 "82", "9F1A", "9A", "9B", "50", "84", "5F2A", "8F"};

         String strs = iemv.getAppTLVList(strlist);
      }
     * \endcode
     * @version
     * @see
	 */
	String getAppTLVList(in String[] taglist);

    /**
     * \_en_
     * @brief get card (emv) data by tag
     *
	 * @param tagName the tag name
	 * @return the emv data got
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	byte[] getCardData(String tagName);

	/**
     * \_en_
     * @brief get EMV data
     *
     * such as card number, valid dtae, card serial number, etc.
     * <em> will return null if the data is not avalible at the current EMV process</em>
	 * @param tagName tag name
	 * <ul>
     * <li> PAN card No.</li>
     * <li> TRACK2 track No.2</li>
     * <li> CARD_SN card SN (Serial Number)</li>
     * <li> EXPIRED_DATE expried date</li>
     * <li> DATE date</li>
     * <li> TIME time</li>
     * <li> BALANCE balance</li>
     * <li> CURRENCY currency</li>
     * </ul>
	 * @return the return data of EMV
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see getCardData
	 *
	 */
	String getEMVData(String tagName);

    /**
     * \_en_
     * @brief get the AID parameter
     *
	 * @param type - 1-contact aid  2-contactless aid
     * @return null if the AID is unavailable
     * \en_e
     * \code
      demo returns from getAID(1)
{"9F0607A0000000031010DF0101009F09020140DF1105C000000000DF12050000000000DF130500000000009F1B0400000000DF1504000000009F7B06000000000000DF1906000000000000DF20060099999999995F2A0201569F1A0201569F3303E0F9C89F4005FF00F0A0019F6604260000809F350122DF150400000000DF160101DF170101DF14039F3704DF1801009F1D00",
"9F0607A0000000032010DF0101009F09020140DF1105D84004A800DF1205D84000F800DF130500100000009F1B0400000000DF1504000000009F7B06000000000000DF1906000000000000DF20060099999999995F2A0201569F1A0201569F3303E0F9C89F4005FF00F0A0019F6604260000809F350122DF150400000000DF160101DF170101DF14039F3704DF1801009F1D00"
     * \endcode
     * @version
     * @see updateAID
     */
	String[] getAID(int type);

    /**
     * \en_
     * @brief <b class="strike">get the RID </b><br>
     * @return <b class="strike">null if the RID is unavailable</b><br>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
	 * @deprecated {This interface has been deprecated}
     * @see getCAPK
     */
	String[] getRID();

	/**
     * \_en_
     * @brief Obtain the CTLS card type
     *
     * In onRequestOnlineProcess callback you can use this interface to obtain the CTLS card type
	 * @return:
	 *   0-No Type
	 *   1-JCB_CHIP
	 *   2-JCB_MSD
	 *   3-JCB_Legcy
	 *   4-VISA_w1
	 *   5-VISA_w3
	 *   6-Master_EMV
	 *   7-Master_MSD
	 *   8-qPBOC_qUICS
     * \en_e
     * \code{.java}
     * \endcode
     * @version
	 * @deprecated {This interface has been deprecated}
     * @see EMVHandler#onRequestOnlineProcess
	*
	*/
	int getProcessCardType();

	/**
     * \_en_
     * @brief set EMV kernel to use. set this interface before startEMV()
	 * @param customAidList is Map<String, Integer>, String - custom aid and Integer - kernelID(check CTLSKernelID)
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see CTLSKernelID
	*
	*/
	void registerKernelAID(in Map customAidList);

    /**
     * \_en_
     * @brief import(input) the online response
     *
     * @param onlineResult - 联机结果 | the result ( response )
     * <ul>
     * <li> isOnline(boolean)is online</li>
     * <li> respCode(String) the response code(00-approval)</li>
     * <li> authCode(String) the authorize code</li>
     * <li> field55(String) the response of field 55 data</li>
     * </ul>
     * @param handler the result , please refer OnlineResultHandler
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see EMVHandler#onRequestOnlineProcess
     */
    void inputOnlineResult(in Bundle onlineResult, OnlineResultHandler handler);

    /**
     * \en_
     * @brief update CTLS Visa APID parameter
     *
     * @param operation the setting
     * <ul>
     * <li>1：append</li>
     * <li>2：clear</li>
     * </ul>
     * @param DRLData data
     * @return result, true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see DRLData
     */
    boolean updateVisaAPID(int operation, String drlData);

    /**
     * \en_
     * @brief update card black parameter
     *
     * @param operation the setting
     * <ul>
     * <li>1：append</li>
     * <li>2：clear</li>
     * </ul>
     * @param BLKData data of card black
     * @param type of card black parameter
     * <ul>
     * <li>1：contact(smart card)</li>
     * <li>2：contactless</li>
     * </ul>
     * @return result, true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see BLDData
     */
    boolean updateCardBlk(int operation, String blkData, int type);

    /**
     * \en_
     * @brief set smart card request online after Application Selection.
     *
     * @return result, 0 on success, others on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    int emvProcessingRequestOnline();

    /**
     * \en_
     * @brief get the CAPK parameter
     *
	 * @param type - 1-contact aid  2-contactless aid
     * @return null if the CAPK is unavailable
     * \en_e
     * \code
     * \endcode
     * @version 2.7.0.0
     * @see
     */
	String[] getCAPK(int type);

    /**
     * \en_
     * @brief enable Track(It's not necessary.)
	 * @param trkNum - bit0=1 enable trk1; bit1=1 enable trk2; bit2=1 enable trk3;
     * \en_e
     * \code
     * \endcode
     * @version 2.7.0.0
     * @see
     */
	void enableTrack(int trkNum);

    /**
     * \en_
     * @brief set ctls pre process(It's not necessary.)
     * @param param setting
     * <ul>
     * <li>traceNo(String):trace no (var. bytes)</li>
     * <li>transProcessCode(byte): (1Byte) Translation type (9C first two digits of the ISO 8583:1987 Processing Code)</li>
     * <li>transCurrCode(String): currency code(5F2A), if not set, kernel will find the tag in AID string.</li>
     * <li>otherAmount(String): set Other Amount (9F03) value</li>
     * <li>authAmount(long): auth-amount (transaction amount)</li>
     * <li>isForceOnline(boolean): is force online </li>
     * <li>ctlsPriority(byte): CTLS application priority, no necessary, b0-MyDebit b1~b7 to be define</li>
     * <li>isForceOffline(boolean): is force offline, no necessary, false is default</li>
     * </ul>
     * @return true-sucess false-failed
     * \en_e
     * \code
     * \endcode
     * @version 2.11.0.0
     * @see
     */
	boolean setCtlsPreProcess(in Bundle param);

    /**
     * \_en_
     * @brief check card, non-block method
     *
     * @param cardOption the card type (list)
     * <ul>
     * <li>supportMagCard(boolean) support magnetic card</li>
     * <li>supportSmartCard(boolean) support Smart card</li>
     * <li>supportCTLSCard(boolean) support CTLS card</li>
     * </ul>
     * @param timeout the time out(ms)
     * @param listener the listerner while found card
     * @version
     * @see stopCheckCard startEMV CheckCardListener
     */
	void checkCardMs(String cardOption, long timeout, CheckCardListener listener);

    /**
     * \_en_
     * @brief set before startEMV(), set callback for request issuer update script(CTLS request second tap)
     * \en_e
     * @version 2.16.0.0
     * @see iemv.setIssuerUpdateScript()
     */
    void setIssuerUpdateHandler(String issuerUpdateHandler);

    /**
     * \_en_
     * @brief After CTLS second tap to update script
     * @version 2.16.0.0
     * @see EMVHandler.onRequestIssuerUpdateScript()
     */
	void setIssuerUpdateScript();

    /**
    * \_en_
    * @brief start EMV process
    * @param EMVTransParam @see EMVTransParams.java
    * @param extend
    * <ul>
    *    <li>panConfirmTimeOut(int): set timeout of pan confirm, if not set then default 60s(just support smart card)</li>
    *    <li>appSelectTimeOut(int): set timeout of selectApp, if not set then default 60s(just support smart card)</li>
    *    <li>ctlsPriority(byte): CTLS application priority, no necessary, b0-MCCS MyDebit priority b1-terminal priority,use DF2D to custom set priority b2~b7 to be define</li>
    *    <li>isForceOffline(boolean): is force offline, no necessary, false is default (just support CTLS AMEX kernel)</li>
    *    <li>ctlsAidsForSingleTrans(ArrayList<String>): CTLS transaction input temporary aid params(AID + KernelID(9F2A01xx) + transType(DF2901xx) + transCurrCode(DF2A02xxxx))</li>
    *    <li>isTerminalTypeSetInAID(boolean): default value is false(default vaule is 0x22), you should confirm this tag(9F35) in your AID String when you set this tag is true.</li>
    * </ul>
    * @param handler the call back handler, please refer EMVHandler
    * \en_e
    * \code{.java}
    * \endcode
    * @version
    * @see
    *
    */
	void startEmvWithTransParams(String emvParams, String extend, String handler);
}
