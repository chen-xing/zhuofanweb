<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="人工搜索"
    keywords="本地系统文件、人工博客文件、网络热门资源一网打尽"
    description="本地系统文件、人工博客文件、网络热门资源一网打尽">
    </@header>
    <link rel="stylesheet" href="/static/css/simple-dialog.css">
    <script src="/static/js/simple-dialog.js"></script>
    <style type="text/css">
        html {
            width: 100%;
            margin: 1px auto;
            overflow-x: hidden;
        }

        body {
            width: 100%;
            margin: 0 auto;
        }

        br {
            height: 0px;
        }

        p {
            padding: 0;
            margin: 0;
            word-wrap: break-word;
        }

        em {
            color: red;
        }

        .container {
            width: 80%
            margin: 0px auto; /*主面板DIV居中*/
        }

        .content {
            width: 80%;
            padding-top: 5px;
            position: relative;
            margin: 5px auto;
        }

        .con-title {
            font-size: 16px;
            padding-bottom: 5px;
            color: blue;
        }

        .con-path {
            color: #999999;
            font-size: 12px;
            padding-bottom: 10px;
        }

        .con-preview {
            font-size: 13px;
            line-height: 1.6;
            max-height: 60px;
            overflow: hidden;
        }

        .con-more {
            font-size: 12px;
            padding: 5px 0;
            text-align: right;
            display: block;
            background-color: gainsboro;
            cursor: pointer;
        }

        .con-more:hover {
            background-color: #eeeeee;
        }

        .c_left {
            background: white;
            margin-bottom: 5px
        }


        .header {
            height: 40px;
        }

        .parent {
            width: 100%;
            margin: 5px auto;
        }

        .parent > input:first-of-type {
            /*输入框高度设置为40px, border占据2px，总高度为42px*/
            width: 500px;
            height: 36px;
            border: 1px solid #ccc;
            font-size: 16px;
            outline: none;
        }

        .parent > input:first-of-type:focus {
            border: 1px solid #317ef3;
            padding-left: 10px;
        }

        .parent > input:last-of-type {
            /*button按钮border并不占据外围大小，设置高度42px*/
            width: 100px;
            height: 36px;
            position: absolute;
            background: #317ef3;
            border: 1px solid #317ef3;
            color: #fff;
            font-size: 16px;
            outline: none;
        }

        .showButton {
            text-decoration: none;
        }

    </style>
    <div class="container">
        <div class="header">
            <form action="./search" class="parent">
                <input type="keyword" name="keyword" value="${keyword}"
                       style="height:60px;border: solid 1px #0000FF;width:600px;margin-left:220px;">
                <input type="submit" value="搜索" style="height: 60px">
            </form>
        </div>

        <div class="content" style="margin-top: 25px;">
            <#list articles as article>
                <div class="c_left">
                    <p class="con-title">${article.title}</p>
                    <a href="${article.path}" target="_blank" download="${article.path}"><p
                                class="con-path">${article.path}</p>
                    </a>
                    <p class="con-preview">${article.highlightContent}</p>
                    <a class="con-more">完整摘要</a>
                    <p><a href="#" rel="rs-dialog" data-target="myModal${article.id}" class="showButton">查看全部</a>
                    </p>
                </div>

                <div class="rs-dialog" id="myModal${article.id}">
                    <div class="rs-dialog-box">
                        <a class="close" href="#">&times;</a>
                        <div class="rs-dialog-header">
                            <h3>人工搜索</h3>
                        </div>
                        <div class="rs-dialog-body">
                            <p class="con-all">${article.content}</p>
                        </div>
                        <div class="rs-dialog-footer">
                            <input type="button" class="close" value="Close" style="float:right">
                        </div>
                    </div>
                </div>
            </#list>
        </div>

    </div>
    <script type="text/javascript">
        $(".con-more").on("click", function () {
            $this = $(this);
            $this.hide();
            $this.parent().find('.con-preview').css("max-height", "none");
        })
    </script>
</@compress>