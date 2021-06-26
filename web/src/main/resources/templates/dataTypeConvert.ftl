<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="在线properties、yaml、json格式相互转化"
    keywords="导航网，json在线格式化，图床，格式转化，base64在线编码"
    description="导航网，json在线格式化，图床，格式转化，base64在线编码">
    </@header>
    <div class="container-fluid">
        <div class="row vertical-middle">
            <div class="col-md-5 col-lg-5">
                <div class="panel  panel-primary">
                    <div class="panel-body">
                    <textarea class="form-control" id="from" placeholder="input content" rows="50"
                              style="font-size:19px; "></textarea>
                    </div>
                </div>
            </div>

            <div class="col-md-1 col-lg-1 text-center" style="line-height: 500px;">
                <div class="btn-group-vertical">
                    <input class="btn btn-primary" onclick="Base.dataTypeConvert(0)" type="button" value="json to yaml -->">
                    <input class="btn btn-success" onclick="Base.dataTypeConvert(1)" style="margin-top: 10px;" type="button"
                           value="yaml to json -->">
                    <input class="btn btn-info" onclick="Base.dataTypeConvert(2)" style="margin-top: 10px;" type="button"
                           value="yaml to prop -->">
                    <input class="btn btn-danger" onclick="Base.dataTypeConvert(3)" style="margin-top: 10px;" type="button"
                           value="prop to yaml -->">
                </div>
            </div>

            <div class="col-md-5 col-lg-5">
                <div class="panel  panel-primary">
                    <div class="panel-body">
                    <textarea class="form-control" id="to" placeholder="output content" rows="50"
                              style="font-size:19px; "></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="loadingModal">
            <div style="width: 200px;height:20px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-10px">
                <div class="progress progress-striped active" style="margin-bottom: 0;">
                    <div class="progress-bar" style="width: 100%;"></div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        var Base = {
            dataTypeConvert: function (type) {
                Base.showLoading();
                var  data={"convertorType": type, "input": $('#from').val()};
                $.ajax({
                    type: "post",
                    url: "/webapi/datatypeConvert",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (msg) {
                        $('#to').val(msg.data);
                        Base.hideLoading();
                    }
                });
            },
            showLoading: function () {
                $("#loadingModal").show();
            },
            hideLoading: function () {
                $('#loadingModal').hide();
            }
        }
    </script>
</@compress>