<%@ page import="weilaidb.sql.JspAdapter" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2020/6/15
  Time: 6:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>form表单重置</title>
    <script src="<%=JspAdapter.getBasePath(application, request)%>/javascript/jquery/jquery-3.5.1.min.js"></script>
</head>

<body>
<form action="" method="post" id="myform">
    <label for="name">姓名：</label>
    <input type="text" name="name" id="name" value="" placeholder="请输入名字" />
    <label>性别：</label>
    <input type="radio" name="sex" checked value="" />男
    <input type="radio" name="sex" value="" />女
</form>
<input type="button" name="" value="重置" onclick="formReset()" />
<script type="text/javascript">
    function formReset() {
        $(':input', '#myform')
            .not(':button, :submit, :reset, :hidden,:radio') // 去除不需要重置的input类型
            .val('')
            .removeAttr('checked')
            .removeAttr('selected');
    }
</script>
</body>

</html>
