package com.vfi.smartpos.deviceservice.aidl;

/**
 *
 * \en_
 * @brief the usb-serial device(such as X9, C520H) connect with OTG cable
 *
 * Insert the OTG cable to X9, connect the X9 or C520 to the OTG cable with micro-usb cable
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see
 *
* */
interface IUsbSerialPort {
    /**
     * \cn_
     * @brief 判断是否连接到子设备上
     *
	 * @return 返回true or false
     * \_en_
     * @brief check if usb-serial device available
     *
	 * @return true for available, false for no device available
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 *
	 */
	boolean isUsbSerialConnect();
	/**
     * \cn_
     * @brief 读数据(接收)
     *
	 * @param buffer	缓冲区
	 * @param timeout	超时时间，毫秒
	 * @return 返回实际读取的数据长度，失败返回-1
     * \_en_
     * @brief read buffer
     *
	 * @param buffer the buffer
	 * @param timeout timeout in milliseconds
	 * @return the buffer length read, -1 for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see write
	 *
	 */
	int read(inout byte[] buffer, int timeout);
    /**
     * \cn_
     * @brief 写数据(发送)
     *
	 * @param data		要发送的数据
     * \_en_
     * @brief write
     *
	 * @param data the buffer want write
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see read
	 *
	 */
	void write(in byte[] data);
}
