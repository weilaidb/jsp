<%@ tag pageEncoding="utf-8" %>
<body bgcolor="yellow">
<p>
    <%
        int size = 1;
        for(int i = 1; i <=30; i++)
        {
            size = size + 1;

        }
    %>
    <font size="<%=size%>">
        <jsp:doBody/>
    </font>
</p>
</body>