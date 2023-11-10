package com.vfi.smartpos.deviceservice.aidl;

import com.vfi.smartpos.deviceservice.aidl.IBeeper;
import com.vfi.smartpos.deviceservice.aidl.ILed;
import com.vfi.smartpos.deviceservice.aidl.IMagCardReader;
import com.vfi.smartpos.deviceservice.aidl.IDeviceService;
import com.vfi.smartpos.deviceservice.aidl.IInsertCardReader;

import com.vfi.smartpos.deviceservice.aidl.IPinpad;
import com.vfi.smartpos.deviceservice.aidl.IPrinter;
import com.vfi.smartpos.deviceservice.aidl.IRFCardReader;
import com.vfi.smartpos.deviceservice.aidl.IScanner;
import com.vfi.smartpos.deviceservice.aidl.ISerialPort;


/**
 * \cn_
 * @brief 设备服务对象，提供范围终端各外设对象的服务接口
 *
 * \_en_
 * @brief Device service, get each interface (object) in this interface
 *
 * \en_e
 * \code{.java}
 * \endcode
 * @author: baoxl
 */
interface IDeviceService {
    /**
     * \cn_
     * @brief 获取蜂鸣器操作对象
     *
     * @return IBeeper对象，参见IBeeper.aidl类 | @return object IBeeper, please refer IBeeper.aidl
     * \_en_
     * @brief get the IBeeper for beeper
     *
     * @return object IBeeper, please refer IBeeper.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IBeeper
     */
    IBeeper getBeeper();
    
    /**
     * \cn_
     * @brief 获取LED灯操作对象
     *
     * @return ILed对象，参见ILed.aidl类 | @return object ILed, please refer ILed.aidl
     * \_en_
     * @brief get the ILed for led
     *
     * @return object ILed, please refer ILed.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see ILed
     */
    ILed getLed();
    
    /**
     * \cn_
     * @brief 获取串口操作对象
     *
     * @param deviceType - 串口连接线种类 | String rs232 or usb-rs232
     * @return ISerialPort对象，参见ISerialPort.aidl类 | @return object ISerialPort, please refer ISerialPort.aidl
     * \_en_
     * @brief get the ISerialPort for serial
     *
     * @param deviceType <BR>
     *     String "rs232" means the port via build in serial chip micro USB cable (one side is micro USB connect to terminal, another side is 9 pin interface connect to COM port in PC.)<BR>
     *     "usb-rs232" means the port via micro USB cable<BR>
     * @return object ISerialPort, please refer ISerialPort.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see ISerialPort
     */
    ISerialPort getSerialPort(String deviceType);
    
    /**
     * \cn_
     * @brief 获取扫码器操作对象
     *
     * @param cameraId - 1-前置扫码器，0-后置扫码器 | 1 for front, 0 for rear
     * @return IScanner对象，参见IScanner.aidl类 | @return object IScanner, please refer IScanner.aidl
     * \_en_
     * @brief get the IScanner for scanner
     *
     * @param cameraId 1 for front, 0 for rear
     * @return object IScanner, please refer IScanner.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IScanner
     */
    IScanner getScanner(int cameraId);

    /**
     * \cn_
     * @brief 获取磁卡操作句柄
     *
     * @return IMagCardReader对象，参见IMagCardReader.aidl类 | @return IMagCardReader, please refer IMagCardReader.aidl
     * \_en_
     * @brief get the IMagCardReader for magnetic card reader
     *
     * @return IMagCardReader, please refer IMagCardReader.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IMagCardReader
     */
    IMagCardReader getMagCardReader();
    
    /**
     * \cn_
     * @brief 获取IC卡操作对象
     *
     * 0 IC卡 1 SAM1卡 2 SAM2卡 | 0 for IC card slot, 1 for SAM1 card slot, 2 for SAM2 card slot
     * @return IC卡操作对象，参见IInsertCardReader.aidl类 | @return IInertCardReader, please refer IInsertCardReader.aidl
     * \_en_
     * @brief get the IInsertCardReader for smart card and PSAM card
     *
     * @param slotNo 0 for IC card slot, 1 for SAM1 card slot, 2 for SAM2 card slot
     * @return IInertCardReader, please refer IInsertCardReader.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IInertCardReader
     */
    IInsertCardReader getInsertCardReader(int slotNo);
    
    /**
     * \cn_
     * @brief 获取RF卡操作对象
     *
     * @return RF卡操作对象，参见IRFCardReader.aidl类| @ return IRFCardReader, please refer IRFCardReader.aidl
     * \_en_
     * @brief get the IRFCardReader for CTLS card
     *
     * @return IRFCardReader, please refer IRFCardReader.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IRFCardReader
     */
    IRFCardReader getRFCardReader();
    
    /**
     * \cn_
     * @brief 获取密码键盘操作对象
     *
     * @param kapId  密码键盘kapId索引，每个kapId对一个逻辑密码键盘 | kapId, the index refer the key set
     * @return IPinpad对象，参见IPinpad.aidl类 | @return IPinpad, please refer IPinpad.aidl
     * \_en_
     * @brief get IPinpad for Pinpad
     *
     * @param kapId  the index refer the keys set
     * @return IPinpad, please refer IPinpad.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IPinpad
     */
    IPinpad getPinpad(int kapId);
    
    /**
     * \cn_
     * @brief 获取打印机操作对象
     *
     * @return IPrinter对象，参见IPrinter.aidl类 | @return IPrinter, please refer IPrinter.aidl
     * \_en_
     * @brief get IPrinter for printer
     *
     * @return IPrinter, please refer IPrinter.aidl
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see IPrinter
     */
    IPrinter getPrinter();
    
}
