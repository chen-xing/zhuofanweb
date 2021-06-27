<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="base64图片在线转换工具"
    keywords="图片Base64编码,Base64 DataUrl编码,base64图片转换工具,base64图片在线转换"
    description="base64图片转换工具，是一款可以在线任意图片格式转Base64 DataUrl编码工具,可以让你很方便地在没有上传文件的条件下将图片插入其它的网页、编辑器中。">
    </@header>
    <div class="container-fluid">
        <input class="btn btn-primary" id="btnfile" style="display: none;" type="file">
        <button class="btn btn-primary" onclick="uploadfile();" style="margin:20px;">上传图片</button>
        <hr>
        <img id="showImage" style="max-height: 300px; height: 8em; min-width:8em;margin-left:20px;">
        <hr>
        <textarea class="layui-input-block"
                  style="display: block; width: 100%;height: 40em;margin-left: 0px;"></textarea>
    </div>

    <script type="text/javascript">
        function run(input_file, get_data) {
            /*input_file：文件按钮对象*/
            /*get_data: 转换成功后执行的方法*/
            if (typeof (FileReader) === 'undefined') {
                alert("抱歉，你的浏览器不支持 FileReader，不能将图片转换为Base64，请使用现代浏览器操作！");
            } else {
                try {
                    /*图片转Base64 核心代码*/
                    var file = input_file.files[0];
                    //这里我们判断下类型如果不是图片就返回 去掉就可以上传任意文件
                    if (!/image\/\w+/.test(file.type)) {
                        alert("请确保文件为图像类型");
                        return false;
                    }
                    var reader = new FileReader();
                    reader.onload = function () {
                        get_data(this.result);
                    }
                    reader.readAsDataURL(file);
                } catch (e) {
                    alert('图片转Base64出错啦！' + e.toString())
                }
            }
        }

        $(function () {
            $("input").change(function () {
                run(this, function (data) {
                    $('#showImage').attr('src', data);
                    $('textarea').val(data);
                });
            });
        });

        function uploadfile() {
            $("#btnfile").trigger("click");
        }
    </script>
</@compress>