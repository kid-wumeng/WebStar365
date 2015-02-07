<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%--
    request范围下的变量：
        hotAttrs - 热门属性的集合
            attr - 属性
                attrId - 属性编号
                attrName - 属性名
                attrFindNum - 属性被查询的次数
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 热门属性</title>
    </head>
    <body>
        <s:iterator value="#hotAttrs">
            <a href="../search/website?by=attrId&attr.attrId=${attrId}">${attrName}</a>
        </s:iterator>
    </body>
</html>