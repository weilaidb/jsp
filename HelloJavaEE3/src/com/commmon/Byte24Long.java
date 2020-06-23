package com.commmon;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.*;

public class Byte24Long {
    public static byte[] LongToBytes(long values) {
        byte[] buffer = new byte[8];
        for (int i = 0; i < 8; i++) {
            int offset = 64 - (i + 1) * 8;
            buffer[i] = (byte) ((values >> offset) & 0xff);
        }
        return buffer;
    }

    public static void printBytes(String tips, byte[] buffer)
    {
        System.out.println("----->[" + tips + "]");
        for (int i = 0; i < buffer.length; i++) {
            System.out.println( i + ":"  + Integer.toHexString(buffer[i] & 0xFF));
        }
    }

    public static long BytesToLong(byte[] buffer) {
        long values = 0;
        for (int i = 0; i < 8; i++) {
            values <<= 8;
            values |= (buffer[i] & 0xff);
        }
        return values;
    }

    public static byte[] getBytes(char[] chars) {
        Charset cs = Charset.forName("UTF-8");
        CharBuffer cb = CharBuffer.allocate(chars.length);
        cb.put(chars);
        cb.flip();
        ByteBuffer bb = cs.encode(cb);
        return bb.array();
    }

    public static char[] getChars(byte[] bytes) {
        Charset cs = Charset.forName("UTF-8");
        ByteBuffer bb = ByteBuffer.allocate(bytes.length);
        bb.put(bytes);
        bb.flip();
        CharBuffer cb = cs.decode(bb);
        return cb.array();
    }

    public static byte[] charToByte(char c) {
        byte[] b = new byte[2];
        b[0] = (byte) ((c & 0xFF00) >> 8);
        b[1] = (byte) (c & 0xFF);
        return b;
    }

    public static char byteToChar(byte[] b) {
        char c = (char) (((b[0] & 0xFF) << 8) | (b[1] & 0xFF));
        return c;
    }
}
