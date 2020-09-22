<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%--<%@page import="com.wdq.Utils.ConnectionMySql"%>--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%--<%@page import="com.wdq.Users.*"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/form_style.css" rel='stylesheet' type='text/css' />
</head>
<body>
<%
    List<Students> studentList = new ArrayList<>();//创建List集合接收数据库数据
    Connection con = new com.wdq.Utils.ConnectionMySql().getCon(); //获取数据库连接返回的Connection对象
    ResultSet rs = null;//存放的结果集
    Statement pstmt  = null;
    pstmt = con.createStatement();
    String sql = "select * from student";//执行查询的Sql语句
    try{
        rs = pstmt.executeQuery(sql);
        while(rs.next()){
            Students student = new Students();
            student.setId(rs.getInt(1));
            student.setStuId(rs.getString(2));
            student.setStuName(rs.getString(3));
            student.setGender(rs.getString(4));
            student.setBalance(rs.getFloat(5));
            student.setTel(rs.getString(6));
            student.setMajor(rs.getString(7));
            studentList.add(student);
        }
    }catch(Exception e){
        System.err.print("查询失败!\n");
    }

%>
<li>
    <label>请选择学生</label>
    <select name="studentId">
        <%
            int len = studentList.size();
            for(int i=0;i<len;i++){ %>
        <option><%=studentList.get(i).getStuName() %></option>
        <% }%>
    </select>
</li>
</body>