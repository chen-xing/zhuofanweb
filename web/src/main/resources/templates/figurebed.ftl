<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="高效免费图床"
    keywords="图片免费保存和外链图片,免费图床"
    description="优启梦永久免费图床，稳定图片外链；支持批量上传,即时预览,不限制流量,不限制外链数,永久保存,阿里巴巴图片服务器,全网CDN图床,高速稳定,支持网页,手机上传,无需插件,支持JPG,GIF,PNG等文件格式,微博图床,土豆是个好图床">
    </@header>
    <style type="text/css">
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, 'sans-serif';
            background: url(https://api.uomg.com/api/image.lofter?format=images);
            background-size: cover;
        }

        @font-face {
            font-family: 'webfont_2';
            src: url('//at.alicdn.com/t/webfont_bar76uyhrpd.eot'); /* IE9*/
            src: url('//at.alicdn.com/t/webfont_bar76uyhrpd.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */ url('//at.alicdn.com/t/webfont_bar76uyhrpd.woff') format('woff'), /* chrome、firefox */ url('//at.alicdn.com/t/webfont_bar76uyhrpd.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/ url('//at.alicdn.com/t/webfont_bar76uyhrpd.svg#思源黑体-极细') format('svg'); /* iOS 4.1- */
        }

        .text-center {
            text-align: center;
        }

        .text-white {
            color: #FFF;
        }

        .header, .footer {
            margin: 30px;
            color: #fff;
        }

        .title1 {
            font-size: 20px;
        }

        .title2 {
            font-size: 24px;
            font-family: "webfont_2" !important;
        }

        .jumbotron {
            margin: auto;
            text-align: center;
            background-color: rgba(255, 255, 255, .3);
        }

        .jumbotron input[type=file] {
            opacity: 0;
            width: 102px;
            height: 31px;
            position: absolute;
            display: inline-block;
        }

        .preview {
            color: #fff;
        }

        .preview img {
            max-width: 10%;
        }

        .preview p {
            word-break: break-all;
            word-wrap: break-word;
            font-size: 13px !important;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, .3);
        }
    </style>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12 header text-center">
                <p class="title1">卓希免费图床</p>
                <p class="title2">阿里巴巴图片外链服务 稳定不掉线 免费使用</p>
            </div>
            <div class="col-md-8 col-xs-10 jumbotron" style="margin:auto;">
                <div class="mselector">
                    <input accept="image/*" multiple type="file">
                    <button class="btn btn-primary btn-sm" type="button">选择本地图片</button>
                    <button class="btn btn-primary btn-sm" data-target="#url_upload_model" data-toggle="modal"
                            type="button" style="display: none">上传远程图片
                    </button>
                </div>
                <hr>
                <textarea class="form-control" id="url-res-txt" placeholder="上传后的图片外链地址将显示在此处，下方会同时显示外链地址和预览图。"
                          rows="5"></textarea>
                <div class="preview">
                    <hr>
                </div>
            </div>

        </div>
    </div>
    <div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="url_upload_model" role="dialog"
         tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">上传远程图片</h4>
                </div>
                <div class="modal-body">
                    <p class="lead">
                        请在下方输入远程图片地址~每行一个~
                    </p>
                    <textarea class="form-control" id="urls" name="urls" rows="3"></textarea>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" type="button">关闭</button>
                    <button class="btn btn-primary" onclick="url_upload();" type="button">提交</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var url = '/webapi/images';
        $(document).ready(function () {
            $("input[type='file']").change(function (e) {
                file_upload(this.files)
            });
            var obj = $('body');
            obj.on('dragenter', function (e) {
                e.stopPropagation();
                e.preventDefault()
            });
            obj.on('dragover', function (e) {
                e.stopPropagation();
                e.preventDefault()
            });
            obj.on('drop', function (e) {
                e.preventDefault();
                file_upload(e.originalEvent.dataTransfer.files)
            });
        });

        function file_upload(files) {
            if (files.length == 0) return alert('请选择图片文件！');
            for (var j = 0, len = files.length; j < len; j++) {
                console.log(files[j]);
                let imageData = new FormData();
                imageData.append("file", 'multipart');
                imageData.append("Filedata", files[j]);
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: imageData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    // 图片上传成功
                    success: function (result) {
                        if (result.code == 0) {
                            $('.preview').append('<div><img src="' + result.data + '" ><code class="title1">' + result.data + '</code></div>');
                        } else {
                            $('.preview').append('<div>"' + result.data + '"</div>');
                            console.log('第' + j + '个图片上传失败');
                        }
                    },
                    // 图片上传失败
                    error: function () {
                        $('.preview').append('<div>图片上传失败</div>');
                        console.log('图片上传失败');
                    }
                });
            }
        }

        function url_upload() {
            var urls = $('#urls').val();
            if (urls == false) return alert('请输入图片链接！');
            var UrlArr = urls.split("\n");
            $('#url_upload_model').modal('hide');
            for (var j = 0, len = UrlArr.length; j < len; j++) {
                console.log(UrlArr[j]);
                $.getJSON(url, {imgurl: UrlArr[j]}, function (result, textStatus) {
                    if (result.code == 1) {
                        $('.preview').append('<div><img src="' + result.imgurl + '" ><code class="title1">' + result.imgurl + '</code></div>');
                    } else {
                        toastr.error('第' + j + '个图片上传失败');
                    }
                    console.log(result);
                });
            }
        }
    </script>
</@compress>