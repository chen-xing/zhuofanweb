<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="在线字符串处理工具"
    keywords="uuid、hash、base64、在线时间戳工具"
    description="uuid、hash、base64、在线时间戳工具,常见开发工具一站式解决">
    </@header>
    <div class="container-fluid">
        <input type="text" class="form-control" id="uuidtext">
        <button type="button" class="btn btn-primary mb-3" onclick="generateUUID(false)">生成uuid
        </button>
        <button type="button" class="btn btn-primary mb-3" onclick="generateUUID(true)">去-生成uuid
        </button>
    </div>
    <script type="text/javascript">
        function generateUUID(flag) {
            var uuid = guid();
            if (flag) {
                uuid = uuid.replace(/-/g, "");
            }
            $("#uuidtext").val(uuid);
        }

        function guid() {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = Math.random() * 16 | 0,
                    v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        }
    </script>
</@compress>