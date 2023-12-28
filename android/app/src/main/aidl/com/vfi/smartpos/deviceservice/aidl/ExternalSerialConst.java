package com.vfi.smartpos.deviceservice.aidl;

/**
 * Created by CuncheW1 on 2017/8/23.
 */

public class ExternalSerialConst {
    /**
     * 外部串口定义
     */
    public static final int PORT_PINPAD = 0;
    public static final int PORT_RS232 = 1;

    /**
     * 波特率属性
     */
    public static final int BD3000000 = 0x00;
    public static final int BD1500000 = 0x01;
    public static final int BD115200 = 0x02;
    public static final int BD19200 = 0x03;
    public static final int BD9600 = 0x04;
    public static final int BD4800 = 0x05;
    public static final int BD2400 = 0x06;
    public static final int BD1200 = 0x07;
    public static final int BD300 = 0x08;

    /**
     * 数据位属性
     */
    public static final int DATA_5 = 0x00;
    public static final int DATA_6 = 0x01;
    public static final int DATA_7 = 0x02;
    public static final int DATA_8 = 0x03;

    /**
     * 停止位属性
     */
    public static final int DSTOP_1 = 0x00;
    public static final int DSTOP_2 = 0x01;

    /**
     * 奇偶校验属性
     */
    public static final int DPARITY_N = 'N';
    public static final int DPARITY_O = 'O';
    public static final int DPARITY_E = 'E';
    public static final int DPARITY_S = 'S';

    /**
     * 底座pinpad口功能模式
     */
    public static final int MODE_TRANSPARENT       = 1001; //底座pinpad口透传
    public static final int MODE_PP1000V3_PINPAD   = 1002; //底座pinpad口作为pp1000v3密码键盘使用,直接调用IPinpad.aidl中接口即可操作v3键盘
    public static final int MODE_PP1000V3_CTLS     = 1003; //底座pinpad口作为pp1000v3非接使用，直接调用IPBOC.aidl中的接口即可操作v2

    /**
     * 接口返回错误码
     */
    public static final int ERR_INVALID_PARAM           = -1; // 非法入参: 读写函数入参缓存buffer和指定长度非法
    public static final int ERR_PORT_NOT_OPEN           = -2; // 端口未打开
    public static final int ERR_DEVICE_NOT_CONNECT      = -3; // 底座未连接,但之前已经打开过端口，所以不用再打开一遍，当底座连上后会自动恢复

}
