// DOCS https://docs.flutter.dev/platform-integration/platform-channels?tab=android-channel-java-tab
// migrating old projects
// https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects

package com.electronss.pos_device_integration;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.content.ComponentName;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.IBinder;
import android.os.PersistableBundle;
import android.os.RemoteException;
import android.widget.Toast;

//device
import com.vfi.smartpos.deviceservice.aidl.IDeviceService;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
//import android.support.v7.app.AppCompatActivity;
import android.util.Log;


import com.vfi.smartpos.deviceservice.aidl.IPrinter;

//import com.vfi.smartpos.deviceservice.aidl.PrinterConfig;

import com.vfi.smartpos.deviceservice.aidl.PrinterListener;

import java.io.IOException;
import java.io.InputStream;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "electronss.flutter.dev/battery";

    private static final String TAG = "SEEGYPT_TAG" ;
    IDeviceService iDeviceService;
    IPrinter iPrinter;


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);
//        setContentView(R.layout.activity_main);

        // check assets fonts and copy to file system for Service
        InitializeFontFiles();
    }

    @Override
    protected void onResume() {
        super.onResume();
        Intent intent = new Intent();
        intent.setAction("com.vfi.smartpos.device_service");
        intent.setPackage("com.vfi.smartpos.deviceservice");
        boolean iSuccess = bindService(intent,connection,Context.BIND_AUTO_CREATE);
        if(iSuccess){
            Toast.makeText(MainActivity.this,"Device ready",Toast.LENGTH_LONG).show();
        } else{
            Toast.makeText(MainActivity.this,"Device not ready",Toast.LENGTH_LONG).show();
        }
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "electronss.flutter.dev/battery")
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getBatteryLevel")) {
                                int batteryLevel = getBatteryLevel();
                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Could not fetch battery level.", null);
                                }
                            } else if (call.method.equals("testDevicePrinter")) {
                                boolean testedPrinter = testDevicePrinter();
                                if (testedPrinter != false) {
                                    result.success(testedPrinter);
                                } else {
                                    result.error("UNAVAILABLE", "Could not test printer.", null);
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }



    private ServiceConnection connection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            iDeviceService = IDeviceService.Stub.asInterface(service);

            try {
                iPrinter = iDeviceService.getPrinter();
            } catch (RemoteException e) {
                e.printStackTrace();
            }

            Toast.makeText(MainActivity.this,"bind service success",Toast.LENGTH_LONG).show();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            Toast.makeText(MainActivity.this,"bind service Disconnect",Toast.LENGTH_LONG).show();
        }
    };

    protected void InitializeFontFiles () {
        PrinterFonts.initialize(this.getAssets());
    }

    public void testPrinter() {

        Log.d(TAG, "testPrinter");
        // bundle format for addText
        Bundle format = new Bundle();

        try {

//            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_DH_24_48_IN_BOLD);
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "يونيون اير");

            iPrinter.addText(format, "Systems Engineering of Egypt");

//            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.LARGE_DH_32_64_IN_BOLD);
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "Systems Engineering of Egypt");

//            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.HUGE_48);
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "Systems Engineering of Egypt");

            iPrinter.feedLine(3);

            // image
//            byte[] buffer = null;
//            InputStream is = null;
//            try {
//                is = this.getAssets().open("verifone_logo.jpg");
//                // get the size
//                int size = is.available();
//                // crete the array of byte
//                buffer = new byte[size];
//                is.read(buffer);
//                // close the stream
//                is.close();
//                Log.d(TAG, "image");
//            } catch (IOException e) {
//                Log.d(TAG, "image fail");
//                e.printStackTrace();
//            }

//            if( null != buffer) {
//                Bundle fmtImage = new Bundle();
//                fmtImage.putInt("offset", (384-200)/2);
//                fmtImage.putInt("width", 250);  // bigger then actual, will print the actual
//                fmtImage.putInt("height", 128); // bigger then actual, will print the actual
//                iPrinter.addImage( fmtImage, buffer );
//
//                fmtImage.putInt("offset", 50 );
//                fmtImage.putInt("width", 100 ); // smaller then actual, will print the setting
//                fmtImage.putInt("height", 24); // smaller then actual, will print the setting
//                iPrinter.addImage( fmtImage, buffer );
//            }

            Bundle fmtAddTextInLine = new Bundle();
            //
//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_FORTE );
//            iPrinter.addTextInLine(fmtAddTextInLine, "Verifone X9-Series", "", "", 0);
//            //
//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.NORMAL_24_24 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_segoesc );
            iPrinter.addTextInLine(fmtAddTextInLine, "", "", "This is the Print Demo", 0);


//            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_24_24);
            iPrinter.addText(format, "Hello Verifone in font NORMAL_24_24!");
            // left
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
            iPrinter.addText(format, "Left Alignment long string here: PrinterConfig.addText.Alignment.LEFT ");

            // right
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.RIGHT );
            iPrinter.addText(format, "Right Alignment  long  string with wrapper here");

            iPrinter.addText(format, "--------------------------------");
