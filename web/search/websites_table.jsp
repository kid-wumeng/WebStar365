<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CSS文件 -->
<link type="text/css" rel="stylesheet" href="css/search/websites_table.css" />
<!-- JS文件 -->
<script type="text/javascript" src="js/search/websites_table.js"></script>
<div class="main">
    <table>
        <s:if test="!#websites.isEmpty"><!-- 如果网站集合为空，则不显示表头 -->
        <tr>
            <th class="th_websiteName"><span>网站名</span></th>            
            <th class="th_websiteDomain"><span>网址</span></th>            
            <th class="th_websiteCat"><span>分类</span></th>            
            <th class="th_websiteAttrs"><span>属性</span></th>            
            <th class="th_websiteScore"><span>分数</span></th>            
        </tr>    
        </s:if>
        <s:iterator value="#websites" id="website" status="st">
        <tr class="odd_${st.odd}">
            <td class="websiteName">
                <a href="http://${websiteDomain}" target="_blank">${websiteName}</a>
            </td>
            <td class="websiteDomain">
                <a href="http://${websiteDomain}" target="_blank">${websiteDomain}</a>
            </td>
            <td class="websiteCat">
                <span>${websiteCat.catName}</span>
            </td>
            <td class="websiteAttrs">
                <span><s:iterator value="#website.websiteAttrs">${attrName} </s:iterator></span>
            </td>
            <td class="websiteScore star${websiteStarNum}">
                <span><fmt:formatNumber type="number" value="${websiteScore}" maxFractionDigits="2" /></span>
            </td> 
            <td class="websiteDetailedIntro">
                <a href="website/website?website.websiteId=${websiteId}">详情与评论</a>
            </td>
            <td class="enter">
                <a href="http://${websiteDomain}" target="_blank">进入网站</a>
            </td>
        </tr>
        </s:iterator>
    </table>
</div>