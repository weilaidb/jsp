<%@ tag pageEncoding="utf-8" %>
<%@ attribute name="color" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="sex" required="true" %>
<tr bgcolor="<%=color%>">
    <td width="60"><%=name%></td>
    <td width="60"><%=sex%></td>
</tr>
<jsp:doBody/>