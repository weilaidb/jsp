<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/3/21
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>$INDEX$</title>
</head>
<body>

<%
    String basePath = application.getContextPath();
    String baseRealPath = application.getRealPath("/");
%>

<h2><a href="jsp/ajax/ajax_receive_content.html">jps demo ajax receive</a></h2>
<h2><a href="jsp/jstl/if_demo.jsp">jps demo jstl if</a></h2>
<h2><a href="jsp/jstl/catch.jsp">jps demo jstl catch</a></h2>
<h2><a href="jsp/jstl/remove.jsp">jps demo jstl out remove</a></h2>
<h2><a href="jsp/jstl/set_bean.jsp">jps demo jstl out set bean </a></h2>
<h2><a href="jsp/jstl/set_demo.jsp">jps demo jstl out set </a></h2>
<h2><a href="jsp/jstl/out_demo.jsp">jps demo jstl out show </a></h2>
<h2><a href="jsp/jstl/hello_jstl.jsp">jps demo jstl hello </a></h2>
<h2><a href="jsp/tag/addtag.jsp">jps demo tag add </a></h2>
<h2><a href="jsp/tag/simpleiteratetag.jsp">jps demo tag simple   date </a></h2>
<h2><a href="jsp/tag/simpledatetag.jsp">jps demo tag simple date </a></h2>
<h2><a href="jsp/tag/bodyiteratetag.jsp">jps demo tag body iterate </a></h2>
<h2><a href="jsp/tag/iteratetag.jsp">jps demo tag iterate </a></h2>
<h2><a href="jsp/tag/presenttag.jsp">jps demo tag present </a></h2>
<h2><a href="jsp/tag/datetag.jsp">jps demo tag date </a></h2>
<h2><a href="jsp/tag/hellotag2.jsp">jps demo tag hello2 </a></h2>
<h2><a href="jsp/tag/hellotag.jsp">jps demo tag hello </a></h2>
<h2><a href="jsp/el/other_demo.jsp">jps demo el other </a></h2>
<h2><a href="jsp/el/logic_demo.jsp">jps demo el logic </a></h2>
<h2><a href="jsp/el/rel_demo.jsp">jps demo el rel </a></h2>
<h2><a href="jsp/el/math_demo.jsp">jps demo el math </a></h2>
<h2><a href="<%=basePath%>/ELListServlet">jps demo el print ELListServlet</a></h2>
<h2><a href="<%=basePath%>/ELServlet">jps demo el print ELServlet</a></h2>
<h2><a href="jsp/el/print_vo.jsp">jps demo el print vo</a></h2>
<h2><a href="jsp/el/print_map.jsp">jps demo el print map</a></h2>
<h2><a href="jsp/el/print_collection.jsp">jps demo el print collection</a></h2>
<h2><a href="jsp/el/param_values_demo.html">jps demo el get values</a></h2>
<h2><a href="jsp/el/get_param_demo.jsp">jps demo el get param</a></h2>
<h2><a href="jsp/el/invoke_method.jsp">jps demo el invoke method</a></h2>
<h2><a href="jsp/el/get_attribute_demo.jsp">jps demo el get attribute</a></h2>
<h2><a href="jsp/el/repeat_attribute_demo.jsp">jps demo el print 4 range scope</a></h2>
<h2><a href="jsp/el/print_attribute_demo02.jsp">jps demo el print attribute info 2</a></h2>
<h2><a href="jsp/el/print_attribute_demo01.jsp">jps demo el print attribute info</a></h2>
<h2><a href="jsp/listener/login.jsp">jps demo servlet request login</a></h2>
<h2><a href="jsp/listener/request_attribute_remove.jsp">jps demo servlet request remove attribute</a></h2>
<h2><a href="jsp/listener/request_attribute_replace.jsp">jps demo servlet request replace attribute</a></h2>
<h2><a href="jsp/listener/request_attribute_add.jsp">jps demo servlet request add attribute</a></h2>
<h2><a href="jsp/listener/session_unbound.jsp">jps demo servlet session remove loginuser</a></h2>
<h2><a href="jsp/listener/session_bound.jsp">jps demo servlet session loginuser</a></h2>
<h2><a href="jsp/listener/session_attribute_remove.jsp">jps demo servlet session remove attribute</a></h2>
<h2><a href="jsp/listener/session_attribute_add.jsp">jps demo servlet session add attribute</a></h2>
<h2><a href="jsp/listener/application_attribute_remove.jsp">jps demo servlet remove attribute</a></h2>
<h2><a href="jsp/listener/application_attribute_add.jsp">jps demo servlet add attribute</a></h2>
<h2><a href="<%=basePath%>/">jsp demo servlet filter</a></h2>
<h2><a href="jsp/servlet/login.jsp">jsp demo servlet login</a></h2>
<h2><a href="<%=basePath%>/ServerRedirectDemo">jsp demo servlet sever</a></h2>
<h2><a href="<%=basePath%>/ClientRedirectDemo">jsp demo servlet client</a></h2>
<h2><a href="<%=basePath%>/ServletContextDemoServlet">jsp demo servlet context realpath</a></h2>
<h2><a href="<%=basePath%>/HttpSessionDemoServlet">jsp demo servlet session</a></h2>
<h2><a href="<%=basePath%>/InitParamServlet">jsp demo servlet init param</a></h2>
<h2><a href="<%=basePath%>/LifeServlet">jsp demo servlet lifecycle</a></h2>
<h2><a href="jsp/servlet/input.jsp">jsp demo servlet input html</a></h2>
<h2><a href="<%=basePath%>/InputServlet">jsp demo servlet input</a></h2>
<h2><a href="<%=basePath%>/helloServlet">jsp demo servlet hello word</a></h2>
<h2><a href="jsp/upload/fileupload_demo03.html">jsp demo fileupload 03</a></h2>
<h2><a href="jsp/upload/fileupload_demo02.html">jsp demo fileupload 02</a></h2>
<h2><a href="jsp/upload/fileupload_demo01.html">jsp demo fileupload 01</a></h2>
<h2><a href="jsp/upload/smartupload_demo02.html">jsp demo smart upload 02</a></h2>
<h2><a href="jsp/upload/smartupload_demo01.html">jsp demo smart upload 01</a></h2>
<h2><a href="jsp/emp/emp_list.jsp">jsp demo emp list</a></h2>
<h2><a href="jsp/emp/emp_insert.jsp">jsp demo emp insert</a></h2>
<h2><a href="jsp/javabean/register/index.jsp">jsp demo register check</a></h2>
<h2><a href="jsp/javabean/getProperty/removebean.jsp">jsp demo remove bean</a></h2>
<h2><a href="jsp/javabean/getProperty/application_bean.jsp">jsp demo application bean</a></h2>
<h2><a href="jsp/javabean/getProperty/session_bean.jsp">jsp demo session bean</a></h2>
<h2><a href="jsp/javabean/getProperty/request_bean01.jsp">jsp demo request bean 01</a></h2>
<h2><a href="jsp/javabean/getProperty/page_bean01.jsp">jsp demo page bean 01</a></h2>
<h2><a href="jsp/javabean/getProperty/input_bean.jsp">jsp demo get property</a></h2>
<h2><a href="jsp/javabean/value_bean.jsp">jsp demo value</a></h2>
<h2><a href="jsp/javabean/input_bean2.htm">jsp demo input 02</a></h2>
<h2><a href="jsp/javabean/input_bean.htm">jsp demo input</a></h2>
<h2><a href="jsp/javabean/use_javabean_demo022.jsp">jsp demo javabean 022</a></h2>
<h2><a href="jsp/javabean/use_javabean_demo02.jsp">jsp demo javabean 02</a></h2>
<h2><a href="jsp/javabean/use_javabean_demo01.jsp">jsp demo javabean 01</a></h2>