//            Bundle fmtAddBarCode = new Bundle();
//            fmtAddBarCode.putInt( PrinterConfig.addBarCode.Alignment.BundleName, PrinterConfig.addBarCode.Alignment.RIGHT );
//            fmtAddBarCode.putInt( PrinterConfig.addBarCode.Height.BundleName, 64 );
//            iPrinter.addBarCode( fmtAddBarCode, "123456 Verifone" );

//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.FONT_AGENCYB);
            iPrinter.addTextInLine(fmtAddTextInLine, "", "123456 Verifone", "", 0);
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English );    // set to the default

            iPrinter.addText(format, "--------------------------------");


//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_ALGER );
            iPrinter.addTextInLine( fmtAddTextInLine, "Left", "Center", "right", 0);
//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_BROADW );
//            iPrinter.addTextInLine( fmtAddTextInLine, "L & R", "", "Divide Equally", 0);
//            iPrinter.addTextInLine( fmtAddTextInLine, "L & R", "", "Divide flexible", PrinterConfig.addTextInLine.mode.Devide_flexible);
            // left
//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
            iPrinter.addText(format, "--------------------------------");

//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English);
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_segoesc );
            iPrinter.addTextInLine( fmtAddTextInLine,
                    "", "",
                    "Right long string here call addTextInLine ONLY give the right string",
                    0);

//            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
//            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_24_24 );
            iPrinter.addText(format, "--------------------------------");

//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English);  // this the default
            iPrinter.addTextInLine( fmtAddTextInLine, "", "#",
                    "Right long string with the center string",
                    0);
            iPrinter.addText(format, "--------------------------------");
//            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.SMALL_16_16);
//            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.FONT_AGENCYB);
//            iPrinter.addTextInLine( fmtAddTextInLine, "Print the QR code far from the barcode to avoid scanner found both of them", "",
//                    "",
//                    PrinterConfig.addTextInLine.mode.Devide_flexible);

//            Bundle fmtAddQRCode = new Bundle();
//            fmtAddQRCode.putInt( PrinterConfig.addQrCode.Offset.BundleName, 128);
//            fmtAddQRCode.putInt( PrinterConfig.addQrCode.Height.BundleName, 128);
//            iPrinter.addQrCode( fmtAddQRCode, "www.seegypt.com");

