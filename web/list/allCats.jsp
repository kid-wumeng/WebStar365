<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<%--
    request范围下的变量：
        allCats - 全部分类的集合
            cat - 分类
                catId - 分类编号
                catName - 分类名
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>星象仪 - 全部分类</title>
    </head>
    <body>
        <s:iterator value="#allCats">
            <a href="../search/website?by=catId&cat.catId=${catId}">${catName}</a>
        </s:iterator>
    </body>
</html>
