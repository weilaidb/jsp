package com.clipboard;

import com.objectproc.ProcObjectAndByte;

import java.awt.*;
import java.awt.datatransfer.*;
import java.io.*;

public class ProcClipboard {


    public void setIntoClipboard(String data) throws UnsupportedFlavorException, IOException {
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(new StringSelection(data), null);
    }

    public static String get4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.stringFlavor)) {
            try {
                return (String) transferable.getTransferData(DataFlavor.stringFlavor);
            } catch (Exception e) {
                return "";
            }
        }
        return "";
    }

    public static Object getImageAndText4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null) {
            try {
                System.out.println("got ImageAndText");
                DataFlavor[] dataList = transferable.getTransferDataFlavors();
                int wholeLength = 0;
                Object obj = null;
                byte[] bytesA = null;
                byte[] bytesSum = null;
                int firstflag = 0;

                for (int i = 0; i < dataList.length; i++) {
                    DataFlavor data = dataList[i];
                    System.out.println("data getsubtype :" + data.getSubType());
                    System.out.println("data getMimeType:" + data.getMimeType());
//                    try {
                        obj = transferable.getTransferData(data);
////                    obj转换成byte[]
                        if(1 == 1) {
                            bytesA = ProcObjectAndByte.toByteArray(obj);
                            if(bytesA != null) {
                                System.out.println("bytes length:" + bytesA.length);
                            }
                        }
//////                    bytes = ProcObjectAndByte.byteMerger(bytes,bytesnull);
////                        System.out.println("bytes length:" + bytes.length);
//                    } catch (Exception e) {
//                        System.out.println("e:" + e.getCause());
//                    }


                    if (0 == firstflag) {
                        if (bytesA != null) {
                            bytesSum = bytesA;
                            firstflag = 1;
                        }
                    } else {
                        if(bytesA !=null && bytesSum != null) {
                            bytesSum = ProcObjectAndByte.byteMerger(bytesSum, bytesA);
                        }
                    }
                    System.out.println("bytesone length:" + bytesSum.length);

                }
//                return ProcObjectAndByte.toObject(bytes);
                return "this is good!!";
            } catch (Exception e) {
                System.out.println("error:" + e.getMessage());
                return "no got data in clipboard!!";
            }
        }
        System.out.println("none,, in clipboard!!");
        return "none";
    }

    public static Object getAll4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.allHtmlFlavor)) {
            try {
                System.out.println("got allHtmlFlavor");
                return transferable.getTransferData(DataFlavor.allHtmlFlavor);
            } catch (Exception e) {
                System.out.println("no data in clipboard!!");
                return "no data in clipboard!!";
            }
        }
        System.out.println("none,, in clipboard!!");
        return "none";
    }

    public static Object getfragmentHtmlFlavor4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.fragmentHtmlFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.fragmentHtmlFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

    public static Object getimageFlavor4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.imageFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.imageFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

    public static Object getjavaFileListFlavor4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.javaFileListFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

    public static Object getselectionHtmlFlavor4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.selectionHtmlFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.selectionHtmlFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

    public static Object getstringFlavor4Clipboard() throws UnsupportedFlavorException, IOException {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.stringFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.stringFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

//    public static String getplainTextFlavor4Clipboard() {
//        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
//        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.plainTextFlavor)) {
//            try {
//                return (String) transferable.getTransferData(DataFlavor.plainTextFlavor);
//            } catch (Exception e) {
//                return "no date in clipboard!!";
//            }
//        }
//        return "";
//    }


}
