package com.vfi.smartpos.deviceservice.aidl;

/**
     * \cn_
     * @brief
     *
     * \_en_
     * @brief
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
 * PBOC流程联机应答数据处理 | the online result
 * @author: baoxl
 */
interface OnlineResultHandler {
	/**
     * \cn_
     * @brief
     *
     * \_en_
     * @brief
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
	 * 联机应答数据处理回调 | the call back to process online response<br/>
	 * @param result - 处理结果 | the result
	 * <ul>
	 * <li>ONLINE_RESULT_TC(0) - 联机成功 | online result TC (success) </li>
	 * <li>ONLINE_RESULT_AAC(1) - 联机拒绝 | online result AAC (refuse) </li>
	 * <li>ONLINE_RESULT_OFFLINE_TC(101) - 联机失败，脱机成功 | online false, offline success</li>
	 * <li>ONLINE_RESULT_SCRIPT_NOT_EXECUTE(102) - 脚本未执行 | the script not execute</li>
     * <li>ONLINE_RESULT_SCRIPT_EXECUTE_FAIL(103) - 脚本执行失败 | failure while execute script</li>
	 * <li>ONLINE_RESULT_NO_SCRIPT(104) - 联机失败，未下送脚本 | online failure, not send the script</li>
	 * <li>ONLINE_RESULT_TOO_MANY_SCRIPT(105) - 联机失败，脚本超过1个 | online failure, more than one script</li>
	 * <li>ONLINE_RESULT_TERMINATE(106) - 联机失败，交易终止(GAC返回非9000，要提示交易终止,0x8F) | online failure, transaction terminate. return transaction terminate while GAC is not 9000, 0x8F </li>
	 * <li>ONLINE_RESULT_ERROR(107) - 联机失败，EMV内核错误 | online failure, error in EMV</li>
	 * <li>ONLINE_RESULT_OTHER_ERROR(110) - 其他错误 | other error</li>
	 * </ul>
	 * @param data - 结果数据 | the result date
	 * <ul>
     * <li>TC_DATA(String) - 交易结果TLV数据 | the TC data in TLV format</li>
     * <li>SCRIPT_DATA(String) - 脚本结果TLV数据 | the script data in TLV format</li>
     * <li>REVERSAL_DATA(String) - 冲正TLV数据  | the reversal data in TLV format</li>
     * </ul>
	 */
	void onProccessResult(int result, in Bundle data);
}
