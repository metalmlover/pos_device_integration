// IFelica.aidl
package com.vfi.smartpos.deviceservice.aidl.card_reader;
import com.vfi.smartpos.deviceservice.aidl.card_reader.FelicaListener;

interface IFelica {

	/**
     * \en_
     * @brief Felica power on
	 * @return true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
    boolean powerOn();

	/**
     * \en_
     * @brief Felica power off
	 * @return true on success, false on failure
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 */
    boolean powerOff();


	/**
     * \en_
     * @brief search card
     *
	 * @param conflictType 1-conflict slot 1 2-conflict slot 2 4-confilict slot 4 8-confilict slot 8 16-conflict slot 16
	 * @param systemNumOne  System number 1, default to 0xFF, indicating the use of wildcard settings
	 * @param systemNumTwo  System number 2, default to 0xFF, indicating the use of wildcard settings
	 * @param requestType 0-FELICA_REQ_NO_REQUEST 1-FELICA_REQ_SYSTEM_CODE 2-FELICA_REQ_COM_PERFORMANCE
	 * @param listener the call back listener
	 * @param timeout timeout in ms, should >= 1000
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see stopSearch RFSearchListener
     *
	 */
    void searchCard(int conflictType, byte systemNumOne, byte systemNumTwo, int requestType, in FelicaListener listener, int timeout);

	/**
     * \en_
     * @brief communicate command
     *
	 * @param sendData - the command
	 * @return the response data
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
    byte[] communicate(in byte[] sendData);

	/**
     * \en_
     * @brief stop search card
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
	 */
    void stopSearch();
}
