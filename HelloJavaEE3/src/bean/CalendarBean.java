package bean;

import java.util.Calendar;

public class CalendarBean {
    String caldendar = null;

    public String getCaldendar() {
        StringBuffer buffer = new StringBuffer();
        Calendar ���� = Calendar.getInstance();
        ����.set(year,month - 1, 1);
        int ���ڼ� = ����.get((Calendar.DAY_OF_WEEK)) - 1;
        int day = 0;
        if (month == 1 || month == 3 || month == 5 || month == 7 | month == 8 || month == 10 || month == 12) {
            day = 31;
        } else {
            day = 30;
        }

        if (month == 2) {
            if(((year%4 == 0 ) && (year% 100 != 0)||(year % 400 == 0))){
            day = 29;
            }
            else {
                day = 28;
            }
        }

        String a[] = new String[42];
        for (int i = 0; i < 42; i++) {
            a[i] = "";
        }
        for (int i = ���ڼ�,n=1; i < ���ڼ�+day; i++) {
            if (n <= 9) {
                a[i] = String.valueOf(n) + " ";
            } else {
                a[i] = String.valueOf(n);
            }
            n++;
        }
        //�ñ����ʾ����
        buffer.append("<table border =3>");
        buffer.append("<tr>");
        String xingqi[] = {"������", "����һ", "���ڶ�", "������", "������", "������", "������", };
        for (int i = 0; i < 7; i++) {
            buffer.append("<td>" + xingqi[i] + "</td>");
        }
        buffer.append("</tr>");
        for (int i = 0; i < 42; i = i + 7) {
            buffer.append("<tr>");
            for (int j = i; j < 7 + i; j++) {
                buffer.append("<td>" + a[j] + "</td>");
            }
            buffer.append("</tr>");
        }
        buffer.append("</table>");
        caldendar = new String(buffer);
        return caldendar;
    }

    public void setCaldendar(String caldendar) {
        this.caldendar = caldendar;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    int year = 2005,month = 0;

}
