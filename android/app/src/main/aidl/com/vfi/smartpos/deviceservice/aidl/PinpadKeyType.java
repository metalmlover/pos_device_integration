package com.vfi.smartpos.deviceservice.aidl;

/**
 * \cn_
 * @brief
 *
 * \_en_
 * @brief the Pinpad Key type
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @version
 * @see
 * */
public class PinpadKeyType{
	
	//0: MASTER KEY
	public static final int MASTERKEY = 0;
	
	//1:MAC key
	public static final int MACKEY = 1;
	
	// 2:PIN key
	public static final int PINKEY = 2;
	
	//3:TDK key
	public static final int TDKEY = 3;

	//4:(SM4)MASTER KEY
	public static final int SM_MASTERKEY = 4;

	//5:(SM4)MAC key
	public static final int SM_MACKEY = 5;

	//6:(SM4)PIN key
	public static final int SM_PINKEY = 6;

	//7:(SM4)TDK key
	public static final int SM_TDKEY = 7;

	//8:(SM4)MASTER KEY
	public static final int AES_MASTERKEY = 8;

	//9:(SM4)MAC key
	public static final int AES_MACKEY = 9;

	//10:(SM4)PIN key
	public static final int AES_PINKEY = 10;

	//11:(SM4)TDK key
	public static final int AES_TDKEY = 11;

	//12:DUKPT key
	public static final int DUKPTKEY = 12;

	//13: TEK
	public static final int TEK = 13;

	//14: TEK
	public static final int SM_TEK = 14;

	//15: TEK
	public static final int AES_TEK = 15;
}
