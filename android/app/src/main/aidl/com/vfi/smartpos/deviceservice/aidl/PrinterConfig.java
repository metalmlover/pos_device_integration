package com.vfi.smartpos.deviceservice.aidl;

public class PrinterConfig {
    public static final String BUNDLE_PRINT_FONT = "font";
    public static final String BUNDLE_PRINT_ALIGN = "align";

    public PrinterConfig() {
    }

    public class addQrCode {
        public addQrCode() {
        }

        public class Height {
            public static final String BundleName = "expectedHeight";

            public Height() {
            }
        }

        public class Offset {
            public static final String BundleName = "offset";

            public Offset() {
            }
        }
    }

    public class addBarCode {
        public addBarCode() {
        }

        public class Height {
            public static final String BundleName = "height";

            public Height() {
            }
        }

        public class Alignment {
            public static final String BundleName = "align";
            public static final int LEFT = 0;
            public static final int CENTER = 1;
            public static final int RIGHT = 2;

            public Alignment() {
            }
        }
    }

    public class addTextInLine {
        public addTextInLine() {
        }

        public class mode {
            public static final int Devide_Equally = 0;
            public static final int Devide_flexible = 1;

            public mode() {
            }
        }

        public class GlobalFont {
            public static final String BundleName = "fontStyle";
            public static final String CHINESE = "Chinese";
            public static final String English = "English";
            public static final String Arabic = "Arabic";

            public GlobalFont() {
            }
        }

        public class StyleBold {
            public static final String BundleName = "bold";
            public static final boolean BOLD = true;
            public static final boolean NotBOLD = false;

            public StyleBold() {
            }
        }

        public class FontSize {
            public static final String BundleName = "fontSize";
            public static final int SMALL_16_16 = 0;
            public static final int NORMAL_24_24 = 1;
            public static final int NORMAL_DH_24_48_IN_BOLD = 2;
            public static final int LARGE_32_32 = 3;
            public FontSize() {
            }
        }
    }

    public class addText {
        public addText() {
        }

        public class newline {
            public static final String BundleName = "newline";
            public static final boolean AppendCRLF = true;
            public static final boolean NoCRLF = false;

            public newline() {
            }
        }

        public class StyleBold {
            public static final String BundleName = "bold";
            public static final boolean BOLD = true;
            public static final boolean NotBOLD = false;

            public StyleBold() {
            }
        }

        public class Alignment {
            public static final String BundleName = "align";
            public static final int LEFT = 0;
            public static final int CENTER = 1;
            public static final int RIGHT = 2;

            public Alignment() {
            }
        }

        public class FontSize {
            public static final String BundleName = "font";
            public static final int SMALL_16_16 = 0;
            public static final int NORMAL_24_24 = 1;
            public static final int NORMAL_DH_24_48_IN_BOLD = 2;
            public static final int LARGE_32_32 = 3;
            public static final int LARGE_DH_32_64_IN_BOLD = 4;
            public static final int HUGE_48 = 5;

            public FontSize() {
            }
        }
    }
}