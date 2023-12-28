package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief PIN输入过程监听器
 *
 * \_en_
 * @brief the listener while input PIN
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see
 * @author: baoxl
 */
interface PinInputListener {
    /**
     * \cn_
     * @brief 按键按压事件
     *
     * @param len - 已输入密码长度 | the length of the PIN inputted
     * @param key - 当前的Key值 | the current key
     * \_en_
     * @brief on input (key press)
     *
     * @param len the length of the PIN inputted
     * @param key the mask key *
     * \en_e
     * \code{.java}
     * \endcode
     */
    void onInput(int len, int key);
    
    /**
     * \cn_
     * @brief 用户确认PIN输入时调用
     *
     * @param data - pin码，输入为空时候，为null | the PIN number, null if no pin inputed
     * @param isNonePin - 输入为空的时候为true | ture if no pin inputted
     * \_en_
     * @brief on confirm the PIN
     *
     * @param data the PIN number, null if no pin inputed
     * @param isNonePin ture if no pin inputted
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    void onConfirm(in byte[] data, boolean isNonePin);

    /**
     * \cn_
     * @brief 取消PIN输入时调用
     *
     * \_en_
     * @brief on cancel
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    void onCancel();
    
    /**
     * \cn_
     * @brief 错误时回调
     *
     * @param errorCode - 错误码| the error code
     * errorCode 错误码
     * -1:input execption 输入异常
     * -2:input time out 输入超时;
     * -3:plain text is null 明文为空;
     * -4:encrypt error 加密错误;
     * -5:cipher text is null 密文为空;
     * 0xff:other error 其它异常错误
     * \_en_
     * @brief on error
     *
     * @param errorCode the error code<BR>
     * errorCode:<BR>
     * -1:input execption <BR>
     * -2:input time out <BR>
     * -3:plain text is null <BR>
     * -4:encrypt error <BR>
     * -5:cipher text is null <BR>
     * 0xff:other error <BR>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    void onError(int errorCode);
}
