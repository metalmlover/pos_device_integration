package com.vfi.smartpos.deviceservice.aidl;

import android.os.Parcel;
import android.os.Parcelable;

//also commented 238
//import com.vfi.smartpos.deviceservice.QrCodeContent;
import com.vfi.smartpos.deviceservice.aidl.PrinterListener;



/**
 * \cn_
 * 打印机对象<br/>
 * 实现对文本、条形码、二维码和图片的打印功能。
 * \_en_
 * The printer object to print strings, barcode, QR code, image
 * \en_e
 * @author Kai.L@verifone.cn, Chao.L@verifone.cn
 */
interface IPrinter {    
    /**
	 * \cn_
	 * 获取打印机状态 | get printer status
	 * @return 打印机状态
	 * <ul>
	 * <li>ERROR_NONE(0x00) - 状态正常</li>
	 * <li>ERROR_PAPERENDED(0xF0) - 缺纸，不能打印</li>
	 * <li>ERROR_NOCONTENT(0xF1) - 打印内存无内容</li>     * <li>ERROR_HARDERR(0xF2) - 硬件错误</li>
     * <li>ERROR_OVERHEAT(0xF3) - 打印头过热</li>
     * <li>ERROR_BUFOVERFLOW(0xF5) - 缓冲模式下所操作的位置超出范围 </li>
     * <li>ERROR_LOWVOL(0xE1) - 低压保护 </li>
     * <li>ERROR_PAPERENDING(0xF4) - 纸张将要用尽，还允许打印(单步进针打特有返回值)</li>    
     * <li>ERROR_MOTORERR(0xFB) - 打印机芯故障(过快或者过慢)</li>  
     * <li>ERROR_PENOFOUND(0xFC) - 自动定位没有找到对齐位置,纸张回到原来位置   </li>
     * <li>ERROR_PAPERJAM(0xEE) - 卡纸</li>
     * <li>ERROR_NOBM(0xF6) - 没有找到黑标</li>
     * <li>ERROR_BUSY(0xF7) - 打印机处于忙状态</li>
     * <li>ERROR_BMBLACK(0xF8) - 黑标探测器检测到黑色信号</li>
     * <li>ERROR_WORKON(0xE6) - 打印机电源处于打开状态</li>
     * <li>ERROR_LIFTHEAD(0xE0) - 打印头抬起(自助热敏打印机特有返回值)</li>
     * <li>ERROR_CUTPOSITIONERR(0xE2) - 切纸刀不在原位(自助热敏打印机特有返回值)</li>
     * <li>ERROR_LOWTEMP(0xE3) - 低温保护或AD出错(自助热敏打印机特有返回值)</li>
     * </ul>
     * \_en_
     * @brief get printer status
     *
	 * @return the status:
	 * <ul>
	 * <li>ERROR_NONE(0x00) - normal</li>
	 * <li>ERROR_PAPERENDED(0xF0) - Paper out</li>
	 * <li>ERROR_NOCONTENT(0xF1) - no content</li>     * <li>ERROR_HARDERR(0xF2) - printer error</li>
     * <li>ERROR_OVERHEAT(0xF3) - over heat</li>
     * <li>ERROR_BUFOVERFLOW(0xF5) - buffer overflow</li>
     * <li>ERROR_LOWVOL(0xE1) - battery low</li>
     * <li>ERROR_PAPERENDING(0xF4) - Paper low for sprocket printer</li>
     * <li>ERROR_MOTORERR(0xFB) - moto error</li>
     * <li>ERROR_PAPERJAM(0xEE) - paper jam</li>
     * <li>ERROR_BUSY(0xF7) - printer is busy</li>
     * <li>ERROR_WORKON(0xE6) - printer is awake</li>
     * </ul>
     * \en_e
	 */
	int getStatus();
	
    /**
	 * \cn_
	 * 设置打印灰度
	 * \_en_
	 * @brief Set the gray level of printing
	 *
	 * \en_e
	 * \cn_s
	 * @param gray - 打印灰度0~7
	  * \_en_
	 * @param gray from 0 to 7
	 * \en_e
	 */
	void setGray(int gray);
	
