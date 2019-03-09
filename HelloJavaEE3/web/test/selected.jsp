<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改用户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="<%=request.getContextPath() %>/resources/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>

<form id="userForm" name="userForm"
      action="${pageContext.request.contextPath }/user/editUserSubmit.action"
      method="post">
    <input type="hidden" name="id" value="${userEx.id }"/> 修改用户信息：
    <table width="100%" border=1>
        <tr>
            <td>用户姓名</td>
            <td><input type="text" name="username"
                       value="${userEx.username }"/></td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input type="text" name="birthday"
                       value="${userEx.birthday }"
                       onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <select name="sex">
                    <option value=""></option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>家庭住址</td>
            <td><input type="text" name="address"
                       value="${userEx.address }"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交"/>
            </td>
        </tr>
    </table>

</form>
<script type="text/javascript">
    function jsSelectItemByValue(objSelect, objItemText) {
        for (var i = 0; i < objSelect.options.length; i++) {
            if (objSelect.options[i].value == objItemText) {
                objSelect.options[i].selected = true;
                break;
            }
        }
    };
    jsSelectItemByValue(document.forms['userForm'].sex, ${userEx.sex });
</script>
</body>

</html>