<h1>内容映射路径是:<%=basePath%>
</h1>
<h1>实际内容映射路径是:<%=baseRealPath%>
</h1>
<h2><a href="jsp/pagecontext/pagecontext_forward_demo01.jsp">jsp demo pagecontext 01</a></h2>
<h2><a href="jsp/out/out_demo.jsp">jsp demo out</a></h2>
<h2><a href="<%=basePath%>/config.mldn">jsp config init</a></h2>
<h2><a href="<%=basePath%>/hello.mldn">jsp demo web-inf hello</a></h2>
<h2><a href="jsp/application/all_attribute.jsp">jsp demo application all attributes</a></h2>
<h2><a href="jsp/application/count.jsp">jsp demo count user</a></h2>
<h2><a href="jsp/application/input_content.html">jsp demo application savefile readfile</a></h2>
<h2><a href="jsp/application/get_path_demo01.jsp">jsp demo application get realpath</a></h2>
<h2><a href="jsp/session/get_time.jsp">jsp demo session get time</a></h2>
<h2><a href="jsp/session/is_new.jsp">jsp demo is new user</a></h2>
<h2><a href="jsp/session/login.jsp">jsp demo login</a></h2>
<h2><a href="jsp/session/session_id.jsp">jsp demo session id</a></h2>
<h2><a href="jsp/response/response_demo08.jsp">jsp demo response demo 08 jsp</a></h2>
<h2><a href="jsp/response/response_demo07.jsp">jsp demo response demo 07 jsp</a></h2>
<h2><a href="jsp/response/response_demo06.jsp">jsp demo response demo 06jsp</a></h2>
<h2><a href="jsp/response/response_demo05.jsp">jsp demo response demo 05 jsp</a></h2>
<h2><a href="jsp/response/response_demo04.jsp">jsp demo response demo 04 jsp</a></h2>
<h2><a href="jsp/response/response_demo03.jsp">jsp demo response demo 03 jsp</a></h2>
<h2><a href="jsp/response/response_demo03.htm">jsp demo response demo 03 html</a></h2>
<h2><a href="jsp/response/response_demo02.jsp">jsp demo response demo 02</a></h2>
<h2><a href="jsp/response/response_demo01.jsp">jsp demo response demo 01</a></h2>
<h2><a href="jsp/request/request_demo_06.jsp">jsp demo request demo 06</a></h2>
<h2><a href="jsp/request/security.jsp">jsp demo request demo security</a></h2>
<h2><a href="jsp/request/request_demo_05.jsp">jsp demo request demo 05</a></h2>
<h2><a href="jsp/request/request_demo_04.html">jsp demo request demo 04</a></h2>
<h2><a href="jsp/request/request_demo_03.jsp">jsp demo request demo 03</a></h2>
<h2><a href="jsp/request/request_demo_02.html">jsp demo request demo 02</a></h2>
<h2><a href="jsp/request/request_demo_01.html">jsp demo request demo 01</a></h2>
<h2><a href="jsp/request/request_scope_04.jsp">jsp demo pageContext</a></h2>
<h2><a href="jsp/application/application_scope_02.jsp">jsp demo application 02</a></h2>
<h2><a href="jsp/application/application_scope_01.jsp">jsp demo application 01</a></h2>
<h2><a href="jsp/session/session_scope_02.jsp">jsp demo session 02</a></h2>
<h2><a href="jsp/session/session_scope_01.jsp">jsp demo session 01</a></h2>
<h2><a href="jsp/request/request_scope_03.jsp">jsp demo request 03</a></h2>
<h2><a href="jsp/request/request_scope_02.jsp">jsp demo request 02</a></h2>
<h2><a href="jsp/request/request_scope_01.jsp">jsp demo request 01</a></h2>
<h2><a href="jsp/page2/page_scope_03.jsp">jsp demo pageext 03</a></h2>
<h2><a href="jsp/page2/page_scope_02.jsp">jsp demo pageext 02</a></h2>
<h2><a href="jsp/page2/page_scope_01.jsp">jsp demo pageext 01</a></h2>
<h2><a href="jsp/login/login.jsp">jsp demo login</a></h2>
<h2><a href="jsp/forward/forward_demo02.jsp">jsp demo forward 02</a></h2>
<h2><a href="jsp/forward/forward_demo01.jsp">jsp demo forward 01</a></h2>
<h2><a href="jsp/include/include_demo-5.jsp">jsp demo include 05</a></h2>
<h2><a href="jsp/include/include_demo-4.jsp">jsp demo include 04</a></h2>
<h2><a href="jsp/include/include_demo-3.jsp">jsp demo include 03</a></h2>
<h2><a href="jsp/include/include_demo-2.jsp">jsp demo include 02</a></h2>
<h2><a href="jsp/include/include_demo-1.jsp">jsp demo include 01</a></h2>
<h2><a href="jsp/sql/list_emp.jsp">jsp demo sql</a></h2>
<h2><a href="jsp/page/show.jsp">jsp demo page show error</a></h2>
<h2><a href="jsp/page/page_demo03.jsp">jsp demo page 03</a></h2>
<h2><a href="jsp/page/page_demo02.jsp">jsp demo page 02</a></h2>
<h2><a href="jsp/page/page_demo01.jsp">jsp demo page 01</a></h2>
<h2><a href="jsp/scriptlet/scriptlet_tag.jsp">jsp demo scriptlet tag</a></h2>
<h2><a href="jsp/print%20table/print_table.html.jsp">jsp demo print table</a></h2>
<h2><a href="jsp/print%20table/print_table02.jsp">jsp demo print table 02</a></h2>
<h2><a href="jsp/print%20table/print_table01.jsp">jsp demo print table 01</a></h2>
<h2><a href="jsp/scriptlet/scriptlet_demo03.jsp">jsp demo scriptlet 03</a></h2>
<h2><a href="jsp/scriptlet/scriptlet_demo02.jsp">jsp demo scriptlet 02</a></h2>
<h2><a href="jsp/scriptlet/scriptlet_demo01.jsp">jsp demo scriptlet 01</a></h2>
<h2><a href="jsp/input.html.jsp">jsp demo input</a></h2>
<h2><a href="dom/js_dom_demo05.jsp">js dom demo 05</a></h2>
<h2><a href="dom/js_dom_demo04.jsp">js dom demo 04</a></h2>
<h2><a href="dom/js_dom_demo03.jsp">js dom demo 03</a></h2>
<h2><a href="dom/js_dom_demo02.jsp">js dom demo 02</a></h2>
<h2><a href="dom/js_dom_demo01.jsp">js dom demo 01</a></h2>
<h2><a href="test/xml_demo_06.xml">xml 06</a></h2>
<h2><a href="test/xml_demo_05.xml">xml 05</a></h2>
<h2><a href="test/xml_demo_04.xml">xml 04</a></h2>
<h2><a href="test/xml_demo_03.xml">xml 03</a></h2>
<h2><a href="test/xml_demo_02.xml">xml 02</a></h2>
<h2><a href="test/xml_demo_01.jsp">xml 01</a></h2>
<h2><a href="test/script_windowdemo_05.jsp">script window 05</a></h2>
<h2><a href="test/script_windowdemo_04.jsp">script window 04</a></h2>
<h2><a href="test/script_windowdemo_03.jsp">script window 03</a></h2>
<h2><a href="test/script_windowdemo_02.jsp">script window 02</a></h2>
<h2><a href="test/script_windowdemo_01.jsp">script window 01</a></h2>
<h2><a href="test/script_eventform_04.jsp">script event form 04</a></h2>
<h2><a href="test/script_eventform_03.jsp">script event form 03</a></h2>
<h2><a href="test/script_eventform_03.jsp">script event form 03</a></h2>
<h2><a href="test/script_eventform_03.jsp">script event form 03</a></h2>
<h2><a href="https://www.w3cschool.cn/wkspring/dgte1ica.html" target="_blank">Spring Study Address</a></h2>
<h2><a href="test/html_show01.jsp">html show 01</a></h2>
<h2><a href="test/html_show02.jsp">html show 02</a></h2>
<h2><a href="test/html_form.jsp">html show form</a></h2>

