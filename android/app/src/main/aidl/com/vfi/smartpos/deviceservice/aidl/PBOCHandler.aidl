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
 * PBOC交易流程回调接口 | the callback of PBOC transaction
 * \_en_
 * the callback handler of PBOC(EMV) transaction
 * \en_e
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface PBOCHandler {
	/**
     * @deprecated
     * \cn_
     * 请求输入金额
     * \_en_
     * @brief on request amount
     *
     * This method won't be called.
     * The amount should be set while calling the IPBOC#startEMV.
     * \en_e
     *
     * \code{.java}
    // show the amount screen and import the amount
    ipboc.importAmount((int) amount);
    // abort
    ipboc.abortPBOC();
     * \endcode
     * @see IPBOC#startEMV
     * @see IPBOC#abortPBOC
	 */
	void onRequestAmount();
	
	/**
     * \cn_
	 * 请求应用选择 | on select application
	 * @param appList - 应用列表 | the application list
     * \_en_
     * @brief on select application
     *
     * @param appList the application list
     * \en_e
     * \code{.java}
        IPBOC ipboc;
        @Override
        public void onSelectApplication(List<String> appList) throws RemoteException {
            int i = 1;
            //check the cancel flag
            Boolean cancelSelectApplication = false;
            if (cancelSelectApplication) {
                ipboc.abortPBOC();
                // ("user cancel");
                return;
            }
            for (String str : appList) {
                msg = i++ + ".AppName=" + str + "\n";
            }
            //show the application list, get the index
            ipboc.importAppSelect(index);
        }
     * \endcode
     * @see IPBOC#abortPBOC, IPBOC#importAppSelect
	 */
	void onSelectApplication(in List<String> appList);
    
    /**
     * \cn_
     * @brief 要求确认卡信息
     *
     * @param info - 卡片信息 | the card information
     * <ul>
     * <li>PAN(String) - 主账号（卡号）| the PAN </li>
     * <li>TRACK2(String) - 磁道2数据 | track 2</li>
     * <li>CARD_SN(String) - 卡片序列号 | card serial number</li>
     * <li>SERVICE_CODE(String) - 服务码 | service code</li>
     * <li>EXPIRED_DATE(String) - 卡片有效期 | expired date</li>
     * </ul>
     * \_en_
     * @brief on confirm card information
     *
     * @param info the card information
     * <ul>
     * <li>PAN(String) the PAN </li>
     * <li>TRACK2(String) track 2</li>
     * <li>CARD_SN(String) card serial number</li>
     * <li>SERVICE_CODE(String) service code</li>
     * <li>EXPIRED_DATE(String) expired date</li>
     * </ul>
     * \en_e
     * \code{.java}
        @Override
        public void onConfirmCardInfo(Bundle info) throws RemoteException {
            // display the card infor
            String result = "onConfirmCardInfo callback, \nPAN:" + info.getString("PAN") +
                    "\nTRACK2:" + info.getString("TRACK2") +
                    "\nCARD_SN:" + info.getString("CARD_SN")+
                    "\nSERVICE_CODE:" + info.getString("SERVICE_CODE") +
                    "\nEXPIRED_DATE:" + info.getString("EXPIRED_DATE");

            if (true) {
                    byte[] strs = ipboc.getCardData("9F51");
                } else {
            }

            // get the result
            if ( cancel ) {
                ipboc.abortPBOC();
                ipboc.importCardConfirmResult(false);
            } else {
                ipboc.importCardConfirmResult(true);
            }
        }
    }
     * \endcode
     * @see IPBOC#abortPBOC, IPBOC#importCardConfirmResult
     */
    void onConfirmCardInfo(in Bundle info);
    
    /**
     * 要求输入PIN | on request input pin
     * @param isOnlinePin 是否是联机pin | is online pin request
     * @param retryTimes 脱机pin的输入次数 | the retry max times of offline pin
     */
    void onRequestInputPIN(boolean isOnlinePin, int retryTimes);
    
    /**
     * 要求确认持卡人证件 | on confirm card holder certinfo
     * @param certType - 认证类型 | the cert type
     * @param certInfo - 认证信息 | the cert information
     */
    void onConfirmCertInfo(String certType, String certInfo);
    
    /**
     * \cn_
     * @brief 联机处理请求
     *
     * @param aaResult 卡片分析结果，联机数据 | the result
     * <ul>
     * <li>RESULT(int) - 结果类型：result type
     *   |----QPBOC_ARQC(201) - qPBOC联机请求; | QPBOC_ARQC, online request
     *   |----AARESULT_ARQC(2) - 行为分析结果ARQC | AARESULT ARQC, the action analysis result
     *   |----PAYPASS_MAG_ARQC(302)-paypass的磁卡模式联机请求 | the mode of magnetic card on paypass request
     *   |----PAYPASS_EMV_ARQC(303)- paypass的EMV模式联机请求 | the mode of EMV on paypass request
     * <li>ARQC_DATA(String) - 联机请求卡片部分55域数据 | request  some of Field55 data, or you can use getAppTLVList() to get by yourself</li>
     *   |----(CTLS data include "9F26,9F27,9F10,9F37,9F1A,9F36,95,9A,9C,9F02,5F2A,82,9F03,9F33,9F34,9F35,84,9F1E,9F09,9F41")
     *   |----(IC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41")
     * <li>REVERSAL_DATA(String) - IC卡冲正部分TLV数据 | some of reversal data of IC card, or you can use getAppTLVList() to get by yourself</li>
     *   |----(IC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41")
     * </ul>
     * You can get form ARQC data:
     * <ul>
     * <li>CARD_ORG(String)-卡组织类别 | the card organization</li>
     * <li>PAN(String)-交易卡号 | the PAN</li>
     * <li>TRACK2(String)-磁道2数据（包括磁条卡、IC卡和非接卡）| the track 2</li>
     * <li>EXPIRED_DATE(String)- expired date</li>
     * <li>CARD_SN(String)-卡片序列号 | the card SN</li>
     * <li>DATE(String)-交易日期 | the date of transaction</li>
     * <li>TIME(String)-交易时间 | the time of transaction</li>
     * <li>CARD_HOLDER_NAME(String)-持卡人姓名 | the card holder name</li>
     * </ul>
     * \_en_
     * @brief on request online process
     *
     * @param aaResult the result
     * <ul>
     * <li>RESULT(int) result type<br>
     *   |----QPBOC_ARQC(201) - QPBOC_ARQC, online request, part of PBOC standard<br>
     *   |----AARESULT_ARQC(2) - AARESULT ARQC, the action analysis result<br>
     *   |----PAYPASS_MAG_ARQC(302)-the mode of magnetic card on paypass request<br>
     *   |----PAYPASS_EMV_ARQC(303)- the mode of EMV on paypass request<br>
     * <li>ARQC_DATA(String) - request some of Field55 data, or you can use getAppTLVList() to get by yourself</li>
     *   |----(CTLS data include "9F26,9F27,9F10,9F37,9F1A,9F36,95,9A,9C,9F02,5F2A,82,9F03,9F33,9F34,9F35,84,9F1E,9F09,9F41")<br>
     *   |----(IC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41")<br>
     * <li>REVERSAL_DATA(String) - some of reversal data of IC card, or you can use getAppTLVList() to get by yourself</li>
     *   |----(IC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41")<br>
     * </ul>
     * You can get form ARQC data:
     * <ul>
     * <li>CARD_ORG(String)-the card organization</li>
     * <li>PAN(String)-the PAN</li>
     * <li>TRACK2(String)-the track 2</li>
     * <li>EXPIRED_DATE(String)- expired date</li>
     * <li>CARD_SN(String)-the card SN</li>
     * <li>DATE(String)-the date of transaction</li>
     * <li>TIME(String)-the time of transaction</li>
     * <li>CARD_HOLDER_NAME(String)-the card holder name</li>
     * </ul>
     * \en_e
     * \code{.java}
@Override
public void onRequestOnlineProcess(Bundle aaResult) throws RemoteException {
    String result = "onRequestOnlineProcess callback RESULT:" + aaResult.getInt(BUNDLE_TRANS_RESULT) +
            "\nARQC_DATA:" + aaResult.getString(BUNDLE_ARQC_DATA) +
            "\nREVERSAL_DATA:" + aaResult.getString(BUNDLE_REVERSAL_DATA) +
            "\nCARD_ORG:" + aaResult.getString(BUNDLE_EMV_CARDORG) +
            "\nPAN:" + aaResult.getString(BUNDLE_PBOC_PAN) +
            "\nTRACK2:" + aaResult.getString(BUNDLE_PBOC_TRACK2) +
            "\nEXPIRD_DATE:" + aaResult.getString(BUNDLE_PBOC_EXPIRED_DATE) +
            "\nCARD_SN:" + aaResult.getString(BUNDLE_PBOC_CARD_SN) +
            "\nDATE:" + aaResult.getString(BUNDLE_EMV_DATE) +
            "\nTIME:" + aaResult.getString(BUNDLE_EMV_TIME) +
            "\nCARD_HOLDER_NAME:" + aaResult.getString(BUNDLE_EMV_HOLDERNAME);

    Boolean getAppTLVListOption = true;
    if (getAppTLVListOption) {
        String[] strlist = {"9F33", "9F40", "9F10", "9F26", "95", "9F37", "9F1E", "9F36",
                "82", "9F1A", "9A", "9B", "50", "84", "5F2A", "8F"};
        String strs = ipboc.getAppTLVList(strlist);
    }

    Boolean getData = importData.getBoolean(BUNDLE_IMPORT_IS_GET_PBOC_DATA);
    if (getData) {
        String strs = "PAN:" + ipboc.getPBOCData(BUNDLE_PBOC_PAN) + "\n" +
                "TRACK2:" + My15getPBOCData(BUNDLE_PBOC_TRACK2) + "\n" +
                "CARD_SN:" + My15getPBOCData(BUNDLE_PBOC_CARD_SN) + "\n" +
                "EXPIRED_DATE:" + My15getPBOCData("EXPIRED_DATE") + "\n" +
                "DATE:" + My15getPBOCData("DATE") + "\n" +
                "TIME:" + My15getPBOCData("TIME") + "\n" +
                "BALANCE:" + My15getPBOCData("BALANCE") + "\n" +
                "CURRENCY:" + My15getPBOCData("CURRENCY");

        Log.d(TAG, "getPBOCData : " + strs);
    }

    String[] tvr = {"95"};
    ipboc.getAppTLVList(tvr);

    //online
    String online_result = "";

    //do online finish process
    ipboc.inputOnlineResult(importData, new MyOnlineResultHandler());
}
     * \endcode
     * @version
     * @see IPBOC#getAppTLVList IPBOC#getPBOCData IPBOC#inputOnlineResult
     *
     *
     */
    void onRequestOnlineProcess(in Bundle aaResult);
    
    /**
     * \cn_
     * @brief PBOC交易结果，见于简易流程，qPBOC，以及交易过程失败等
     * @param result - 交易结果
     * <ul>
     * <li>EMV_NO_APP(8) - emv no application(aid param)</li>
     * <li>EMV_COMPLETE(9) - EMV简易流程结束 | emv complete </li>
     * <li>EMV_OTHER_ERROR(11) - 其他错误,交易终止| emv other error,transaction abort</li>
     * <li>EMV_FALLBACK(12) - 交易FALLBACK 尝试其他交易方式</li>
     * <li>EMV_DATA_AUTH_FAIL(13) - 脱机数据认证失败 </li>
     * <li>EMV_APP_BLOCKED(14) - 应用被锁定 </li>
     * <li>EMV_NOT_ECCARD(15) - 非电子现金卡 </li>
     * <li>EMV_UNSUPPORT_ECCARD(16) - 该交易不支持电子现金卡 </li>
     * <li>EMV_AMOUNT_EXCEED_ON_PURELYEC(17) - 纯电子现金卡消费金额超限 </li>
     * <li>EMV_SET_PARAM_ERROR(18) - 参数设置错误(9F7A) | set parameter fail on 9F7A </li>
     * <li>EMV_PAN_NOT_MATCH_TRACK2(19) - 主账号与二磁道不符 </li>
     * <li>EMV_CARD_HOLDER_VALIDATE_ERROR(20) - 持卡人认证失败 </li>
     * <li>EMV_PURELYEC_REJECT(21) - 纯电子现金卡被拒绝交易 </li>
     * <li>EMV_BALANCE_INSUFFICIENT(22) - 余额不足 </li>
     * <li>EMV_AMOUNT_EXCEED_ON_RFLIMIT_CHECK(23) - 交易金额超过非接限额检查 </li>
     * <li>EMV_CARD_BIN_CHECK_FAIL(24) - 读卡失败 </li>
     * <li>EMV_CARD_BLOCKED(25) - 卡被锁 </li>
     * <li>EMV_MULTI_CARD_ERROR(26) - 多卡冲突 </li>
     * <li>EMV_BALANCE_EXCEED(27) - 余额超出 </li>
     * <li>EMV_RFCARD_PASS_FAIL(60) - 挥卡失败 | tap card failure</li>
     * <li>EMV_IN_QPBOC_PROCESS(99) - QPBOC流程处理中 \ qPBOC is processing </li>
     *
     * <li>AARESULT_TC(0) - 行为分析结果，交易批准(脱机) | TC on action analysis</li>
     * <li>AARESULT_AAC(1) - 行为分析结果，交易拒绝 | refuse on action analysis</li>
     * <li>QPBOC_AAC(202) - qPBOC交易结果，交易拒绝 | refuse on qPBOC </li>
     * <li>QPBOC_ERROR(203) - qPBOC交易结果，交易失败| error on qPBOC </li>
     * <li>QPBOC_TC(204) - qPBOC交易结果，交易批准 TC on qPBOC</li>
     * <li>QPBOC_CONT(205) - qPBOC结果，转接触式卡 | need contact</li>
     * <li>QPBOC_NO_APP(206) - qPBOC交易结果，无应用(可转UP Card) | result of qPBOC, no application (UP Card maybe available)</li>
     * <li>QPBOC_NOT_CPU_CARD(207) - qPBOC交易结果，该卡非TYPE B/PRO卡 | not a cpu card</li>
     * <li>QPBOC_ABORT(208) - qPBOC交易终止 | Transation abort</li>
     * <li>EMV_SEE_PHONE(150)-paypass交易结果，请查看手机 | paypass result, please check the result on phone</li>
     * <li>QPBOC_KERNAL_INIT_FAILED(301) - 非接内核初始化失败 | CTLS kernel init failed</li>
     * </ul>
     *
     * @param data 交易结果数据 | parameter data
     * <ul>
     * <li>TC_DATA(String) - IC卡交易批准卡片返回数据 | the string of TC, you can use getAppTLVList() to get by yourself</li>
     *     |-----(TC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41,9F63,91")
     * <li>REVERSAL_DATA(String) - IC卡冲正数据 | the string of reversal data</li>
     * <li>ERROR(String) - 错误描述(PBOC流程错误返回) | the error description ( from the result of PBOC) </li>
     * </ul>
     * \_en_
     * @brief the result of PBOC, qPBOC, failure on transaction , etc
     * @param result the result
     * <ul>
     * <li>EMV_NO_APP(8) - emv no application(aid param)</li>
     * <li>EMV_COMPLETE(9) - emv complete </li>
     * <li>EMV_OTHER_ERROR(11) - emv other error,transaction abort</li>
     * <li>EMV_FALLBACK(12) - FALLBACK </li>
     * <li>EMV_DATA_AUTH_FAIL(13) - 脱机数据认证失败 </li>
     * <li>EMV_APP_BLOCKED(14) - 应用被锁定 </li>
     * <li>EMV_NOT_ECCARD(15) - 非电子现金卡 </li>
     * <li>EMV_UNSUPPORT_ECCARD(16) - 该交易不支持电子现金卡 </li>
     * <li>EMV_AMOUNT_EXCEED_ON_PURELYEC(17) - 纯电子现金卡消费金额超限 </li>
     * <li>EMV_SET_PARAM_ERROR(18) - set parameter fail on 9F7A </li>
     * <li>EMV_PAN_NOT_MATCH_TRACK2(19) - 主账号与二磁道不符 </li>
     * <li>EMV_CARD_HOLDER_VALIDATE_ERROR(20) - 持卡人认证失败 </li>
     * <li>EMV_PURELYEC_REJECT(21) - 纯电子现金卡被拒绝交易 </li>
     * <li>EMV_BALANCE_INSUFFICIENT(22) - 余额不足 </li>
     * <li>EMV_AMOUNT_EXCEED_ON_RFLIMIT_CHECK(23) - 交易金额超过非接限额检查 </li>
     * <li>EMV_CARD_BIN_CHECK_FAIL(24) - 读卡失败 </li>
     * <li>EMV_CARD_BLOCKED(25) - 卡被锁 </li>
     * <li>EMV_MULTI_CARD_ERROR(26) - 多卡冲突 </li>
     * <li>EMV_BALANCE_EXCEED(27) - 余额超出 </li>
     * <li>EMV_RFCARD_PASS_FAIL(60) - tap card failure</li>
     * <li>EMV_IN_QPBOC_PROCESS(99) - qPBOC is processing </li>
     *
     * <li>AARESULT_TC(0) - TC on action analysis</li>
     * <li>AARESULT_AAC(1) - refuse on action analysis</li>
     * <li>QPBOC_AAC(202) - refuse on qPBOC </li>
     * <li>QPBOC_ERROR(203) - error on qPBOC </li>
     * <li>QPBOC_TC(204) - TC on qPBOC</li>
     * <li>QPBOC_CONT(205) - need contact</li>
     * <li>QPBOC_NO_APP(206) - result of qPBOC, no application (UP Card maybe available)</li>
     * <li>QPBOC_NOT_CPU_CARD(207) - not a cpu card</li>
     * <li>QPBOC_ABORT(208) - Transation abort</li>
     * <li>EMV_SEE_PHONE(150)-paypass result, please check the result on phone</li>
     * </ul>
     *
     * @param data data of result
     * <ul>
     * <li>TC_DATA(String) - the string of TC, you can use getAppTLVList() to get by yourself</li>
     *     |-----(TC data include "9F26,9F27,9F10,9F37,9F36,95,9A,9C,9F02,5F2A,82,9F1A,9F03,9F33,9F34,9F35,9F1E,84,9F09,9F41,9F63,91")
     * <li>REVERSAL_DATA(String) - the string of reversal data</li>
     * <li>ERROR(String) - the error description ( from the result of PBOC) </li>
     * </ul>
     * \en_e
     *
     * \code{.java}
    @Override
    public void onTransactionResult(int result, Bundle data) throws RemoteException {
        Log.i(TAG, "onTransactionResult callback, result:" + result +
                "\nTC_DATA:" + data.getString(BUNDLE_TC_DATA) +
                "\nREVERSAL_DATA:" + data.getString(BUNDLE_REVERSAL_DATA) +
                "\nERROR:" + data.getString(BUNDLE_TRANS_ERROR));
        if ((type == 3) && (transType == EC_BALANCE || transType == Q_QUERY)) {
            String ecBalance = ipboc.getPBOCData("BALANCE");
            Log.i(TAG, "BALANCE:" + ecBalance);

            if (ecBalance != null)
                msg = ":" + ecBalance;
            logUtils.addCaseLog(msg);

        }
        msg = "result:" + result + "\n" + data.getString(BUNDLE_TRANS_ERROR);
        Message message1 = new Message();
        message1.getData().putString("message", msg);
        handler.sendMessage(message1);
    }
     * \endcode
     * @version
     * @see IPBOC#getPBOCData
     */
    void onTransactionResult(int result, in Bundle data);
}
