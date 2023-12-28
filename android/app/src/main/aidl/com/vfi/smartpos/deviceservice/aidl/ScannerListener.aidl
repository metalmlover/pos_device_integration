package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 扫码器扫码结果监听器
 *
 * \_en_ the listener of scanner
 * @brief
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see
 * @author
 */
interface ScannerListener {
	/**
     * \cn_
     * @brief 扫码成功回调
     *
	 * @param barcode - 条码 | the barcode string
     * \_en_
     * @brief on success
     *
	 * @param barcode the barcode string
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
    void onSuccess(String barcode);
    
    /**
     * \cn_
     * @brief 扫码出错
     *
     * @param error - 错误码 | the error code
     * @param message - 错误描述 | the message of the error
     * \_en_
     * @brief on error
     *
     * @param error the error code  1-scan failed
     * @param message the message of the error
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    void onError(int error, String message);
    
	/**
     * \cn_
     * @brief 扫码超时回调
     *
     * \_en_
     * @brief on timeout
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
    void onTimeout();
    
    /**
     * \cn_
     * @brief 扫码取消回调
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
}
