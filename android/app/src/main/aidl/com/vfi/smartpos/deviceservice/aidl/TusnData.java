package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * TUSN数据
 * @author laikey
 *
 */
public class TusnData implements Parcelable {
	
	public static final Creator<TusnData> CREATOR = new Creator<TusnData>() {
		@Override
		public TusnData createFromParcel(Parcel source) {
			return new TusnData(source);
		}

		@Override
		public TusnData[] newArray(int size) {
			return new TusnData[size];
		}
	};

	/** 终端类型: 1为旧终端 2为新终端 */
	private int mTerminalType;
	/** 使用终端TUSN_AUK对传入随机数与TUSN进行MAC运算的结果，对于旧终端，为8个空格 */
	private String mMac;
	/** 唯一终端序列号 */
	private String mTusn;
	
	protected TusnData(Parcel source) {
		mTerminalType = source.readInt();
		mMac = source.readString();
		mTusn = source.readString();
	}
	
	public TusnData() {}
	
	public void setTerminalType(int type) {
		mTerminalType = type;
	}
	
	public void setMac(String mac) {
		mMac = mac;
	}
	
	public void setTusn(String tusn) {
		mTusn = tusn;
	}
	
	public String getMac() {
		return mMac;
	}
	
	public String getTusn() {
		return mTusn;
	}
	
	public int getTerminalType() {
		return mTerminalType;
	}
	
	@Override
	public int describeContents() {
		return 0;
	}
	
	@Override
	public void writeToParcel(Parcel dest, int flags) {
		dest.writeInt(mTerminalType);
		dest.writeString(mMac);
		dest.writeString(mTusn);
	}
}