//            iPrinter.addTextInLine( fmtAddTextInLine, "", "try to scan it",
//                    "",
//                    0);


            iPrinter.addText(format, "---------X-----------X----------");
            iPrinter.feedLine(5);
            // start print here
            Log.d(TAG, "end printer");
            iPrinter.startPrint(new MyListener());
        } catch (RemoteException e) {
            Log.d(TAG, "testPrinter fail");
            e.printStackTrace();
        }


    }

    public void testPrinterEdit() {

        Log.d(TAG, "testPrinter");
        // bundle format for addText
        Bundle format = new Bundle();

        try {

            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_DH_24_48_IN_BOLD);
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "يونيون اير");

            iPrinter.addText(format, "Systems Engineering of Egypt");

            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.LARGE_DH_32_64_IN_BOLD);
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "Systems Engineering of Egypt");

            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.HUGE_48);
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.CENTER);
            iPrinter.addText(format, "Systems Engineering of Egypt");

            iPrinter.feedLine(3);

            // image
            byte[] buffer = null;
            InputStream is = null;
            try {
                is = this.getAssets().open("verifone_logo.jpg");
                // get the size
                int size = is.available();
                // crete the array of byte
                buffer = new byte[size];
                is.read(buffer);
                // close the stream
                is.close();
                Log.d(TAG, "image");
            } catch (IOException e) {
                Log.d(TAG, "image fail");
                e.printStackTrace();
            }

            if( null != buffer) {
                Bundle fmtImage = new Bundle();
                fmtImage.putInt("offset", (384-200)/2);
                fmtImage.putInt("width", 250);  // bigger then actual, will print the actual
                fmtImage.putInt("height", 128); // bigger then actual, will print the actual
                iPrinter.addImage( fmtImage, buffer );

                fmtImage.putInt("offset", 50 );
                fmtImage.putInt("width", 100 ); // smaller then actual, will print the setting
                fmtImage.putInt("height", 24); // smaller then actual, will print the setting
                iPrinter.addImage( fmtImage, buffer );
            }

            Bundle fmtAddTextInLine = new Bundle();
            //
            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_FORTE );
            iPrinter.addTextInLine(fmtAddTextInLine, "Verifone X9-Series", "", "", 0);
            //
            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.NORMAL_24_24 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_segoesc );
            iPrinter.addTextInLine(fmtAddTextInLine, "", "", "This is the Print Demo", 0);


            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_24_24);
            iPrinter.addText(format, "Hello Verifone in font NORMAL_24_24!");
            // left
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
            iPrinter.addText(format, "Left Alignment long string here: PrinterConfig.addText.Alignment.LEFT ");

            // right
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.RIGHT );
            iPrinter.addText(format, "Right Alignment  long  string with wrapper here");

            iPrinter.addText(format, "--------------------------------");
            Bundle fmtAddBarCode = new Bundle();
            fmtAddBarCode.putInt( PrinterConfig.addBarCode.Alignment.BundleName, PrinterConfig.addBarCode.Alignment.RIGHT );
            fmtAddBarCode.putInt( PrinterConfig.addBarCode.Height.BundleName, 64 );
            iPrinter.addBarCode( fmtAddBarCode, "123456 Verifone" );

            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.FONT_AGENCYB);
            iPrinter.addTextInLine(fmtAddTextInLine, "", "123456 Verifone", "", 0);
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English );    // set to the default

            iPrinter.addText(format, "--------------------------------");


            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_ALGER );
            iPrinter.addTextInLine( fmtAddTextInLine, "Left", "Center", "right", 0);
            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_BROADW );
            iPrinter.addTextInLine( fmtAddTextInLine, "L & R", "", "Divide Equally", 0);
            iPrinter.addTextInLine( fmtAddTextInLine, "L & R", "", "Divide flexible", PrinterConfig.addTextInLine.mode.Devide_flexible);
            // left
            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
            iPrinter.addText(format, "--------------------------------");

            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.LARGE_32_32 );
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English);
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.path + PrinterFonts.FONT_segoesc );
            iPrinter.addTextInLine( fmtAddTextInLine,
                    "", "",
                    "Right long string here call addTextInLine ONLY give the right string",
                    0);

            format.putInt(PrinterConfig.addText.Alignment.BundleName, PrinterConfig.addText.Alignment.LEFT );
            format.putInt(PrinterConfig.addText.FontSize.BundleName, PrinterConfig.addText.FontSize.NORMAL_24_24 );
            iPrinter.addText(format, "--------------------------------");

            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterConfig.addTextInLine.GlobalFont.English);  // this the default
            iPrinter.addTextInLine( fmtAddTextInLine, "", "#",
                    "Right long string with the center string",
                    0);
            iPrinter.addText(format, "--------------------------------");
            fmtAddTextInLine.putInt(PrinterConfig.addTextInLine.FontSize.BundleName, PrinterConfig.addTextInLine.FontSize.SMALL_16_16);
            fmtAddTextInLine.putString(PrinterConfig.addTextInLine.GlobalFont.BundleName, PrinterFonts.FONT_AGENCYB);
            iPrinter.addTextInLine( fmtAddTextInLine, "Print the QR code far from the barcode to avoid scanner found both of them", "",
                    "",
                    PrinterConfig.addTextInLine.mode.Devide_flexible);

            Bundle fmtAddQRCode = new Bundle();
            fmtAddQRCode.putInt( PrinterConfig.addQrCode.Offset.BundleName, 128);
            fmtAddQRCode.putInt( PrinterConfig.addQrCode.Height.BundleName, 128);
            iPrinter.addQrCode( fmtAddQRCode, "www.seegypt.com");

            iPrinter.addTextInLine( fmtAddTextInLine, "", "try to scan it",
                    "",
                    0);


            iPrinter.addText(format, "---------X-----------X----------");
            iPrinter.feedLine(5);
            // start print here
            Log.d(TAG, "end printer");
            iPrinter.startPrint(new MyListener());
        } catch (RemoteException e) {
            Log.d(TAG, "testPrinter fail");
            e.printStackTrace();
        }


    }


    private boolean testDevicePrinter() {
        boolean testedPrinter = false;

        try {
            testPrinterEdit();
            testedPrinter = true;
        }
        catch (Exception e) {
            testedPrinter = false;
        }


        return testedPrinter;
    }

    private int getBatteryLevel() {
        // -1 invalid battery level as default
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }

    private class MyListener extends PrinterListener.Stub {
        @Override
        public void onFinish() throws RemoteException {
            Message msg = new Message();
            msg.getData().putString("msg", "print finished");
            handler.sendMessage(msg);
            Log.d(TAG, "onFinish");
        }

        @Override
        public void onError(int error) throws RemoteException {
            Log.d(TAG, "onError");
            Message msg = new Message();
            msg.getData().putString("msg", "print error,errno:" + error);
            handler.sendMessage(msg);
        }
    }

    Handler handler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            String string = msg.getData().getString("string");

            super.handleMessage(msg);
            Log.d(TAG, msg.getData().getString("msg"));
            Toast.makeText(MainActivity.this, msg.getData().getString("msg"), Toast.LENGTH_SHORT).show();

        }
    };
}