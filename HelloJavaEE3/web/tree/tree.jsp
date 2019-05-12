
<%@ page language="java" import="java.util.*"%>
<%@ page import="tree.*" %>
<html>
  <head>
    
    <title>tree view</title>
<link rel="stylesheet" href = "css/tree.css">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/tree.js"></script>

  </head>
  <body>
 <div id="load" style="display:none"> <img src="images/loading.gif">Loading data..</div>
  <ul class="tree">
<%
   Category topCate = new Category(0);
   TreeviewElement[] top =  topCate.getChildren();
   for(int i= 0;i<top.length;i++)
     out.println(treeviewRender.renderTreeViewAjax(top[i],false));
%>
</ul>
  </body>
</html>
