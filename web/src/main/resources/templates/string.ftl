<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="在线字符串处理工具"
    keywords="uuid、hash、base64、在线时间戳工具"
    description="uuid、hash、base64、在线时间戳工具,常见开发工具一站式解决">
    </@header>
    <div class="container-fluid">
        <table class="table table-light table-borderless">
            <tbody>
            <tr>
                <td><input type="text" class="form-control" id="uuidtext"></td>
                <td>
                    <button type="button" class="btn btn-primary mb-3" onclick="generateUUID(false)">生成uuid
                    </button>
                    <button type="button" class="btn btn-primary mb-3" onclick="generateUUID(true)">去-生成uuid
                    </button>
                </td>
            </tr>
            <tr>
                <td><input type="text" class="form-control" id="timestamptext"></td>
                <td>
                    <button type="button" class="btn btn-primary mb-3" onclick="getCurrentStamp()">获取当前时间戳(毫秒)
                    </button>
                    <button type="button" class="btn btn-primary mb-3" onclick="analysisStamp()">时间戳反解析
                    </button>
                </td>
            </tr>
            </tbody>
        </table>


    </div>
    <script type="text/javascript">
        function generateUUID(flag) {
            var uuid = guid();
            if (flag) {
                uuid = uuid.replace(/-/g, "");
            }
            $("#uuidtext").val(uuid);
        }

        /**
         * 生成uuid
         */
        function guid() {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = Math.random() * 16 | 0,
                    v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        }

        /**
         * 获取当前时间戳
         */
        function getCurrentStamp() {
            var time = new Date().getTime(); //1603009495724,精确到毫秒
            $("#timestamptext").val(time);
        }

        Date.prototype.Format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }

        /**
         * 反解析时间戳
         */
        function analysisStamp() {
            var timestamp = $("#timestamptext").val();
            var newDate = new Date();
            newDate.setTime(timestamp);
            var commonTime = newDate.Format("yyyy-MM-dd hh:mm:ss.S");
            $("#timestamptext").val(commonTime);
        }


    </script>
</@compress>