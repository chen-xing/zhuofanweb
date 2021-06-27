<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="it新闻一站试解决"
    keywords="IT新闻,it news,互联网新闻,业界新闻,IT资讯,IT业界,新闻频道"
    description="csdn、博客园最新的博客一网打尽">
    </@header>
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background: #f3f5f7;
        }

        .newInfo {
            background: #ffffff;
            margin: 20px 100px;
            border: 2px solid #f5f5f5;
        }

        h2 {
            padding: 20px;
            margin-bottom: 20px;
            color: #5184eb;
            border-bottom: 4px solid #5184eb;
        }

        ul {
            list-style: none;
        }

        ul li {
            line-height: 50px;
            height: 50px !important;
            padding-left: 10px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            border-bottom: 1px dashed #acacac;
        }

        ul a {
            color: #000000;
            text-decoration: none;
            font-size: 20px;
            height: 100%;
            width: 90%;
            display: inline-block;
        }

        ul li:hover {
            background: #ccc;
        }

        li span {
            float: right;
            margin-right: 20px;
        }
    </style>
    <div class="container-fluid">
        <div class="page-container" style="max-width: 2500px;">
            <div class="main-content" style="">
                <div class="newInfo">
                    <h2>今日要闻</h2>
                    <ul>
                    <#list newsInfo as itNewsBean>
                        <li><a target="_blank" href="${itNewsBean.url}"><strog>${itNewsBean.title}</strog></a><span>${itNewsBean.gmtCreate}</span></li>
                    </#list>
                    </ul>
                </div>
            </div>

        </div>
        <!-- Bottom Scripts -->
</@compress>