package com.java.test;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
/*
 * 五子棋的界面类，该类继承JFrame,然后实现WZQConfig接口
 */
import javax.swing.JPanel;

public class WZQFrame extends JPanel implements WZQConfig {
    public void WZQFrame() {
        // WZQFrame ui = new WZQFrame();
        JFrame jf = new javax.swing.JFrame();
        jf.setTitle("xxxxx五子棋xxxxxxx");
        jf.setDefaultCloseOperation(3);
        jf.setSize(1246, 1080);
        jf.setLocationRelativeTo(null);
        jf.setResizable(false);

        jf.setLayout(new FlowLayout());
        this.setLayout(new FlowLayout());

        this.setPreferredSize(new Dimension(1030, 1080));

        // this.setBackground(Color.CYAN);
        // 把面板对象添加到窗体上
        jf.add(this);
        JPanel jp1 = new JPanel();
        jp1.setPreferredSize(new Dimension(200, 1080));
        jp1.setLayout(new FlowLayout());
        jf.add(jp1);
        LoginListener ll = new LoginListener();
        String[] str = { "悔棋", "重新开始" };
        for (int i = 0; i < str.length; i++) {
            JButton jbu1 = new JButton(str[i]);
            jbu1.setPreferredSize(new Dimension(150, 80));
            jbu1.setFont(new Font("楷体", Font.BOLD,20));//设置字体
            jp1.add(jbu1);
            jbu1.addActionListener(ll);
        }

        jf.setVisible(true);

        Graphics g = this.getGraphics();

        this.addMouseListener(ll);

        ll.setG(g);
        ll.setU(this);
    }

    /*
     * 重写窗体绘制容器的方法
     */
    public void paint(Graphics g) {
        super.paint(g);

        ImageIcon im2 = new ImageIcon(this.getClass().getResource("2.jpg"));

        g.drawImage(im2.getImage(), 0, 0, 1030, 1080, null);

        for (int i = 1; i < 17; i++) {
            Graphics2D g2 = (Graphics2D) g;
            g2.setStroke(new BasicStroke(4));
            g2.drawLine(START_X, START_Y * i, START_X + SIZE * V_LINE, START_Y
                    * i);// 横线
            g2.drawLine(START_X * i, START_Y, START_X * i, START_Y + SIZE
                    * V_LINE);// 竖线

            g2.setStroke(new BasicStroke(8));
            // 画边框
            g2.drawLine(35, 35, 990, 35);
            g2.drawLine(35, 990, 990, 990);
            g2.drawLine(35, 35, 35, 990);
            g2.drawLine(990, 35, 990, 990);
        }
        for (int k = 0; k < 17; k++) {
            for (int k1 = 0; k1 < 17; k1++) {
                if (bx[k][k1] == 1) {
                    g.setColor(Color.BLACK);
                    g.fillOval(Math.abs(k * SIZE - 25),
                            Math.abs(k1 * SIZE - 25), 50, 50);

                } else if (bx[k][k1] == 2) {
                    g.setColor(Color.WHITE);
                    g.fillOval(Math.abs(k * SIZE - 25),
                            Math.abs(k1 * SIZE - 25), 50, 50);
                }

            }

        }

    }

    public static void main(String[] args) {
        WZQFrame l = new WZQFrame();
        l.WZQFrame();
    }

}