package com.runcmd;

import java.io.EOFException;
import java.io.IOException;


public class RunCmd {
    private String m_openpath;

    RunCmd(String openpath) {
        m_openpath = openpath;
        try {
            Runtime.getRuntime().exec(
                    new String[]{"C:\\Windows\\explorer.exe",
                            m_openpath});
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }

    RunCmd(String openpath, int flag) {
        m_openpath = openpath;
        if (flag != 0) {
            try {
                Runtime.getRuntime().exec(
                        new String[]{"C:\\Windows\\explorer.exe",
                                m_openpath});
            } catch (IOException ioe) {
                System.out.println(ioe.getMessage());
            }
        }
    }

    void openPath() {
        try {
            Runtime.getRuntime().exec(
                    new String[]{"C:\\Windows\\explorer.exe",
                            m_openpath});
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }

    void openPath(String openpath) {
        try {
            Runtime.getRuntime().exec(
                    new String[]{"C:\\Windows\\explorer.exe",
                            openpath});
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }

    void openCmd() {
        try {
            Runtime.getRuntime().exec(
                    new String[]{"C:\\Windows\\System32\\cmd.exe"});
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        }
    }


}
