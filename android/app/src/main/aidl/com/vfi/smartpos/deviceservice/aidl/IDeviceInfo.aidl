package com.vfi.smartpos.deviceservice.aidl;
import com.vfi.smartpos.deviceservice.aidl.TusnData;
import android.os.Bundle;

/**
 * \cn_
 * @brief
 *
 * \_en_
 * @brief get some information of the device
 *
 * \en_e
 * \code{.java}
 * \endcode
  */
interface IDeviceInfo {

    /**
     * \cn_
     * @brief 获取终端设备序列号
     *
     * \_en_
     * @brief get the serial number(SN) of the terminal.
     *
     * \en_e
     * \code{.java}
     * \endcode
    */
    String getSerialNo();

    /**
     * \cn_
     * @brief 获取终端IMSI号
     *
     * \_en_
     * @brief get the IMSI of the terminal.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getIMSI();

    /**
     * \cn_
     * @brief 获取终端IMEI号
     *
     * \_en_
     * @brief get the IMEI of the terminal.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getIMEI();

    /**
     * \cn_
     * @brief 获取终端SIM卡ICCID号
     *
     * \_en_
     * @brief get the ICCID of the SIM card which present.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getICCID();

    /**
     * \cn_
     * @brief 获取厂商名称
     *
     * \_en_
     * @brief get name of manufacture
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getManufacture();

    /**
     * \cn_
     * @brief 获取终端型号
     *
     * \_en_
     * @brief get model of the terminal
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getModel();

    /**
     * \cn_
     * @brief 获取Android操作系统版本
     *
     * \_en_
     * @brief get the version of the Android OS.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getAndroidOSVersion();

    /**
     * \cn_
     * @brief 获取Android内核版本
     *
     * \_en_
     * @brief get the version of Android Kernel
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getAndroidKernelVersion();

    /**
     * \cn_
     * @brief 获取终端ROM版本
     *
     * \_en_
     * @brief get the ROM version of Android.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getROMVersion();

    /**
     * \cn_
     * @brief 获取终端固件版本
     *
     * \_en_
     * @brief get the firmare version of the terminal.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getFirmwareVersion();

    /**
     * \cn_
     * @brief 获取终端硬件版本
     *
     * \_en_
     * @brief get the hardware version
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getHardwareVersion();

    /**
     * \cn_
     * @brief 更新终端系统时间
     *
     * \_en_
     * @brief update the system time with setting
     * @parameter yyyyMMdd set the year, month, day of system time, the format is yyyyMMdd.
     * @parameter HHmmss set the hour, minute, seconds of system time, the format is HHmmss.
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    boolean updateSystemTime(String yyyyMMdd, String HHmmss);

    /**
     * \cn_
     * @brief 系统功能设置
     *
     * @param bundle
    * <li>HOMEKEY(boolean)</li>    //是否可用home键 | HomeKey enable or not
    * <li>STATUSBARKEY(boolean)</li>  //是否可用下拉栏 | status bar enable or not
     * \_en_
     * @brief set system feature
     *
     * @param bundle
     * <li>HOMEKEY(boolean)</li>    HomeKey enable or disable
     * <li>STATUSBARKEY(boolean)</li>  status bar(the drop down menu) enable or disable
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    boolean setSystemFunction(in Bundle bundle);

    /**
     * \cn_
     * @brief 获取银联终端唯一终端号 TUSN
     *
     * @param mode 模式, 预留参数， 需为0
     * @param input 指 对TUSN计算 MAC 时，参与计算的随机数(随机因子)，允许范围:4~10字节
     * @return 成功返回TUSN数据，失败返回null。
     * \_en_
     * @brief TUSN
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     *
    **/
  String getTUSN(int mode,  in byte[] input);

