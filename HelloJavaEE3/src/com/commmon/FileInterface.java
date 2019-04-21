package com.commmon;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class FileInterface {
    public String[] getFileList(String path) {
        String[] fileNames = {""};

//        System.out.println(path);
        File dir = new File(path);
        if (dir.exists()) {
            if (dir.isDirectory()) {
                fileNames = dir.list();
            } else {
                fileNames = dir.getParentFile().list();
            }
        }
//        System.out.println(fileNames.length);
        return fileNames;
    }
//    public void traverseFolder(String path) {
//        int fileNum = 0, folderNum = 0;
//        File file = new File(path);
//        if (file.exists()) {
//            LinkedList<File> list = new LinkedList<File>();
//            File[] files = file.listFiles();
//            for (File file2 : files) {
//                if (file2.isDirectory()) {
////                    System.out.println("文件夹:" + file2.getAbsolutePath());
//                    list.add(file2);
//                    folderNum++;
//                } else {
////                    System.out.println("文件:" + file2.getAbsolutePath());
//                    fileNum++;
//                }
//            }
//            File temp_file;
//            while (!list.isEmpty()) {
//                temp_file = list.removeFirst();
//                files = temp_file.listFiles();
//                for (File file2 : files) {
//                    if (file2.isDirectory()) {
////                        System.out.println("文件夹:" + file2.getAbsolutePath());
//                        list.add(file2);
//                        folderNum++;
//                    } else {
////                        System.out.println("文件:" + file2.getAbsolutePath());
//                        fileNum++;
//                    }
//                }
//            }
//        } else {
//            System.out.println("文件不存在!");
//        }
//        System.out.println("文件夹共有:" + folderNum + ",文件共有:" + fileNum);
//
//    }

    public List<String> getAllFileList(String path) {
        List<String> fileNames = new ArrayList<String>();
        int fileNum = 0, folderNum = 0;
        File file = new File(path);
        if (file.exists()) {
            LinkedList<File> list = new LinkedList<File>();
            File[] files = file.listFiles();
            for (File file2 : files) {
                if (file2.isDirectory()) {
                    list.add(file2);
                    fileNames.add(file2.toString());
                    folderNum++;
                } else {
                    fileNames.add(file2.toString());
                    fileNum++;
                }
            }
            File temp_file;
            while (!list.isEmpty()) {
                temp_file = list.removeFirst();
                files = temp_file.listFiles();
                for (File file2 : files) {
                    if (file2.isDirectory()) {
                        list.add(file2);
                        fileNames.add(file2.toString());
                        folderNum++;
                    } else {
                        fileNames.add(file2.toString());
                        fileNum++;
                    }
                }
            }
        } else {
//            System.out.println("文件不存在!");
        }
        System.out.println("文件夹共有:" + folderNum + ",文件共有:" + fileNum);

        return fileNames;
    }

}
