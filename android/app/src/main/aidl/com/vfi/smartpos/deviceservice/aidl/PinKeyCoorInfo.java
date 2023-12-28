package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;

public class PinKeyCoorInfo implements Parcelable {
    private String keyName;
    private int coor1_x, coor1_y, coor2_x, coor2_y, keyType;
    public static final int TYPE_NUM = 0;
    public static final int TYPE_CONF = 1;
    public static final int TYPE_CANCEL = 2;
    public static final int TYPE_DEL = 3;
    public static final int TYPE_DEL_ALL = 4;

    protected PinKeyCoorInfo(Parcel in) {
        keyName = in.readString();
        coor1_x = in.readInt();
        coor1_y = in.readInt();
        coor2_x = in.readInt();
        coor2_y = in.readInt();
        keyType = in.readInt();
    }

    public static final Creator<PinKeyCoorInfo> CREATOR = new Creator<PinKeyCoorInfo>() {
        @Override
        public PinKeyCoorInfo createFromParcel(Parcel in) {
            return new PinKeyCoorInfo(in);
        }

        @Override
        public PinKeyCoorInfo[] newArray(int size) {
            return new PinKeyCoorInfo[size];
        }
    };

    /**
     *
     * @param keyName
     * @param coor1_x
     * @param coor1_y
     * @param coor2_x
     * @param coor2_y
     * @param keyType 0-TypeNum 1-TypeConf 2-TypeCancel 3-TypeDel
     */
    public PinKeyCoorInfo(String keyName, int coor1_x, int coor1_y, int coor2_x, int coor2_y, int keyType) {
        Log.d("TAG", "keyname:" + keyName + " x1:" + coor1_x + " y1:" + coor1_y + " x2:" + coor2_x + " y2:" + coor2_y);
        this.keyName = keyName;
        this.coor1_x = coor1_x;
        this.coor1_y = coor1_y;
        this.coor2_x = coor2_x;
        this.coor2_y = coor2_y;
        this.keyType = keyType;
    }

    public String getKeyName() {
        return this.keyName;
    }

    public int[] getCoor1() {
        int[] coor1 = new int[2];
        coor1[0] = coor1_x;
        coor1[1] = coor1_y;
        return coor1;
    }

    public int[] getCoor2() {
        int[] coor2 = new int[2];
        coor2[0] = coor2_x;
        coor2[1] = coor2_y;
        return coor2;
    }

    public int getKeyType() {
        return this.keyType;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.keyName);
        dest.writeInt(this.coor1_x);
        dest.writeInt(this.coor1_y);
        dest.writeInt(this.coor2_x);
        dest.writeInt(this.coor2_y);
        dest.writeInt(this.keyType);
    }
}
