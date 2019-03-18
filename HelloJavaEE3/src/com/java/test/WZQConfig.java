package com.java.test;

public interface WZQConfig {
    /*
     * 起始位置X
     */
    public static final int START_X = 60;
    /*
     * 起始位置Y
     */
    public static final int START_Y = 60;
    /*
     * 五子棋盘线条数
     */
    public static final int H_LINE = 15;
    /*
     * 五子棋盘竖线条数
     */
    public static final int V_LINE = 15;
    /*
     * 五子棋盘格子大小
     */
    public static final int SIZE = 60;
    /*
     * 储存棋子的x位置信息
     */
    public static final int[][] bx = new int[17][17];
}
