package com.vfi.smartpos.deviceservice.aidl;

/**
 * Created by Simon on 2019/3/26.
 * @version >= 2.0.9
 */
interface SmartCardExSearchListener {

    /**
     *
     * @param cardType, refer the com/vfi/smartpos/deviceservice/constdefine/ConstISmartCardReaderEx.java, class ConstISmartCardReaderEx.CardType for defines
     * @version >= 2.0.9
     * @see ConstISmartCardReaderEx.CommType
     */
    void onSuccess(int cardType);
    /**
     *
     * @param errorCode, -1 for error
     * @version >= 2.0.9
     */
    void onFail( int errorCode);
    /**
     *
     * @version >= 2.0.9
     */
    void onTimeout();
}
