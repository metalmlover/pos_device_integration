/*** Eclipse Class Decompiler plugin, copyright (c) 2016 Chen Chao (cnfree2000@hotmail.com) ***/
package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;

public class CandidateAppInfo implements Parcelable {
	/**候选应用标识符（AID）*/
	private byte[] tAID = new byte[16];
	/**候选应用标签*/
	private byte[] tAppLabel = new byte[16];
	/**应用优先级指示符*/
	private byte[] tAPN = new byte[16];
	private byte cAPID;
	private byte cFlgAPID;
	/**语言参考*/
	private byte[] sLangPref = new byte[8];
	/**发行方证书索引*/
	private byte cIssCTIndex;
	private byte cFlgIssCTIndex;
	public static final Creator<CandidateAppInfo> CREATOR = new Creator() {
		public CandidateAppInfo createFromParcel(Parcel source) {
			CandidateAppInfo appInfo = new CandidateAppInfo();

			readByteArray(source.createByteArray(), appInfo.tAID);
			readByteArray(source.createByteArray(), appInfo.tAppLabel);
			readByteArray(source.createByteArray(), appInfo.tAPN);

			appInfo.cAPID = source.readByte();
			appInfo.cFlgAPID = source.readByte();

			readByteArray(source.createByteArray(), appInfo.sLangPref);

			appInfo.cIssCTIndex = source.readByte();
			appInfo.cFlgIssCTIndex = source.readByte();
			return appInfo;
		}

		public CandidateAppInfo[] newArray(int size) {
			return new CandidateAppInfo[size];
		}

		private int getMinValue(int value1, int value2) {
			return ((value1 > value2) ? value2 : value1);
		}

		private void readByteArray(byte[] source, byte[] dest) {
			int arrayLen = 0;
			arrayLen = getMinValue(source.length, dest.length);
			System.arraycopy(source, 0, dest, 0, arrayLen);
		}
	};

	public void setAID(byte[] aid) {
		this.tAID = aid;
	}

	public byte[] getAID() {
		return this.tAID;
	}

	public void setAppLabel(byte[] appLabel) {
		this.tAppLabel = appLabel;
	}

	public byte[] getAppLabel() {
		return this.tAppLabel;
	}

	public void setAPN(byte[] apn) {
		this.tAPN = apn;
	}

	public byte[] getAPN() {
		return this.tAPN;
	}

	public void setAPID(byte apid) {
		this.cAPID = apid;
	}

	public byte getAPID() {
		return this.cAPID;
	}

	public void setAPIDFlag(byte flag) {
		this.cFlgAPID = flag;
	}

	public byte getAPIDFlag() {
		return this.cFlgAPID;
	}

	public void setLangPref(byte[] langPref) {
		this.sLangPref = langPref;
	}

	public byte[] getLangPref() {
		return this.sLangPref;
	}

	public void setIssCTIndex(byte index) {
		this.cIssCTIndex = index;
	}

	public byte getIssCTIndex() {
		return this.cIssCTIndex;
	}

	public void setIssCTIndexFlag(byte flag) {
		this.cFlgIssCTIndex = flag;
	}

	public byte getIssCTIndexFlag() {
		return this.cFlgIssCTIndex;
	}

	public int describeContents() {
		return 0;
	}

	public void writeToParcel(Parcel dest, int flags) {
		dest.writeByteArray(this.tAID);
		dest.writeByteArray(this.tAppLabel);
		dest.writeByteArray(this.tAPN);
		dest.writeByte(this.cAPID);
		dest.writeByte(this.cFlgAPID);
		dest.writeByteArray(this.sLangPref);
		dest.writeByte(this.cIssCTIndex);
		dest.writeByte(this.cFlgIssCTIndex);
	}
}