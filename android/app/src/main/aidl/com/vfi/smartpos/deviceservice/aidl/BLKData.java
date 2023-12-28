package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;

public class BLKData implements Parcelable {

    private byte[] cardblk; // tag5A
    private byte sn; // tag5F34

    public byte[] getCardblk() {
        return cardblk;
    }

    public byte getSn() {
        return sn;
    }

    public BLKData(byte[] cardblk, byte sn) {
        this.cardblk = cardblk;
        this.sn = sn;
    }

    public static final Creator<BLKData> CREATOR = new Creator<BLKData>() {
        @Override
        public BLKData createFromParcel(Parcel in) {
            return new BLKData(in.createByteArray(), in.readByte());
        }

        @Override
        public BLKData[] newArray(int size) {
            return new BLKData[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeByteArray(cardblk);
        dest.writeByte(sn);
    }
}