	/**
	 * \cn_
	 * 添加一行打印文本
	 * \_en_
	 * @brief Add text string to print
	 *
	 * \en_e
	 * \cn_
	 * @param format - 打印字体格式
	 * \_en_
	 * @param format - the format setting
	 * \en_e
	 * <ul>
	 * <li>font(int, size of the font)<br>
	 *      |- 0:small(size16)<br>
	 *      |- 1:normal(size24)<br>
	 *      |- 2:normal_bigger(size24 double height & bold)<br>
	 *      |- 3:large(size32)<br>
	 *      |- 4:large_bigger(size32 double height & bold)<br>
	 *      |- 5:huge(size48)
	 * </li>
	 * <li>fontStyle(String)<br>
	 *      |--/xxxx/xx.ttf(absolute path, custom font by user)
	 * </li>
	 * <li>align(int) - 0:left, 1:center, 2:right</li>
	 * \cn_
	 * <li>bold(boolean) - true粗体 - false常规</li>
	 * <li>newline(boolean) - true:换行, false:不换行</li>
	 * \_en_
	 * <li>bold(boolean) - true: bold - false: normal</li>
	 * <li>newline(boolean) - true: new line after print, false: normal </li>
	 * \en_e
	 * </ul>
	 * \cn_
	 * @param text - 打印文本
	 * \_en_
	 * @param text - the text string want to print
	 * \en_e
	 * @see addTextInLine()
	 */
	void addText(in Bundle format, String text);

	/**
	 *\cn_
	 * 添加一行打印文本
	 * @param format - 打印字体格式
	 * \_en_
	 * @brief Add text strings to print
	 *
	 * @param format - the format setting
	 * \en_e
	 * <ul>
	 * <li>fontSize(int)<br>
	 *      |- 0:small(size16),<br>
	 *      |- 1:normal(size24),<br>
	 *      |- 2:normal_bigger(size24 double height & bold)<br>
	 *      |- 3:large(size32) </li>
	 * \cn_
	 * <li>bold(boolean) - true粗体 - false常规</li>
	 * \_en_
	 * <li>bold(boolean) - true: bold - false: normal</li>
	 * \en_e
	 * <li>fontStyle(String)<br>
	 *     |--Chinese(android font)<br>
	 *     |--English(android font)<br>
	 *     |--Arabic(Android font)<br>
	 *     |--/xxxx/xx.ttf(absolute path, custom font by user) </li>
	 * </ul>
	 * @param lString - the left justifying String
	 * @param mString - the middle(center) justifying String
	 * @param rString - the right justifying String
	 * \cn_
	 * @param mode - 0-左中右分栏，左右宽度=(WIDTMAX-mWidth)/2
	 *         1-左右分栏, 左右宽度动态调整
	 * \_en_
	 * @param mode - 0: the left & right justifying divide the width equally<br>
	 *         1: the left & right justifying divide the width flexiable
	 * \en_e
	 * @see addText()
	 */
	void addTextInLine(in Bundle format, String lString, String mString, String rString, int mode);
	
    /**
	 * \cn_
	 * 添加条码打印
	 * @param format - 打印格式，可设置打印的位置、高度
	 * \_en_
	 * @brief Add barcode to print(CodeType Code128)
	 * @param format - the format
	 * \en_e
	 * <ul>
	 * <li>align(int) - 0:left 1:center 2:right<br></li>
	 * <li>height(int) - the height of barcode</li>
	 * <li>barCodeType(int) - barcode type, see BarcodeFormat. Default "BarcodeFormat.CODE_128.ordinal()"</li>
	 * </ul>
	 * \cn_
	 * @param barcode - 条码内容
	 * \_en_
	 * @param barcode - the barcode string
	 * \en_e
	 * \code{.java}
	 *
        public enum BarcodeFormat {
            AZTEC,
            CODABAR,
            CODE_39,
            CODE_93,
            CODE_128,
            DATA_MATRIX,
            EAN_8,
            EAN_13,
            ITF,
            MAXICODE,
            PDF_417,
            QR_CODE,
            RSS_14,
            RSS_EXPANDED,
            UPC_A,
            UPC_E,
            UPC_EAN_EXTENSION;

            private BarcodeFormat() {
            }
        }
     * \endcode
	 */
	void addBarCode(in Bundle format, in String barcode);

    /**
     * \cn_
	 * 添加二维码打印
	 * @param format - 打印格式，可设置打印的位置、期望高度
	 * <ul>
	 * <li>offset(int) - 打印起始位置 </li>
	 * <li>expectedHeight(int) - 期望高度</li>
	 * </ul>
	 * @param qrCode - 二维码内容
	 * \_en_
	 * @brief add a QR code to print
	 * @param format - the format
	 * <ul>
	 * <li>offset(int) - the offset from the left </li>
	 * <li>expectedHeight(int) - the expected height & width of the QR code. The actual size should multiple of the minimun pixel size of QR code</li>
	 * </ul>
	 * @param qrCode - the string of the QR code
	 * \en_e
	 */
	void addQrCode(in Bundle format, String qrCode);

