<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- CSS文件 -->
<link type="text/css" rel="stylesheet" href="css/search/websites_grid.css" />
<!-- JS文件 -->
<script type="text/javascript" src="js/search/websites_grid.js"></script>
<div class="main">
    <s:iterator value="websites" id="website" status="st">
    <div class="website col${st.index % 4 + 1}"><%-- 每个网站 --%>
        <div class="websiteCover"><%-- 封面 --%>
            <s:if test='#website.websiteCoverPath == "defaultWebsiteCover"'>
                <img src="images/icons/common/defaultWebsiteCover.jpg" />
            </s:if>
            <s:else>
                <img src="websiteCovers/${website.websiteCoverPath}" />
            </s:else>
        </div>  
        <div class="row1"><%-- 第一行（网站名、域名） --%>
            <a class="websiteName" href="http://${websiteDomain}" target="_blank">${websiteName}</a><%-- 网站名（链接到本网站） --%>
            <a class="websiteDomain" href="http://${websiteDomain}" target="_blank">${websiteDomain}</a><%-- 域名（链接到本网站） --%>
        </div>
        <div class="row2"><%-- 第二行（星数、分数） --%>
            <span class="websiteStar"><%-- 星数 --%>
                <s:if test="#website.websiteStar == 0">
                    <span class="lackCommentNum">少于10人点评</span>
                </s:if>
                <s:elseif test="#website.websiteStar >= 1 && #website.websiteStar <= 7">
                    <img src="images/icons/star/star${websiteStarNum}.png" />
                </s:elseif>
            </span>
            <span class="websiteScore star${websiteStarNum}"><%-- 分数 --%>
                <s:if test="#website.websiteStar != 0">
                    <fmt:formatNumber type="number" value="${websiteScore}" maxFractionDigits="2" />
                </s:if>
            </span>
            <a class="websiteDetails" href="website/website?website.websiteId=${websiteId}">>> 评论</a>
        </div>
        <div class="row3"><%-- 第三行（属性） --%>
            <span class="websiteAttrs"><%-- 属性 --%>
                <s:iterator value="#website.websiteAttrs">
                    <a>${attrName}</a>
                </s:iterator>
            </span>
        </div>
    </div>
    </s:iterator>
</div>