<h2><a href="test/script_basicdemo_01.jsp">script demo 01</a></h2>
<h2><a href="test/script_basicdemo_02.jsp">script demo 02</a></h2>
<h2><a href="test/script_basicdemo_03.jsp">script demo 03</a></h2>
<h2><a href="test/script_basicdemo_04.jsp">script demo 04(include script)</a></h2>
<h2><a href="test/script_vardemo.jsp">script demo 05(var)</a></h2>
<h2><a href="test/script_ifdemo.jsp">script demo (if)</a></h2>
<h2><a href="test/script_tabledemo.jsp">script demo (table)</a></h2>
<h2><a href="test/script_muldemo.jsp">script demo multiple(table)</a></h2>
<h2><a href="test/script_basicdemo_08.jsp">script demo 08</a></h2>
<h2><a href="test/script_func.jsp">script demo fun(01)</a></h2>
<h2><a href="test/script_fundemo_01.jsp">script func 01</a></h2>
<h2><a href="test/script_fundemo_02.jsp">script func 02</a></h2>
<h2><a href="test/script_arraydemo_01.jsp">script array 01</a></h2>
<h2><a href="test/script_arraydemo_02.jsp">script array 02</a></h2>
<h2><a href="test/script_eventdemo_01.jsp">script event 01</a></h2>
<h2><a href="test/script_eventdemo_02.jsp">script event 02</a></h2>
<h2><a href="test/script_eventform_01.jsp">script event form 01</a></h2>
<h2><a href="test/script_eventform_02.jsp">script event form 02</a></h2>
<h2><a href="test/script_eventform_03.jsp">script event form 03</a></h2>

$END$
</body>
</html>
