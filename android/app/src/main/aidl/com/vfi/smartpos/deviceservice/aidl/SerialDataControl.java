package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by CuncheW1 on 2017/8/23.
 */

public class SerialDataControl implements Parcelable {
    private int baudRate; // 请参考ExternalSerialConst中波特率相关参数进行设置
    private int dataBits; // 请参考ExternalSerialConst中数据位相关参数进行设置
    private int stopBits; // 请参考ExternalSerialConst中停止位相关参数进行设置
    private int serialParity; // 请参考ExternalSerialConst中奇偶校验位相关参数进行设置

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.baudRate);
        dest.writeInt(this.dataBits);
        dest.writeInt(this.stopBits);
        dest.writeInt(this.serialParity);
    }

    public SerialDataControl(int baudRate, int dataBits, int stopBits, int serialParity) {
        this.baudRate = baudRate;
        this.dataBits = dataBits;
        this.stopBits = stopBits;
        this.serialParity = serialParity;
    }

    protected SerialDataControl(Parcel in) {
        this.baudRate = in.readInt();
        this.dataBits = in.readInt();
        this.stopBits = in.readInt();
        this.serialParity = in.readInt();
    }

    public static final Creator<SerialDataControl> CREATOR = new Creator<SerialDataControl>() {
        public SerialDataControl createFromParcel(Parcel source) {
            return new SerialDataControl(source);
        }

        public SerialDataControl[] newArray(int size) {
            return new SerialDataControl[size];
        }
    };

    public int getBaudRate() {
        return baudRate;
    }

    public int getDataBits() {
        return dataBits;
    }

    public int getStopBits() {
        return stopBits;
    }

    public int getSerialParity() {
        return serialParity;
    }
}
