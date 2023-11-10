//package com.seegypt.www.printer;
package com.electronss.pos_device_integration;

import android.content.res.AssetManager;
import android.os.Environment;

/**
 * Created by Simon on 2018/6/1.
 */

public class PrinterFonts {
    public static final String FONT_AGENCYB = "AGENCYB.TTF";
    public static final String FONT_ALGER = "ALGER.TTF";
    public static final String FONT_BROADW = "BROADW.TTF";
    public static final String FONT_CURLZ___ = "CURLZ___.TTF";
    public static final String FONT_FORTE = "FORTE.TTF";
    public static final String FONT_KUNSTLER = "KUNSTLER.TTF";
    public static final String FONT_segoesc = "segoescb.ttf";
    public static final String FONT_SHOWG = "SHOWG.TTF";
    public static final String FONT_WINGDNG2 = "WINGDNG2.TTF";
    public static final String FONT_HuaWenLiShu = "STLITI.TTF";
    public static final String FONT_HuaWenZhongSong = "STZHONGS.TTF";

    public static String path = "";

    public static void initialize( AssetManager assets ) {
        String fileName = PrinterFonts.FONT_AGENCYB;
        path = Environment.getExternalStorageDirectory().getPath().concat("/fonts/");
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_ALGER;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_BROADW;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_CURLZ___;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_FORTE;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_KUNSTLER;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_segoesc;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_SHOWG;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_WINGDNG2;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_HuaWenLiShu;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

        fileName = PrinterFonts.FONT_HuaWenZhongSong;
        ExtraFiles.copy("fonts/" + fileName, path , fileName, assets, false );

    }

}