    /**
     * \cn_
     * @brief 获取终端设备序列号
     *
     * \_en_
     * @brief get the PN of the terminal.
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getPN();

    /**
     * \cn_
     * @brief 是否屏蔽powerKey
     *
     * \_en_
     * @brief set power key disable or enable
     *
     * @param status true - disable the power, false - enable the power key
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    void setPowerStatus(boolean status);

    /**
     * \cn_
     * @brief 内存总量(单位B)
     *
     * \_en_
     * @brief Ram Total(byte)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getRamTotal();

    /**
     * \cn_
     * @brief 内存可用容量(单位B)
     *
     * \_en_
     * @brief Ram available capacity(byte)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getRamAvailable();

    /**
     * \cn_
     * @brief FLASH总量(单位B)
     *
     * \_en_
     * @brief FLASH Rom total(byte)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getRomTotal();

    /**
     * \cn_
     * @brief FLASH可用容量(单位B)
     *
     * \_en_
     * @brief Rom available capacity(byte)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getRomAvailable();

    /**
     * \cn_
     * @brief 移动数据使用流量(单位B)
     *
     * \_en_
     * @brief the mobile data usage total amount(byte)
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getMobileDataUsageTotal();

    /**
     * \cn_
     * @brief 开关机次数
     *
     * \_en_
     * @brief boot count
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getBootCounts();

    /**
     * \cn_
     * @brief 走纸总长度(单位毫米)
     *
     * \_en_
     * @brief print paper legth
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getPrintPaperLen();

    /**
     * \cn_
     * @brief 刷卡次数
     *
     * \_en_
     * @brief Times of magnetic card used;
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getMagCardUsedTimes();

    /**
     * \cn_
     * @brief 插卡次数
     *
     * \_en_
     * @brief Times of smart card used;
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getSmartCardUsedTimes();

    /**
     * \cn_
     * @brief 非接读卡次数
     *
     * \_en_
     * @brief Times of CTLS card used;
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getCTLSCardUsedTimes();

    /**
     * \cn_
     * @brief 电池温度
     *
     * \_en_
     * @brief Battery Temperature;
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getBatteryTemperature();

    /**
     * \cn_
     * @brief 电池电量
     *
     * \_en_
     * @brief Battery level
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getBatteryLevel();

    /**
     * \cn_
     * @brief k21版本
     *
     * \_en_
     * @brief k21 version
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getK21Version();

    /**
     * \cn_
     * @brief Meid信息
     *
     * \_en_
     * @brief Meid info
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getMEID();

    /**
     * \cn_
     * @brief 获取tamperCode的值
     *
     * \_en_
     * @brief Get tampler code
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getTamperCode();


    /**
     * \en_
     * @brief Get X990 Service Version
     *
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    String getServiceVersion();

    /**
     * \en_
     * @brief Get Kernel version
     *
     * @return Bundle object, key like below:
     * <ul>
     * <li> SmartEMV(String)</li>
     * <li> Visa(String)</li>
     * <li> MasterCard(String)</li>
     * <li> JCB(String)</li>
     * <li> AMEX(String)</li>
     * <li> Discover(String)</li>
     * <li> QuickPass(String)</li>
     * <li> GemaltoPure(String)</li>
     * <li> RuPay(String)</li>
     * </ul>
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
    */
    Bundle getKernelVersion();

    /**
     * \en_
     * @brief Get certificate
     * @param mode mode 0 for sponsor digest, others, not support, return ""
     * @return value of certificate
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
    String getCertificate( int mode );

    String getBatteryChargingTimes();

     /**
     * \en_
     * @brief get device status
     * @param bundle transfer the type of device.
     * the key of bundle transmission is "DeviceType"
     * the values of DeviceType include "PRINTER", "ICCARDREADER_SLOT1", "ICCARDREADER_SLOT2",
     * "RFCARDREADER", "SAMCARDREADER_SLOT1", "SAMCARDREADER_SLOT2", "PINPAD",
     * "CAMERA_FRONT", "CAMERA_REAR", "SDCARD"
     * @return 0:normal, -1: abnormal.
     * \en_e
     * \code{.java}
     * \endcode
     * @version
     * @see
     */
     int getDeviceStatus(in Bundle bundle);


    /**
     * \en_
     coin
     * @brief Get button battery vol
     * @return value of voltage
     * \en_e
     * \code{.java}
     * \endcode
     * @version 2.18.0.6
     * @see
     */
     String getButtonBatteryVol();
}
