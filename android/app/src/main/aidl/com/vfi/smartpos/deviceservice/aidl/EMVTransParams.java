package com.vfi.smartpos.deviceservice.aidl;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

public class EMVTransParams implements Parcelable {
    static private double ver = 1.0;
    // ver 1.0
    private byte[] termCap; // Terminal Capabilities(9F33), use value of 9F33 from AID String if not set here.
    private byte[] termAddCap; // Additional Terminal Capabilities(9F40), use value of 9F40 from AID String if not set here.
    private byte[] termType; // Terminal Type(9F35), use value of 9F35 from AID String if not set here.
    private byte[] countryCode; // Terminal Country Code(9F1A), use value of 9F1A from AID String if not set here.
    private byte[] currencyCode; // Transaction Currency Code(5F2A), use value of 5F2A from AID String if not set here.
    private byte[] referCurrencyCode; // Transaction Reference Currency Code (9F3C), use value of 9F3C from AID String if not set here.
    private byte transType; // Translation type (9C first two digits of the ISO 8583:1987 Processing Code)
    private boolean isForceOnline; // Force Online
    private String merchantId; // merchant ID (15 bytes)
    private String terminalId; // terminal ID (8 bytes)
    private String merchantName; //merchant Name (var. bytes)
    private long amount; // auth-amount (transaction amount)
    private long otherAmount;
    private int transFlowType; // emv process 1-full process  2-simple process
    private int transCardType; // CARD_INSERT(0)- smart IC card CARD_RF(1)- CTLS card </li>

    public byte[] getTermCap() {
        return termCap;
    }

    public byte[] getTermAddCap() {
        return termAddCap;
    }

    public byte[] getTermType() {
        return termType;
    }

    public byte[] getCountryCode() {
        return countryCode;
    }

    public byte[] getCurrencyCode() {
        return currencyCode;
    }

    public byte[] getReferCurrencyCode() {
        return referCurrencyCode;
    }

    public byte getTransType() {
        return transType;
    }

    public boolean isForceOnline() {
        return isForceOnline;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public String getTerminalId() {
        return terminalId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public long getAmount() {
        return amount;
    }

    public long getOtherAmount() {
        return otherAmount;
    }

    public int getTransFlowType() {
        return transFlowType;
    }

    public int getTransCardType() {
        return transCardType;
    }

    // ver 1.1 todo this is a test for extend
    private String otherParam;

    public String getOtherParam() {
        return otherParam;
    }


    public EMVTransParams(byte[] termCap, byte[] termAddCap, byte[] termType, byte[] countryCode, byte[] currencyCode, byte[] referCurrencyCode,
                          byte transType, boolean isForceOnline, String merchantId, String terminalId, String merchantName,
                          long amount, long otherAmount, int transFlowType, int transCardType) {
        ver = 1.0;
        this.termCap = termCap;
        this.termAddCap = termAddCap;
        this.termType = termType;
        this.countryCode = countryCode;
        this.currencyCode = currencyCode;
        this.referCurrencyCode = referCurrencyCode;
        this.transType = transType;
        this.isForceOnline = isForceOnline;
        this.merchantId = merchantId;
        this.terminalId = terminalId;
        this.merchantName = merchantName;
        this.amount = amount;
        this.otherAmount = otherAmount;
        this.transFlowType = transFlowType;
        this.transCardType = transCardType;
    }

    public EMVTransParams(byte[] termCap, byte[] termAddCap, byte[] termType, byte[] countryCode, byte[] currencyCode, byte[] referCurrencyCode,
                          byte transType, boolean isForceOnline, String merchantId, String terminalId, String merchantName,
                          long amount, long otherAmount, int transFlowType, int transCardType, String otherParam) {
        ver = 1.1;
        this.termCap = termCap;
        this.termAddCap = termAddCap;
        this.termType = termType;
        this.countryCode = countryCode;
        this.currencyCode = currencyCode;
        this.referCurrencyCode = referCurrencyCode;
        this.transType = transType;
        this.isForceOnline = isForceOnline;
        this.merchantId = merchantId;
        this.terminalId = terminalId;
        this.merchantName = merchantName;
        this.amount = amount;
        this.otherAmount = otherAmount;
        this.transFlowType = transFlowType;
        this.transCardType = transCardType;
        // ver 1.1
        this.otherParam = otherParam;
    }


    protected EMVTransParams(Parcel in) {
        if (ver >= 1.0) {
            termCap = in.createByteArray();
            termAddCap = in.createByteArray();
            termType = in.createByteArray();
            countryCode = in.createByteArray();
            currencyCode = in.createByteArray();
            referCurrencyCode = in.createByteArray();
            transType = in.readByte();
            isForceOnline = in.readByte() != 0;
            merchantId = in.readString();
            terminalId = in.readString();
            merchantName = in.readString();
            amount = in.readLong();
            otherAmount = in.readLong();
            transFlowType = in.readInt();
            transCardType = in.readInt();
        }
        if (ver > 1.1) {
            otherParam = in.readString();
        }

    }

    public static final Creator<EMVTransParams> CREATOR = new Creator<EMVTransParams>() {
        @Override
        public EMVTransParams createFromParcel(Parcel in) {
            return new EMVTransParams(in);
        }

        @Override
        public EMVTransParams[] newArray(int size) {
            return new EMVTransParams[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        if (ver >= 1.0) {
            dest.writeByteArray(termCap);
            dest.writeByteArray(termAddCap);
            dest.writeByteArray(termType);
            dest.writeByteArray(countryCode);
            dest.writeByteArray(currencyCode);
            dest.writeByteArray(referCurrencyCode);
            dest.writeByte(transType);
            dest.writeByte((byte) (isForceOnline ? 1 : 0));
            dest.writeString(merchantId);
            dest.writeString(terminalId);
            dest.writeString(merchantName);
            dest.writeLong(amount);
            dest.writeLong(otherAmount);
            dest.writeInt(transFlowType);
            dest.writeInt(transCardType);
        }
        if (ver >= 1.1) {
            dest.writeString(otherParam);
        }
    }
}
