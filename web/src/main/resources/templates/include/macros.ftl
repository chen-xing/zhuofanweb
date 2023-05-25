<#-- 公共顶部 -->
<#macro header title="卓帆网" keywords="" description="" canonical="" hasEditor=false>
<#include "/common/annotation.ftl">
    <!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>${title}</title>
    <meta name="keywords" content="${keywords}"/>
    <meta name="description" content="${description}" id="meta_description">
    <meta name="baidu-site-verification" content="codeva-AgmW7lnysZ"/>
    <#include "/layout/quote.ftl">
    <style>
        body {
            background-color: #f8f9fa !important;
        }
    </style>
    <#--        引入百度统计-->
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?02b0a243c9020e7ccb3b9218707c33b7";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>
<body>
<#include "/layout/header.ftl"/>
</#macro>

<#-- 公共底部 -->
<#macro footer>
<#include "/layout/footer.ftl"/>

<#nested>

</body>
</html>
</#macro>


