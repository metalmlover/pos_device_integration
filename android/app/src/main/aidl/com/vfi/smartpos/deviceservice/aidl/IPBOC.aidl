package com.vfi.smartpos.deviceservice.aidl;

import com.vfi.smartpos.deviceservice.aidl.CheckCardListener;
import com.vfi.smartpos.deviceservice.aidl.UPCardListener;
import com.vfi.smartpos.deviceservice.aidl.PBOCHandler;
import com.vfi.smartpos.deviceservice.aidl.OnlineResultHandler;
import com.vfi.smartpos.deviceservice.aidl.CandidateAppInfo;

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
 * @brief PBOC金融交易对象用来处理金融卡相关的EMV交易流程。
 *
 * \_en_
 * @brief PBOC(EMV) object for processing EMV
 *
 * \en_e
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface IPBOC {
    /**
     * \cn_
     * @brief PBOC检卡
     *
     * @param cardOption - 支持的卡类型，磁条卡、IC卡和非接卡
     * <ul>
     * <li>supportMagCard(boolean) - 是否支持磁条卡</li> | support magnetic card
     * <li>supportICCard(boolean) - 是否支持IC卡</li> | support IC card
     * <li>supportRFCard(boolean) - 是否支持非接卡</li> | support CTLS card
     * </ul>
     * @param timeout - 超时时间    | the time out
     * @param listener - 检卡结果监听器 | the listerner while found card
     * \_en_
     * @brief check card, non-block method
     *
     * @param cardOption the card type (list)
     * <ul>
     * <li>supportMagCard(boolean) support magnetic card</li>
     * <li>supportICCard(boolean) support IC card</li>
     * <li>supportRFCard(boolean) support CTLS card</li>
     * </ul>
     * @param timeout the time out(seconds)
     * @param listener the listerner while found card
     * \en_e
     * \code{.java}
    public void My17startPBOC() {
        Bundle cardOption = new Bundle();
        cardOption.putBoolean("supportMagCard", true);
        cardOption.putBoolean("supportICCard", true);
        cardOption.putBoolean("supportRFCard", true);

         ipboc.checkCard( cardOption,  30, new CheckCardListener.Stub() {
          String msg;

          @Override
          public void onCardSwiped(Bundle track) throws RemoteException {
              ipboc.stopCheckCard();
          }

          @Override
          public void onCardPowerUp() throws RemoteException {
              // Smart card
              ipboc.stopCheckCard();
              try {
                  Bundle intent1 = intent;
                  // don't change transaction type for test case K17, card type will be changed according the check card result for other test case
                  if (intent.getBoolean(BUNDLE_NOT_CHANGE_CARDTYPE) == false)
                      intent1.putInt(BUNDLE_STARTPBOCPARAM_CARDTYPE, 0);
                  ipboc.startPBOC(transType, intent1, pbochandler);
              } catch (RemoteException e) {
                  e.printStackTrace();
              }
          }

          @Override
          public void onCardActivate() throws RemoteException {
              // CTLS
              ipboc.stopCheckCard();
              try {
                  Bundle intent1 = intent;

                  // don't change transaction type for test case K17, card type will be changed according the check card result for other test case
                  if (intent.getBoolean(BUNDLE_NOT_CHANGE_CARDTYPE) == false)
                      intent1.putInt(BUNDLE_STARTPBOCPARAM_CARDTYPE, 1);
                  ipboc.startPBOC(transType, intent1, pbochandler);
              } catch (RemoteException e) {
                  e.printStackTrace();
              }
          }

          @Override
          public void onTimeout() throws RemoteException {
              ipboc.stopCheckCard();
          }

          @Override
          public void onError(int error, String message) throws RemoteException {
              // msg = "error" + error + message;
              ipboc.stopCheckCard();

              if (error == 3)
                  message1.getData().putString("message", msg + "Fallback");
              else
                  message1.getData().putString("message", msg);

              if (error == 3) {

              }
          }
      });
     }
     * \endcode
     * @version
     * @see stopCheckCard startPBOC startEMV CheckCardListener
     */
	void checkCard(in Bundle cardOption, int timeout, CheckCardListener listener);
	
    /**
     * \cn_
     * @brief 停止PBOC检卡
     *
     * \_en_
     * @brief stop check card
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see checkCard startPBOC startEMV CheckCardListener
     */   
	void stopCheckCard();
	
    /**
     * \cn_
     * @brief 读取手机芯片卡
     *
     * @param listener - 读卡结果监听器 | the listern of the result
     * \_en_
     * @brief read UP ( chip in SIM ) card
     *
     * @param listener the listern of the result
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see UPCardListener
     */
    void readUPCard(UPCardListener listener);
	
    /**
     * \cn_
     * @brief 启动PBOC处理流程
     *
     * @param transType - 交易类型 | transaction type
     * <ul>
     * <li>EC_BALANCE(1) - 查询电子现金余额(走简易流程)</li> | query the balance
     * <li>TRANSFER(2) - 转账</li> | transfer
     * <li>EC_LOAD(3) - 指定账户圈存</li> | EC LOAD
     * <li>EC_LOAD_U(4) - 非指定账户圈存</li> |  EC LOAD without assign account
     * <li>EC_LOAD_CASH(5) - 现金圈存/现金充值</li> | EC LOAD with CASH
     * <li>EC_LOAD_CASH_VOID(6) - 圈存撤销</li> | EC LOAD with CASH void
     * <li>PURCHASE(7) - 消费</li> | purchase
     * <li>Q_PURCHASE(8) - 快速支付</li> | quick purchase
     * <li>CHECK_BALANCE(9) - 余额查询</li> | get balance
     * <li>PRE_AUTH(10) - 预授权交易</li> | pre-authorization
     * <li>SALE_VOID(11) - 消费撤销(走简易流程)</li> | sale void
     * <li>SIMPLE_PROCESS(12) - 简易流程交易</li> | simplye process
     * <li>REFUND(13) - 退货(全流程)</li> | refund
     * <li>CASH(14) - 现金(全流程)</li> | refund
     * </ul>
     * @param intent - 请求数据 | request setting
     * <ul>
     * <li>cardType(int): card type 卡类型，CARD_INSERT(0)- contact IC card 接触式IC卡，CARD_RF(1)- CTLS card 非接触式卡</li>
     * <li>authAmount(long): auth-amount (transaction amount) | 授权金额（交易金额）</li>
     * <li>isSupportQ(boolean): is support QPBOC | 是否支持QPBOC</li>
     * <li>isSupportSM(boolean): is support SM | 是否支持国密</li>
     * <li>isQPBOCForceOnline(boolean): is QPBOC force online | QPBOC是否支持强制联机</li>
     * <li>merchantName(String):merchant Name 商户名称</li>
     * <li>merchantId(String): merchant ID 商户号(15位)</li>
     * <li>terminalId(String):terminal ID 终端号(8位)</li>
     * <li>transCurrCode(String):交易过程中传入的交易货币代码(5F2A)的值，否则使用对应AID的交易货币代码</li>
     * <li>multiAppSelectReturnType(int)：应用选择返回app名称还是aid</li>
     *      |--0：应用名称（default）
     *      |--1：应用名称+(aid)
     * </ul>
     * @param handler - PBOC流程回调处理器| the call back handler, please refer PBOCHandler
     *
     * \_en_
     * @brief start PBOC process
     *
     * @param transType transaction type
     * <ul>
     * <li>EC_BALANCE(1) query the balance</li>
     * <li>TRANSFER(2) transfer</li>
     * <li>EC_LOAD(3) EC LOAD</li>
     * <li>EC_LOAD_U(4) EC LOAD without assign account</li>
     * <li>EC_LOAD_CASH(5) EC LOAD with CASH</li>
     * <li>EC_LOAD_CASH_VOID(6) EC LOAD with CASH void</li>
     * <li>PURCHASE(7) purchase</li>
     * <li>Q_PURCHASE(8) quick purchase</li>
     * <li>CHECK_BALANCE(9) get balance</li>
     * <li>PRE_AUTH(10) pre-authorization</li>
     * <li>SALE_VOID(11) sale void</li>
     * <li>SIMPLE_PROCESS(12) simplye process</li>
     * <li>REFUND(13) - refund(full process)</li>
     * </ul>
     * @param intent request setting
     * <ul>
     * <li>cardType(int) card type
     *         * CARD_INSERT(0)- samrt IC card
     *         * CARD_RF(1)- CTLS card 非接触式卡 </li>
     * <li>authAmount(long): auth-amount (transaction amount) </li>
     * <li>isSupportQ(boolean): is support QPBOC </li>
     * <li>isSupportSM(boolean): is support SM </li>
     * <li>isQPBOCForceOnline(boolean): is QPBOC force online </li>
     * <li>merchantName(String):merchant Name </li>
     * <li>merchantId(String): merchant ID </li>
     * <li>terminalId(String):terminal ID </li>
     * </ul>
     * @param handler the call back handler, please refer PBOCHandler
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see startEMV
     */
	void startPBOC(int transType, in Bundle intent, PBOCHandler handler);

    /**
     * \cn_
     * @brief 启动EMV处理流程
     *
     * @param processType - 流程类型 | process type
     * <ul>
     * <li>1：全流程 </li> | full process
     * <li>2：简易流程 </li> | simple process
     * </ul>
     * @param intent - 请求数据 | request setting
     * <ul>
     * <li>cardType(int): card type 卡类型，CARD_INSERT(0)- contact IC card 接触式IC卡，CARD_RF(1)- CTLS card 非接触式卡</li>
     * <li>transProcessCode(byte): (1Byte) Translation type (9C first two digits of the ISO 8583:1987 Processing Code)</li>
     * <li>authAmount(long): auth-amount (transaction amount) | 授权金额（交易金额）</li>
     * <li>isSupportQ(boolean): is support QPBOC | 是否支持QPBOC</li>
     * <li>isSupportSM(boolean): is support SM | 是否支持国密</li>
     * <li>isQPBOCForceOnline(boolean): is QPBOC force online | QPBOC是否支持强制联机</li>
     * <li>merchantName(String):merchant Name 商户名称</li>
     * <li>merchantId(String): merchant ID 商户号</li>
     * <li>terminalId(String):terminal ID 终端号</li>
     * </ul>
     * @param handler - PBOC流程回调处理器| the call back handler, please refer PBOCHandler
     * \_en_
     * @brief start EMV process
     *
     * @param processType process type
     * <ul>
     * <li>1：full process</li>
     * <li>2：simple process</li>
     * </ul>
     * @param intent request setting
     * <ul>
     * <li>cardType(int): card type
     *      * CARD_INSERT(0)- smart IC card
     *      * CARD_RF(1)- CTLS card </li>
     * <li>transProcessCode(byte): (1Byte) Translation type (9C first two digits of the ISO 8583:1987 Processing Code)</li>
     * <li>authAmount(long): auth-amount (transaction amount)</li>
     * <li>isSupportQ(boolean): is support QPBOC </li>
     * <li>isSupportSM(boolean): is support SM </li>
     * <li>isQPBOCForceOnline(boolean): is QPBOC force online </li>
     * <li>merchantName(String):merchant Name </li>
     * <li>merchantId(String): merchant ID </li>
     * <li>terminalId(String):terminal ID </li>
     * </ul>
     * @param handler the call back handler, please refer PBOCHandler
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see startPBOC abortPBOC

     */
	void startEMV(int processType, in Bundle intent, PBOCHandler handler);
	
    /**
     * \cn_
     * @brief 终止PBOC流程
     *
     * \_en_
     * @brief stop PBOC(EMV)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     * */
	void abortPBOC();

    /**
     * \cn_
     * @brief 更新AID参数
     *
     * @param operation - 操作标识，增、删、清空 | the setting
     * <ul>
     * <li>1：新增 </li> | append
     * <li>2：删除 </li> | remove
     * <li>3：清空 </li> | clear
     * </ul>
     * @param aidType - AID参数类型 | type of AID parameter
     * <ul>
     * <li>1：接触式 </li> | contact
     * <li>2：非接</li> | contactless
     * </ul>
     * @param aid - AID参数，构成AID参数的TLV字符串 | the AID parameter
     * @return 成功true，失败false | result, true on success, false on failure
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
     * \cn_
     * @brief 更新CA公钥参数
     *
     * @param operation - 操作标识，增、删、清空 | the setting
     * <ul>
     * <li>1：新增 </li> | append
     * <li>2：删除 </li> | remove
     * <li>3：清空 </li> | clear
     * </ul>
     * @param rid - CA公钥参数 | the CA public KEY
     * @return 成功true，失败false | true on success, false on failure
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
     * \cn_
     * @brief 导入金额
     *
     * @param amount - 交易金额 | the amount
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
     * \cn_
     * @brief 导入应用选择结果（多应用卡片）
     *
     * @param index - 应用选择的序号从1开始，0为取消 | the index of application
     * \_en_
     * @brief select application (multi-application card)
     *
     * @param index the index of application, start from 1, and 0 means cancel
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see PBOCHandler#onSelectApplication
     */
    void importAppSelect(int index);
    
    /**
     * \cn_
     * @brief 导入PIN
     *
     * @param option(int) - 操作选项 | the option
     * <ul>
     * <li> CANCEL(0) - 取消 </li> | cancel
     * <li> CONFIRM(1) - 确认 </li> | confirm
     * </ul>
     * @param pin - PIN数据 | the PIN data
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
     * @see PBOCHandler#onRequestInputPIN
     */
    void importPin(int option, in byte[] pin);
    
    /**
     * \cn_
     * @brief 导入身份认证结果
     *
     * @param option - 确认结果 | the option
     * <ul>
     * <li> CANCEL(0) - 取消，跳过（BYPASS) </li> | cancel ( BYPASS )
     * <li> CONFIRM(1) - 确认持卡人身份 </li> | confirm
     * <li> NOTMATCH(2) - 身份信息不符 </li> | not match
     * </ul>
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
     * @see PBOCHandler#
     */
    void importCertConfirmResult(int option);
    
    /**
     * \cn_
     * @brief 导入卡信息确认结果
     *
     * @param pass - 是否通过 | true on pass, false on error
     * \_en_
     * @brief import the result of card verification
     *
     * @param pass true on pass, false on error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see PBOCHandler#onConfirmCardInfo
     */
    void importCardConfirmResult(boolean pass);
    
    
    /**
     * \cn_
     * @brief 导入联机应答数据
     *
     * @param onlineResult - 联机结果 | the result ( response )
     * <ul>
     * <li> isOnline(boolean) - 是否联机</li> | is online
     * <li> respCode(String) - 应答码</li> | the response code
     * <li> authCode(String) - 授权码 </li> | the authorize code
     * <li> field55(String) - 55域应答数据(91 发卡行认证数据)</li> | the response of field 55 data
     * </ul>
     * @param handler - 联机结果处理 | the result , please refer OnlineResultHandler
     * \_en_
     * @brief import(input) the online response
     *
     * @param onlineResult - 联机结果 | the result ( response )
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
     * @see PBOCHandler#onRequestOnlineProcess
     */
    void inputOnlineResult(in Bundle onlineResult, OnlineResultHandler handler);

    /**
     * \cn_
     * @brief 设置TLV内核参数
     *
     * \_en_
     * @brief set EMV (kernel) data
     *
     * before start emv flow, you can set the data
     * @param tlvList the TLV list
     * Support set following tag. If AID list have the same tag, aid list priority over this interface.<BR>
     * 9F33：终端性能<BR>
     * 9F15：商户类别码<BR>
     * 9F16：商户号<BR>
     * 9F4E：商户名称<BR>
     * 9F1C：终端号<BR>
     * 9F35：终端类型<BR>
     * 9F3C：交易参考货币代码<BR>
     * 9F3D：交易参考货币指数<BR>
     * 5F2A：交易货币代码<BR>
     * 5F36：交易货币指数<BR>
     * 9F1A：终端国家代码<BR>
     * 9F40：终端附加性能<BR>
     * \en_e
     * \code{.java}
    IPBOC ipboc;
    EMVL2 emvl2;
    public void K12001() {
        byte[] acquirerID = {(byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00, (byte) 0x00};
        byte[] termCap = {(byte) 0xe0, (byte) 0xf1, (byte) 0xc8};
        byte[] addTermCap = {(byte) 0xe0, (byte) 0x00, (byte) 0xF0, (byte) 0xA0, (byte) 0x01};
        byte[] countryCode = {(byte) 0x01, (byte) 0x56};
        byte[] currencyCode = {(byte) 0x01, (byte) 0x56};
        byte[] termType = {(byte) 0x22};

        Collection<String> tlvList = new ArrayList<String>();

        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F15020000")));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F160F")) + Utils.byte2HexStr("123456789012345".getBytes()));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F4E0D")) + Utils.byte2HexStr("Verifone Test".getBytes()));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F1C08")) + Utils.byte2HexStr("12345678".getBytes()));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F0106")) + Utils.byte2HexStr(acquirerID));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F1E08")) + Utils.byte2HexStr("50342027".getBytes()));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F3501")) + Utils.byte2HexStr(termType));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F3303")) + Utils.byte2HexStr(termCap));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F4005")) + Utils.byte2HexStr(addTermCap));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F1A02")) + Utils.byte2HexStr(countryCode));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("5F2A02")) + Utils.byte2HexStr(currencyCode));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("5F3601" + "02")));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F3C02")) + Utils.byte2HexStr(currencyCode));
        tlvList.add(Utils.byte2HexStr(Utils.asc2Bcd("9F3D0102")));
        ipboc.setEMVData(tlvList);
    }
     * \endcode
     * @version
     * @see
     */
    void setEMVData(in List<String> tlvList);
    
    /**
     * \cn_
     * @brief 获取PBOC内核TLV数据列表
     *
	 * @param taglist - 需要获得的tag列表 | the tag list want query
	 * @return tlv数据，null表示没有数据 | the response in TLV format, null means no response got
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

         String strs = ipboc.getAppTLVList(strlist);
      }
     * \endcode
     * @version
     * @see
	 */
	String getAppTLVList(in String[] taglist);
	
    /**
     * \cn_
     * @brief 获取卡片上EMV数据元
     *
	 * @param tagName - 标签名称 | the tag name
	 * @return 卡片EMV数据 | @return the emv data got
     * \_en_
     * @brief get card (emv) data by tag
     *
	 * @param tagName the tag name
	 * @return the emv data got
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see getPBOCData
	 */
	byte[] getCardData(String tagName);
	
	/**
     * \cn_
     * @brief 获取PBOC流程数据
     *
     * 如卡号、有效期、卡片序列号等。EMV必须执行到相应流程才能获取到对应的卡片数据，否则返回空。
	 * @param tagName - 标签名称 | tag name
	 * <ul>
     * <li> PAN - 卡号</li> | PAN , card No.
     * <li> TRACK2 - 磁道二数据</li> | track No.2
     * <li> CARD_SN - 卡片序列号 </li> | card SN (Serial Number)
     * <li> EXPIRED_DATE - 有效期</li> | expried date
     * <li> DATE - 日期</li> | date
     * <li> TIME - 时间</li> | time
     * <li> BALANCE - 电子现金余额</li> | balance
     * <li> CURRENCY - 币种</li> | currency
     * </ul>
	 * @return PBOC流程中内核返回的数据 | @return the return data of PBOC
     * \_en_
     * @brief get PBOC(EMV) data
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
	 * @return the return data of PBOC
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see getCardData
	 *
	 */
	String getPBOCData(String tagName);
	
    /**
     * \cn_
     * @brief 获取卡片候选应用信息
     *
	 * 用于电子签名上送和小额免签免密 | for upload the e-signature 。
	 * @return 卡片候选应用信息，具体见{@link CandidateAppInfo}定义 | @return, the application information, please refer CandidateAppInfo
     * \_en_
     * @brief get the candidate application information
     *
	 * for upload the e-signature
	 * @return the application information, please refer CandidateAppInfo
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	String getCandidateAppInfo();

    /**
     * \cn_
     * @brief 获取AID参数,如果Aid为空，返回null
     *
	 * @param type - 1-contact aid  2-contactless aid
     * |@return, null if the AID is unavailable
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
     * \cn_
     * @brief 获取RID参数,如果Rid为空，返回null
     *
     * @return null if the RID is unavailable
     *
     * \_en_
     * @brief get the RID
     *
     * @return null if the RID is unavailable
     * \en_e
     * \code{.java}
     demo returns from getRID()
     {"9F0605A0000000039F220199DF050420291231DF03144ABFFD6B1C51212D05552E431C5B17007D2F5E6DDF070101DF060101DF028180AB79FCC9520896967E776E64444E5DCDD6E13611874F3985722520425295EEA4BD0C2781DE7F31CD3D041F565F747306EED62954B17EDABA3A6C5B85A1DE1BEB9A34141AF38FCF8279C9DEA0D5A6710D08DB4124F041945587E20359BAB47B7575AD94262D4B25F264AF33DEDCF28E09615E937DE32EDC03C54445FE7E382777DF0403000003"}
     * \endcode
     * @version
     * @see updateRID
     */
	String[] getRID();

	/**
     * \cn_
     * @brief pboc流程中获取卡片类型
	 * @return
	 *   0-No Type<BR>
	 *   1-JCB_CHIP<BR>
	 *   2-JCB_MSD<BR>
	 *   3-JCB_Legcy<BR>
	 *   4-VISA_w1<BR>
	 *   5-VISA_w3<BR>
	 *   6-Master_EMV<BR>
	 *   7-Master_MSD<BR>
	 *   8-qPBOC_qUICS<BR>
     *
     * \_en_
     * @brief Obtain the CTLS card type(In onRequestOnlineProcess callback you can use this interface to obtain the CTLS card type)
	 * @return
	 *   0-No Type<BR>
	 *   1-JCB_CHIP<BR>
	 *   2-JCB_MSD<BR>
	 *   3-JCB_Legcy<BR>
	 *   4-VISA_w1<BR>
	 *   5-VISA_w3<BR>
	 *   6-Master_EMV<BR>
	 *   7-Master_MSD<BR>
	 *   8-qPBOC_qUICS<BR>
	 *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see PBOCHandler#onRequestOnlineProcess
     */
	int getProcessCardType();
}
