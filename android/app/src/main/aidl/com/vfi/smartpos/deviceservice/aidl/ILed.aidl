package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief 设备LED灯对象
 *
 * \_en_
 * @brief the object of LED
 *
 * \en_e
 * \code{.java}
 * \endcode
 *
 * @author: baoxl
 */
interface ILed {
	/**
     * \cn_
     * @brief 点亮LED灯
     *
	 * @param led - 灯标识 | index of the led
	 * <ul>
	 * <li> 1 - 蓝灯</li> | the blue
	 * <li> 2 - 黄灯</li> | the yellow
	 * <li> 3 - 绿灯</li> | the green
	 * <li> 4 - 红灯</li> | the red
	 * </ul>
     * \_en_
     * @brief turn on the led
     *
	 * @param led index of the led
	 * <ul>
	 * <li> 1 - the blue</li>
	 * <li> 2 - the yellow</li>
	 * <li> 3 - the green</li>
	 * <li> 4 - the red</li>
	 * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 *
	 */
	void turnOn(int led);

	/**
     * \cn_
     * @brief 关闭LED灯
     *
	 * @param led - 灯标识 | index of the led
     * <ul>
     * <li> 1 - 蓝灯</li> | the blue
     * <li> 2 - 黄灯</li> | the yellow
     * <li> 3 - 绿灯</li> | the green
     * <li> 4 - 红灯</li> | the red
     * </ul>
     * \_en_
     * @brief turn off the led
     *
	 * @param led index of the led
     * <ul>
     * <li> 1 - the blue</li>
     * <li> 2 - the yellow</li>
     * <li> 3 - the green</li>
     * <li> 4 - the red</li>
     * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	void turnOff(int led);


    /** \en_
     * @brief control led
     *
	 * @param led 0x01-blue, 0x02-green, 0x03-yellow, 0x04-red
	 * @param status 0-close 1-open
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
	void ledControl(byte led, byte status);
}

