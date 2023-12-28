// IExternalSerialPort.aidl
package com.vfi.smartpos.deviceservice.aidl;

import com.vfi.smartpos.deviceservice.aidl.SerialDataControl;

    /**
    * about the serial port on dock ( base )
    */
interface IExternalSerialPort {
    /**
     * 设置底座Pinpad口功能模式，分透传模式、外置pp1000v3密码键盘模式、外置pp1000v3非接模式, 默认为透传类型,此设置掉电不丢失.
     * 由于底座Pinpad口只有一个，当选择其中一个功能模式后别的功能接口将不能使用,除非再次调用此接口进行切换.
     * @param portMode 请参考ExternalSerialConst中底座pinpad口功能模式定义部分, 当传入非定义值时不设置模式但返回当前使用的模式
     * @return 返回当前底座pinpad口功能模式
     */
     int setExtPinpadPortMode(int portMode);

    /**
     * 判断POS是否连接上底座, 如果连接上底座返回true，否则返回false.
     */
    boolean isExternalConnected();

    /**
     * 打开地址串口，并设置串口数据控制属性（波特率、数据位、停止位、校验位),如果已经打开过直接返回true
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口),最好以ExternalSerialConst中的端口常量编码,不要直接传0或者1
     *  @param dataControl : 设置串口数据控制属性，即波特率等，具体参考ExtternalSerialConst
     *  @return 返回打开设备是否成功,如果打开失败就读写数据，读写返回值为0
     */
    boolean openSerialPort(int portNum, String dataControl);

    /**
     * 非阻塞写串口数据，返回成功传送的数据长度。
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口),最好以ExternalSerialConst中的端口常量编码,不要直接传0或者1
     *  @param writeData : 要传输的数据缓存
     *  @param dataLength : 要传输的数据长度
     *  @return 返回实际发生出去的数据长度;返回0表示没有发出去任何数据;负数参考ExternalSerialconst错误常量说明.
     */
    int writeSerialPort(int portNum, in byte[] writeData, int dataLength);

    /**
     * 非阻塞读串口数据，返回成功读取数据长度。
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口)
     *  @param readData : 存要读取数据的缓冲区
     *  @param dataLength : 想要读取数据长度 (不能超过缓冲区大小)
     *  @return 返回实际读到的数据长度;返回0表示没有收到任何数据;负数参考ExternalSerialconst错误常量说明.
     */
    int readSerialPort(int portNum, out byte[] readData, int dataLength);

    /**
     * 阻塞写串口数据直到超时，返回成功传送的数据长度。
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口),最好以ExternalSerialConst中的端口常量编码,不要直接传0或者1
     *  @param writeData : 要传输的数据缓存
     *  @param dataLength : 要传输的数据长度
     *  @param timeoutMs : 超时时间(单位毫秒)
     *  @return 返回实际发生出去的数据长度.返回0表示超时没有发出任何数据;负数参考ExternalSerialconst错误常量说明.
     */
    int safeWriteSerialPort(int portNum, in byte[] writeData, int Length, long timeoutMs);

    /**
     * 阻塞读串口数据直到超时，返回成功读取数据长度。
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口),最好以ExternalSerialConst中的端口常量编码,不要直接传0或者1
     *  @param readData : 存要读取数据的缓冲区
     *  @param dataLength : 想要读取数据长度 (不能超过缓冲区大小)
     *  @param timeoutMs : 超时时间(单位毫秒)
     *  @return 返回实际读到的数据长度;返回0表示超时没有收到任何数据;负数参考ExternalSerialconst错误常量说明.
     */
    int safeReadSerialPort(int portNum, out byte[] readData, int Length, long timeoutMs);

    /**
     * 关闭串口
     *  @param portNum : 0 - PinPad口(带5v电源)  1 - RS232(标准串口),最好以ExternalSerialConst中的端口常量编码,不要直接传0或者1
     */
    void closeSerialPort(int portNum);
}
