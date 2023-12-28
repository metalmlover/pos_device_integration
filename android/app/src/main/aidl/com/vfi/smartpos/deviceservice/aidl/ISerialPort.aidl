package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 串口设备对象
 *
 * 实现串口数据收发功能。
 * \_en_
 * @brief the object of serial port for serial communication
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see IDeviceService#getSerialPort
 *
 * @author: baoxl
 */
interface ISerialPort {
	/**
     * \cn_
     * @brief 打开串口
     *
	 * @return 成功true，失败false
     * \_en_
     * @brief open
     *
	 * @return true for success, false for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see init close
     *
	 */
	boolean open();
	
	/**
     * \cn_
     * @brief 关闭串口
     *
	 * @return 成功true，失败false
     * \_en_
     * @brief close
     *
	 * @return true for success, false for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see open
     *
	 */
	boolean close();
	
	/**
     * \cn_
     * @brief 初始化串口
     *
	 * @param bps	波特率
	 * <ul>
     * <li>1200 - 对应1200波特率</li>
     * <li>2400 - 对应2400波特率</li>
     * <li>4800 - 对应4800波特率</li>
     * <li>9600 - 对应9600波特率</li>
     * <li>14400 - 对应14400波特率</li>
     * <li>19200 - 对应19200波特率</li>
     * <li>28800 - 对应28800波特率</li>
     * <li>38400 - 对应38400波特率</li>
     * <li>57600 - 对应57600波特率</li>
     * <li>115200 - 对应115200波特率</li>
     * </ul>
	 * @param par	效验
	 * <ul>
     * <li>0 - 不校验</li>
     * <li>1 - 奇校验</li>
     * <li>2 - 偶校验</li>
     * </ul>
	 * @param dbs	数据位
	 * @return 成功true，失败false
     * \_en_
     * @brief initialize
     *
	 * @param bps the bps
	 * <ul>
     * <li>1200 </li><BR>
     * <li>2400 </li><BR>
     * <li>4800 </li><BR>
     * <li>9600 </li><BR>
     * <li>14400 </li><BR>
     * <li>19200 </li><BR>
     * <li>28800 </li><BR>
     * <li>38400 </li><BR>
     * <li>57600 </li><BR>
     * <li>115200 </li><BR>
     * </ul>
	 * @param par
	 * <ul>
     * <li>0 - no check</li><BR>
     * <li>1 - odd</li><BR>
     * <li>2 - even</li><BR>
     * </ul>
	 * @param dbs
	 * @return true for success, false for failure
	 * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see open
     *
	 *
	 */
	boolean init(int bps, int par, int dbs); 
	
	/**
     * \cn_
     * @brief 读数据(接收)
     *
	 * @param buffer	缓冲区
	 * @param timeout	超时时间，毫秒
	 * @return 返回实际读取的数据长度，失败返回-1
     * \_en_
     * @brief read
     *
	 * @param buffer the buffer
	 * @param timeout the timeout in millisecond
	 * @return the length read, or -1 on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see write
     *
	 *
	 */
	int read(inout byte[] buffer, int expectLen, int timeout);
	
    /**
     * \cn_
     * @brief 写数据(发送)
     *
	 * @param data		要发送的数据
	 * @param timeout	超时时间，毫秒
	 * @return 返回实际写入的数据长度，失败返回-1
     * \_en_
     * @brief write
     *
	 * @param data	the data buffer
	 * @param timeout	the timeout in millisecond
	 * @return the length wrote, or -1 on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see read
     *
	 *
	 */
	int write(in byte[] data, int timeout);
	
	/**
     * \cn_
     * @brief 清除接收缓冲区
     *
	 * @return 成功true，失败false
     * \_en_
     * @brief clean up the input(read) buffer
     *
	 * @return true for success, false for failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 *
	 */
	boolean clearInputBuffer();
	
	/**
     * \cn_
     * @brief 查看缓冲区是否为空
     *
	 * @param input	true为输入缓冲区，false为输出缓冲区
	 * @return 成功true，失败false
     * \_en_
     * @brief check if there is data in buffer
     *
	 * @param input	true for input(read)，false for output(write)
	 * @return true for data available, false for no data available
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 *
	 */
	 boolean isBufferEmpty(boolean input);
}
