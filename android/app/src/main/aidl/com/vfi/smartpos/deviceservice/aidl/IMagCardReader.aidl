package com.vfi.smartpos.deviceservice.aidl;

import com.vfi.smartpos.deviceservice.aidl.MagCardListener;

/**
 * \cn_
 * @brief 磁条卡刷卡器对象
 *
 * \_en_
 * @brief the object of magnetic card
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see IInsertCardReader IRFCardReader
 * @author: baoxl
 */
interface IMagCardReader {
	/**
     * \cn_
     * @brief 等待刷卡，获取磁卡卡片的磁道数据
     *
	 * @param timeout - 检卡超时时间(单位秒)
	 * @param listener - 磁卡刷卡监听器
     * \_en_
     * @brief search card, non-block method
     *
	 * @param timeout timeout of the search, second
	 * @param listener the callback listener whild card swiped
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	void searchCard(int timeout, MagCardListener listener);
	
	/**
     * \cn_
     * @brief 取消等待刷卡
     *
     * \_en_
     * @brief stop search
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
	void stopSearch();

	void enableTrack(int trkNum);
}
