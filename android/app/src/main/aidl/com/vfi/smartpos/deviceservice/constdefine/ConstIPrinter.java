package com.vfi.smartpos.deviceservice.constdefine;

public class ConstIPrinter {

    /**字体，默认小字体**/
    public static final String BUNDLE_PRINT_FONT = "font";

    /**对齐方式，默认左对齐**/
    public static final String BUNDLE_PRINT_ALIGN = "align";

    public class addText {
        public class format {

            public static final String KEY_FontSize_int ="font";
            public static final int VALUE_FontSize_SMALL_16_16 = 0;
            public static final int VALUE_FontSize_NORMAL_24_24 = 1;
            public static final int VALUE_FontSize_NORMAL_DH_24_48_IN_BOLD = 2;
            public static final int VALUE_FontSize_LARGE_32_32 = 3;
            public static final int VALUE_FontSize_LARGE_DH_32_64_IN_BOLD = 4;
            public static final int VALUE_FontSize_HUGE_48 = 5;

            public static final String KEY_Alignment_int ="align";
            public static final int VALUE_Alignment_LEFT = 0;
            public static final int VALUE_Alignment_CENTER = 1;
            public static final int VALUE_Alignment_RIGHT = 2;



            public static final String KEY_StyleBold_boolean ="bold";
            public static final boolean VALUE_StyleBold_YES = true;
            public static final boolean VALUE_StyleBold_NO = false;

            public static final String KEY_newline_boolean="newline";
            public static final boolean VALUE_newline_AppendCRLF = true;
            public static final boolean VALUE_newline_NoCRLF = false;
        }
    }

    public class addTextInLine {
        public class format {
            public static final String KEY_FontSize_int = "fontSize";
            public static final int VALUE_FontSize_SMALL_16_16 = 0;
            public static final int VALUE_FontSize_NORMAL_24_24 = 1;
            public static final int VALUE_FontSize_NORMAL_DH_24_48_IN_BOLD = 2;
            public static final int VALUE_FontSize_LARGE_32_32 = 3;


            public static final String KEY_StyleBold_boolean = "bold";
            public static final boolean VALUE_StyleBold_YES = true;
            public static final boolean VALUE_StyleBold_NO = false;


            public static final String KEY_GlobalFont_String = "fontStyle";
            public static final String VALUE_GlobalFont_CHINESE = "Chinese";
            public static final String VALUE_GlobalFont_English = "English";
            public static final String VALUE_GlobalFont_Arabic = "Arabic";

        }
        public class mode {
            public static final int Devide_Equally = 0;
            public static final int Devide_flexible = 1;
        }

    }

    public class addBarCode{
        public class format {
            public static final String KEY_Alignment_int ="align";
            public static final int VALUE_Alignment_LEFT = 0;
            public static final int VALUE_Alignment_CENTER = 1;
            public static final int VALUE_Alignment_RIGHT = 2;


            public static final String KEY_PixelWidthMode_int ="pixelPoint";
            public static final int VALUE_PixelWidthMode_AUTO = 1;

            public static final String KEY_Height_int ="height";
        }
    }

    public class addQrCode{
        public class format {
            public static final String KEY_Offset_int ="offset";
            public static final String KEY_Height_String ="expectedHeight";
        }
    }
}
