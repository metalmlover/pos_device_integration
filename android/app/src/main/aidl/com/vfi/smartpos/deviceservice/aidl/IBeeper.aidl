package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief  蜂鸣器对象
 *
 * \_en_
 * @brief the object of beeper
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface IBeeper {
	/**
     * \cn_
     * @brief 开始蜂鸣
     *
	 * 通过调用该方法可以让POS的蜂鸣器持续鸣叫msec毫秒。如果用户设定msec为0则不进行鸣叫。
	 * 蜂鸣器发声是采用非阻塞方式进行的，调用该函数之后，程序立即退出，不会停留在该函数。　
	 * @param msec - 需要鸣叫的时间，单位ms | the period of beeping, millisecond.
     * \_en_
     * @brief  start beep
     *
	 * Will not beep if setting with 0.
	 * It's a non-block method.
	 * @param msec the period of beeping, millisecond.
     * \en_e
     * \code{.java}
     * \endcode
     * @see stopBeep
	 */
	void startBeep(int msec);
	
	/**
     * \cn_
     * @brief 停止蜂鸣
     *
	 * 调用该方法后立即停止鸣叫 | beep will stop after stopBeep be called.
     * \_en_
     * @brief stop beep
     *
	 * beep will stop after stopBeep be called.
     * \en_e
     * \code{.java}
     * \endcode
	 */
	void stopBeep();
}
