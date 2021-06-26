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
            margin: 5px;
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
            min-height: 700px;
            overflow: visible;
        }

        .cx-col-auto {
            margin-top: 20px;
        }
    </style>
    <div class="container-fluid">
        <nav class="navbar navbar-light bg-light">
            <form class="row g-3">
                <div class="form-check cx-col-auto col-auto" style="margin-left:50px;display: none;">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        引号
                    </label>
                </div>
                <select class="form-select form-select-lg mb-3 cx-col-auto col-auto"
                        aria-label=".form-select-lg example"
                        style="width:100px !important;display:inline-block;margin-left: 40px;" id="myselect">
                    <option selected value="99">展开</option>
                    <option value="1">叠起</option>
                    <option value="3">2级</option>
                    <option value="4">3级</option>
                    <option value="5">4级</option>
                    <option value="6">5级</option>
                    <option value="7">6级</option>
                    <option value="8">7级</option>
                </select>


                <button id="btn-json-viewer" type="button"
                        class="btn btn-primary .btn-lg cx-compnent cx-col-auto col-auto" onclick="Process()"
                        style="margin-left: 10px;padding-left: 30px;padding-right: 30px;margin-right: 0">格式化
                </button>
                <button type="button" class="btn btn-success .btn-lg cx-compnent cx-col-auto col-auto"
                        onclick="SelectAllClicked();">复制格式化的内容
                </button>
            </form>
        </nav>
        <div class="row justify-content-md-center">
            <div class="cx-div">
                <textarea class="cx-fromcontrol " id="RawJson"></textarea>
            </div>
            <div class="cx-div">
                <pre id="Canvas" class="cx-fromcontrol"></pre>
            </div>
        </div>
        <div class="alert alert-danger fixed-bottom" role="alert" id="toolTip" style="display: none;margin:10px;">
        </div>
    </div>
    <script src="/static/js/jquery.jsonview.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //切换显示级数
            $("#myselect").change(function () {
                var opt = $("#myselect").val();
                if (opt == 100) {
                    ExpandAllClicked();
                } else if (opt == 1) {
                    CollapseAllClicked();
                } else {
                    CollapseLevel(opt);
                }
            });
        });

    </script>
</@compress>