    /**
     * \cn_
	 * 添加多个二维码打印
	 * \_en_
	 * @brief add multi-QR codes to print
	 *
	 * \en_e
	 */
//	void addQrCodesInLine(in List<QrCodeContent> qrCodes);

    /**
	 * \cn_
	 * 添加图片打印
	 * @param format - 打印格式，可设置打印的位置、宽度、高度
	 * <ul>
	 * <li>offset(int) - 打印起始位置</li>
	 * <li>width(int) - 宽度(<=384)</li>
     * <li>height(int) - 高度</li>
     * <li>gray(int) - 灰度（0~255）</li>
     * </ul>
	 * @param imageData - 图片数据
	 * \_en_
	 *  @brief Add an image to print
	 * @param format - the format setting
	 * <ul>
	 * <li>offset(int) - the offset from left</li>
	 * <li>width(int) - the width of the image want to print.(MAX = 384)</li>
     * <li>height(int) - the height want to print</li>
     * <li>gray(int) - set pixcel gray to pint（0~255 default = 128）</li>
     * </ul>
	 * @param imageData - the image buffer
	 * \en_e
	 * <p>
	 * \code{.java}
	      // get image buffer from id
	     private byte[] getBitmapByte(int id) {
	          BitmapFactory.Options bfoOptions = new BitmapFactory.Options();
              bfoOptions.inScaled = false;
              ByteArrayOutputStream out = new ByteArrayOutputStream();
              BitmapFactory.decodeResource(context.getResources(), id, bfoOptions).compress(Bitmap.CompressFormat.JPEG, 100, out);
              try {
                  out.flush();
                  out.close();
              } catch (IOException e) {
                  e.printStackTrace();
              }
              return out.toByteArray();
          }
	 * \endcode
	 * \code{.java}
 // get image buffer from file
 public byte[] image2byte(String path) {
     byte[] data = null;
     FileInputStream input = null;
     try {
         input = new FileInputStream(new File(path));
         ByteArrayOutputStream output = new ByteArrayOutputStream();
         byte[] buf = new byte[1024];
         int numBytesRead = 0;
         while ((numBytesRead = input.read(buf)) != -1) {
             output.write(buf, 0, numBytesRead);
         }
         data = output.toByteArray();
         output.close();
         input.close();
     } catch (FileNotFoundException ex1) {
         ex1.printStackTrace();
     } catch (IOException ex1) {
         ex1.printStackTrace();
     }
     return data;
 }
	 * \endcode
	 */
	void addImage(in Bundle format, in byte[] imageData);
	
    /**
	 * \cn_
	 * 走纸
	 * @param lines - 行数(lines > 1 && lines <= 50)
	 * \_en_
	 * @brief Feed the paper
	 * @param lines - lines should > 1 && lines <= 50<BR>The lines should be the actual lines+1 because the current line need be counted.
	 * \en_e
	 */
	void feedLine(int lines);
	
	/**
	 * \cn_
	 * 启动打印
	 * @param listener - 打印结果监听器
	 * \_en_
	 * @brief Start print
	 * @param listener - the call back listener to tell the print result
	 * \en_e
	 */
	void startPrint(PrinterListener listener);

	/**
	 * \cn_
     * 启动打印（打印不清缓存）
     * @param listener - 打印结果监听器
	 * \_en_
	 * @brief Start print remain the cache
	 * @param listener - the call back listener to tell the print result
	 * \en_e
     */
    void  startSaveCachePrint(PrinterListener listener);

    /**
	 * \cn_
	 * 设置行间距
	 * @param space - 行间距0~50
	 * \_en_
	 * @brief Set the line space
	 *
	 * \en_e
	 * @param space - the lines of space : 0~50
	 */
    void setLineSpace(int space);

	/**
	 * \cn_
	 * EMV流程中添加打印
	 * @param listener - 打印结果监听器
	 * \_en_
	 * @brief add some print in emv progress, <b>not end of emv process</b>
	 * @param listener - the call back listener to tell the print result
	 * \en_e
	 */
	void startPrintInEmv(PrinterListener listener);
}
