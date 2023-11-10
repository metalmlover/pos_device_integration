//package com.seegypt.www.printer;
package com.electronss.pos_device_integration;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

/**
 * Created by Simon on 2018/5/9.
 */

public class ExtraFiles {

    private static final String TAG = "VFI.ExtraFiles";


    /**
     * copy file in assets to system (sdcard)
     * @param sourceAssetFileName the source file in assets
     * @param targetPath the target path
     * @param targetFileName the target fileName
     * @param assets the AssetManager from getAssets
     * @return true for success, false for failure
     */
    public static boolean copy(String sourceAssetFileName,
                               String targetPath, String targetFileName, AssetManager assets, boolean overWriteIfExists) {
        String fullFileName = targetPath + targetFileName;

        File file = new File(fullFileName);
        if( file.exists() && (false == overWriteIfExists) ){
            Log.i( TAG, "return while file [" + fullFileName + "] exists");
            return true;
        }
        File dir = new File(targetPath);
        // try create the fold if not exists
        if (!dir.exists())
            dir.mkdirs();
        try {
            if (!(new File(fullFileName)).exists()) {
                InputStream is = assets.open(sourceAssetFileName);
                FileOutputStream fos = new FileOutputStream(fullFileName);
                byte[] buffer = new byte[4096];
                int count = 0;
                while ((count = is.read(buffer)) > 0) {
                    fos.write(buffer, 0, count);
                }
                fos.close();
                is.close();

                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    Bitmap loadImage (AssetManager assets) {
//        ImageView imageView = (ImageView) findViewById(R.id.image);

        /**
         * 使用assets下的图片
         * http://www.2cto.com/kf/201408/322920.html
         */
        Bitmap bmp = null;
        InputStream is;
        try {
            is = assets.open("applist/applogo.png");
            bmp = BitmapFactory.decodeStream(is);
//            imageView.setImageBitmap(bmp);
        } catch (IOException e2) {
            // TODO Auto-generated catch block
            e2.printStackTrace();
        }

        return bmp;
    }

}
