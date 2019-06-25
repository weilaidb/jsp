package com.clipboard;

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Transferable;

public class ProcClipboard {


    public void setIntoClipboard(String data) {
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(new StringSelection(data), null);
    }

    public static String get4Clipboard() {
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

    public static Object getAll4Clipboard() {
        Transferable transferable = Toolkit.getDefaultToolkit().getSystemClipboard().getContents(null);
        if (transferable != null && transferable.isDataFlavorSupported(DataFlavor.allHtmlFlavor)) {
            try {
                return transferable.getTransferData(DataFlavor.allHtmlFlavor);
            } catch (Exception e) {
                return "no date in clipboard!!";
            }
        }
        return "";
    }

    public static Object getfragmentHtmlFlavor4Clipboard() {
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

    public static Object getimageFlavor4Clipboard() {
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

    public static Object getjavaFileListFlavor4Clipboard() {
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

    public static Object getselectionHtmlFlavor4Clipboard() {
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

    public static Object getstringFlavor4Clipboard() {
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
