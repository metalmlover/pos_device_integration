// FelicaHandler.aidl
package com.vfi.smartpos.deviceservice.aidl.card_reader;

import com.vfi.smartpos.deviceservice.aidl.card_reader.FelicaInfomation;
interface FelicaListener {

    /**
     * \en_
     * @brief Felica search card result
     *
	 * @param ret 0-success 1-timeout -1-failed
	 * @param felicaInfos list of felica data;
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see FelicaInfomation
	 */
    void onSearchResult(int ret, String felicaInfos);
}
