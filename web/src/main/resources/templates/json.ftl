<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="json格式化"
    keywords="导航网，json在线格式化，图床，格式转化，base64在线编码"
    description="导航网，json在线格式化，图床，格式转化，base64在线编码">
    </@header>
    <link href="/static/css/jquery.jsonview.min.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .cx-div {
            background-color: #ffffff;
            /*border: solid 1px #8E8E8E;*/
            min-height: 700px;
            margin: 0;
            padding: 0;
            width: 48%;
        }

        .cx-compnent {
            margin: 10px;
        }

        .checkbox-inline {
            position: relative;
            display: inline-block;
            margin-bottom: 0;
            font-weight: normal;
            vertical-align: middle;
            cursor: pointer;
        }

        .cx-fromcontrol {
            height: 100%;
            padding: 0 !important;
            border: 0;
            border-radius: 0;
            resize: none;
            outline: none;
            border: 1px solid #eee;
            width: 100%;
        }
    </style>
    <div class="container-fluid">
        <nav class="navbar navbar-light bg-light">
            <form class="container-fluid justify-content-start">
                <button id="btn-json-viewer" type="button" class="btn btn-primary .btn-lg cx-compnent">格式化</button>
                <button type="button" class="btn btn-success .btn-lg cx-compnent" onclick="copy();">复制格式化的内容</button>
            </form>
        </nav>
        <div class="row justify-content-md-center">
            <div class="cx-div">
                <textarea class="cx-fromcontrol " id="json-input"></textarea>
            </div>
            <div class="cx-div">
                <pre id="json-renderer" class="cx-fromcontrol"></pre>
            </div>
        </div>
        <div class="alert alert-danger fixed-bottom" role="alert" id="toolTip" style="display: none;margin:10px;">
        </div>
    </div>
    <script src="/static/js/jquery.jsonview.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('#btn-json-viewer').click(function () {
                try {
                    var input = eval('(' + $('#json-input').val() + ')');
                } catch (error) {
                    $("#toolTip").text(error).show();
                    setTimeout(function () {
                        $("#toolTip").hide();
                    }, 3000);
                }
                var options = {
                    collapsed: false,
                    withQuotes:true
                };
                $('#json-renderer').jsonViewer(input, options);
            });
        });

        function copy() {
            var Url2 = document.getElementById("json-renderer");
            var text = $("#json-renderer").text();
            copyToClip(text, "复制成功");
        }

        /**
         * 复制内容到粘贴板
         * content : 需要复制的内容
         * message : 复制完后的提示，不传则默认提示"复制成功"
         */
        function copyToClip(content, message) {
            var aux = document.createElement("input");
            aux.setAttribute("value", content);
            document.body.appendChild(aux);
            aux.select();
            document.execCommand("copy");
            document.body.removeChild(aux);
            if (message == null) {
                toastr.success("复制成功");
            } else {
                toastr.success(message);
            }
        }
    </script>
</@compress>