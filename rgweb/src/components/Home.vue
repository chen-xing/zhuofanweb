
<template>
  <div class="layout">
    <el-aside width="250px" style="background-color: rgb(44, 46, 47)">
      <div style="border-bottom: 1px solid #313437; padding: 19px 45px">
        <img
          src="https://www.chenzhuofan.top/images/logo.png"
          style="width: 100%"
        />
      </div>
      <ul class="menuUl">
        <li class="menu" v-for="item in items">
          <a :href="'#' + item.gategoryName"
            ><i class="el-icon-star-on">{{ item.gategoryName }}</i></a
          >
        </li>
      </ul>
    </el-aside>
    <el-container>
      <el-header
        style="text-align: right; font-size: 18px; background-color: #ebeef5"
      >
        <el-input
          v-model="inputSearchKey"
          placeholder="请输入内容"
          style="width: 600px"
        ></el-input>
        <el-button type="primary" round @click="baidu">百度一下</el-button>
      </el-header>
      <el-main>
        <el-backtop target=".el-main"></el-backtop>
        <div class="main" v-for="item in items">
          <div class="menuDiv">
            <i :id="item.gategoryName" class="el-icon-edit menuSpan">{{
              item.gategoryName
            }}</i>
          </div>
          <div v-for="content in item.webUrlBeanList" class="urlcard">
            <el-card :body-style="{ padding: '0px', width: '100px' }">
              <a :href="content.url" target="_blank">
                <div class="cardDiv">
                  <div style="float: left; width: 50px">
                    <img :src="content.icoImage" class="image" />
                  </div>
                  <div class="cardDetail">
                    <span class="urlTitle">{{ content.title }}</span>
                    <div style="clear: both"></div>
                    <div class="bottom clearfix">
                      <time class="time">{{
                        content.description | ellipsis
                      }}</time>
                    </div>
                  </div>
                  <div style="clear: both"></div>
                </div>
              </a>
            </el-card>
          </div>
        </div>
      </el-main>
      <el-footer height="30px" class="divfoot">
        © 2019
        <a href="http://www.beian.miit.gov.cn/">
            <strong data-v-7cfb725e="">浙ICP备19008730号</strong>
            <i class="c-icon-jgwablogo"></i>
        </a>
        <a style="margin:0px 15px;" href="https://www.94rg.com" target="_blank" title="人工博客"><img style="height:16px;width:16px" src="https://www.94rg.com/img/favicon.ico" alt="人工博客">人工博客</a>
        <div id="cnzz_box" class="cnzzDiv"></div>

      </el-footer>
    </el-container>
  </div>
</template>

<script>
import '../assets/js/cnzz.js'
export default {
  name: "Index",
  data() {
    return {
      items: [
    {
        "gategoryName": "站长推荐", 
        "webUrlBeanList": [
            {
                "title": "人工博客", 
                "description": "专注于程序员最新技术分享，最热技术解读，难点问题剖析。做广大程序员的良师益友", 
                "url": "https://www.94rg.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/google_plus.svg"
            }, 
            {
                "title": "it早报", 
                "description": "爬虫自动获取csdn、博客园、开源中国等it社区的一线新闻集中展示", 
                "url": "/news/1", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/pdf.svg"
            }, 
            {
                "title": "卓希图床", 
                "description": "完全免费、稳定图片外链；支持批量上传,即时预览", 
                "url": "/figurebed", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/codepen.svg"
            }, 
            {
                "title": "json格式化", 
                "description": "json格式化", 
                "url": "/json", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/yarn.svg"
            }, 
            {
                "title": "Markdown排版利器", 
                "description": "Markdown排版利器，还能让Markdown内容，无需作任何调整就能同时在微信公众号、博客园、掘金、csdn等平台正确显示当前预览的效果", 
                "url": "http://md.94rg.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/mailchimp.svg"
            }, 
            {
                "title": "在线格式转化", 
                "description": "在线properties、yaml、json格式相互转化", 
                "url": "/dataTypeConvert", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/twitter.svg"
            }, 
            {
                "title": " 图片转base64", 
                "description": "图片转base64", 
                "url": "/base64", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/blogger.svg"
            }, 
            {
                "title": "GitHub", 
                "description": "全球最大的程序员交友社区", 
                "url": "https://github.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/github.svg"
            }, 
            {
                "title": "Stack Overflow", 
                "description": "优秀的程序员问答网站", 
                "url": "https://stackoverflow.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/stackoverflow.svg"
            }, 
            {
                "title": "Google", 
                "description": "国内google镜像", 
                "url": "https://gug1.icu/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/google.svg"
            }, 
            {
                "title": "Wikipedia", 
                "description": "自由的百科全書，目前全网最大且最受大众欢迎的wiki手册", 
                "url": "https://www.wikipedia.org/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/wikipedia.svg"
            }, 
            {
                "title": "SegmentFault 思否", 
                "description": "每月帮助 1000 万开发者解决技术问题", 
                "url": "https://segmentfault.com", 
                "icoImage": "https://ae01.alicdn.com/kf/HTB1FsQdelCw3KVjSZR0762cUpXaZ.png"
            }, 
            {
                "title": "百度", 
                "description": "最大的中文搜索引擎", 
                "url": "https://www.baidu.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/baidu.svg"
            }, 
            {
                "title": "easyIcon", 
                "description": "精美小图标", 
                "url": "https://www.easyicon.net/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/ethereum.svg"
            }, 
            {
                "title": "IBM Developer", 
                "description": "IBM技术文档", 
                "url": "https://www.ibm.com/developerworks/cn/topics/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/ibm.svg"
            }, 
            {
                "title": "简书", 
                "description": "优质的创作社区", 
                "url": "https://www.jianshu.com/", 
                "icoImage": "https://ae01.alicdn.com/kf/HTB1HgD8eliE3KVjSZFM762QhVXaw.png"
            }, 
            {
                "title": "知乎", 
                "description": "中文知识问答网站，有问题，上知乎，发现更大的世界", 
                "url": "https://www.zhihu.com/", 
                "icoImage": "https://ae01.alicdn.com/kf/HTB1QH7eelCw3KVjSZFu763AOpXaj.png"
            }, 
            {
                "title": "云栖社区", 
                "description": "阿里云面向开发者的开放型技术平台", 
                "url": "https://yq.aliyun.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/acast.svg"
            }, 
            {
                "title": "云+社区", 
                "description": "来自腾讯的开发者技术分享社区", 
                "url": "https://cloud.tencent.com/developer", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/access.svg"
            }, 
            {
                "title": "CSDN", 
                "description": "早期的专业IT技术社区", 
                "url": "https://www.csdn.net/", 
                "icoImage": "https://ae01.alicdn.com/kf/HTB1ZiY9emSD3KVjSZFK76210VXac.png"
            }, 
            {
                "title": "开源中国", 
                "description": "目前中国最大的开源技术社区，已收录近五万款开源软件", 
                "url": "https://www.oschina.net/", 
                "icoImage": "https://static.oschina.net/new-osc/img/favicon.ico"
            }, 
            {
                "title": "掘金", 
                "description": "一个帮助开发者成长的社区，较多的技术文章", 
                "url": "https://juejin.im/timeline", 
                "icoImage": "https://b-gold-cdn.xitu.io/favicons/v2/favicon-32x32.png"
            }, 
            {
                "title": "chrome插件", 
                "description": "不用翻墙，就可以下载到的chrome插件", 
                "url": "https://chrome-extension-downloader.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/disqus.svg"
            }, 
            {
                "title": "爱站网", 
                "description": "爱站网站长seo综合查询工具提供网站收录查询和站长查询以及百度权重值查询等多个站长工具，免费查询各种数据，包括收录、反链及关键词排名等", 
                "url": "https://www.aizhan.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/ko-fi.svg"
            }, 
            {
                "title": "全渠道搜索", 
                "description": "上网导航,思谋导航,自定义导航,全渠道搜索,谷歌学术,学术搜索,谷歌镜像,网址导航,Google,学术资源", 
                "url": "http://dir.scmor.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/go.svg"
            }, 
            {
                "title": "路过图床", 
                "description": "路过图床, 免费公共图床, 提供图片上传和图片外链服务, 原图保存, 全球CDN加速", 
                "url": "https://imgchr.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/reddit.svg"
            }, 
            {
                "title": "百度翻译", 
                "description": "百度翻译提供即时免费200+语言翻译服务，拥有网页和APP产品，百度翻译APP还支持拍照翻译、语音翻译等特色功能，随时随地沟通全世界", 
                "url": "https://fanyi.baidu.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/tumblr.svg"
            }, 
            {
                "title": "jQuery插件库", 
                "description": "jQuery插件库-收集最全最新最好的jQuery插件", 
                "url": "https://www.jq22.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/flickr.svg"
            }
        ]
    }, 
    {
        "gategoryName": "测试专家", 
        "webUrlBeanList": [
            {
                "title": "TesterHome", 
                "description": "TesterHome软件测试社区,人气最旺的软件测试技术门户,提供软件测试社区交流,测试沙龙", 
                "url": "https://testerhome.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/discord.svg"
            }, 
            {
                "title": "HttpRunner", 
                "description": "只需编写维护一份YAML/JSON脚本，即可实现自动化测试、性能测试", 
                "url": "https://testerhome.com/opensource_projects/httprunner", 
                "icoImage": "https://testerhome.com/uploads/opensource_project/2018/7d934997-08de-4479-b405-5ed748c23df9.jpg"
            }, 
            {
                "title": "python学习", 
                "description": "菜鸟教程 - 学的不仅是技术,更是梦想!", 
                "url": "http://www.runoob.com/python/python-tutorial.html", 
                "icoImage": "https://www.runoob.com/wp-content/uploads/2013/11/python.jpg"
            }, 
            {
                "title": "51testing", 
                "description": "51Testing软件测试网-中国软件测试人的精神家园", 
                "url": "http://bbs.51testing.com/forum.php", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/drupal.svg"
            }, 
            {
                "title": "在线工具", 
                "description": "OSCHINA.NET在线工具,ostools为开发设计人员提供在线工具", 
                "url": "http://tool.oschina.net/encrypt", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/bitwarden.svg"
            }, 
            {
                "title": "在线MD5", 
                "description": "本地计算文件MD5", 
                "url": "http://forsigner.com/browser-md5-file/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/espressif.svg"
            }, 
            {
                "title": "在线时间戳", 
                "description": "Unix时间戳转换,时间戳转换工具", 
                "url": "https://tool.lu/timestamp/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/amazon.svg"
            }, 
            {
                "title": "base64在线转图片", 
                "description": "base64在线转图片", 
                "url": "http://www.vgot.net/test/image2base64.php", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/apereo.svg"
            }, 
            {
                "title": "xmind转testlink", 
                "description": "在线xmind转testlink", 
                "url": "http://mm.94rg.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/authy.svg"
            }
        ]
    }, 
    {
        "gategoryName": "极致前端", 
        "webUrlBeanList": [
            {
                "title": "MDN Web 文档", 
                "description": "提供开放网络（Open Web）技术有关的信息，包括用于网站和渐进式网络应用的 HTML、CSS 和 API", 
                "url": "https://developer.mozilla.org/zh-CN/", 
                "icoImage": "https://developer.mozilla.org/static/img/favicon32.7f3da72dcea1.png"
            }, 
            {
                "title": "React", 
                "description": "React官网", 
                "url": "https://reactjs.org/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/gitlab.svg"
            }, 
            {
                "title": "Vue", 
                "description": "Vue 官网", 
                "url": "https://vuejs.org/index.html", 
                "icoImage": "https://ae01.alicdn.com/kf/HTB1Cs_8ef1H3KVjSZFH762KppXau.png"
            }, 
            {
                "title": "Bootstrap", 
                "description": "Bootstrap 官网", 
                "url": "https://getbootstrap.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/espressif.svg"
            }, 
            {
                "title": "jQuery", 
                "description": "jQuery 官网", 
                "url": "https://jquery.com/", 
                "icoImage": "https://jquery.com/jquery-wp-content/themes/jquery.com/i/favicon.ico"
            }, 
            {
                "title": "webpack", 
                "description": "一个模块打包器，打包所有的资源", 
                "url": "https://webpack.js.org/", 
                "icoImage": "	https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/airbnb.svg"
            }, 
            {
                "title": "D3.js", 
                "description": "流行的数据可视化利器", 
                "url": "https://d3js.org/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/go.svg"
            }, 
            {
                "title": "印记中文", 
                "description": "国外前端开发文档中文版镜像", 
                "url": "https://docschina.org/", 
                "icoImage": "https://cdn.docschina.org/favicon.ico"
            }, 
            {
                "title": "AlloyTeam", 
                "description": "腾讯全端AlloyTeam团队，主要是Web", 
                "url": "https://www.alloyteam.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/airbnb.svg"
            }, 
            {
                "title": "Taobao FED", 
                "description": "淘宝前端团队", 
                "url": "https://taobaofed.org/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/bitbucket.svg"
            }, 
            {
                "title": "奇舞团", 
                "description": "奇虎360最大的前端团队", 
                "url": "https://75team.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/google_scholar.svg"
            }, 
            {
                "title": "JDC | 京东设计中心", 
                "description": "关注于电子商务视觉设计、交互设计、用户研究、前端开发", 
                "url": "https://jdc.jd.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/amazon.svg"
            }, 
            {
                "title": "TinyPNG", 
                "description": "PNG/JPG图片在线压缩利器", 
                "url": "https://tinypng.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/delicious.svg"
            }, 
            {
                "title": "Squoosh", 
                "description": "Google开源在线压缩、调整工具，支持WebP", 
                "url": "https://github.com/GoogleChromeLabs/squoosh/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/apereo.svg"
            }, 
            {
                "title": "Go!PNG", 
                "description": "AlloyTeam雪碧图在线生成工具", 
                "url": "https://alloyteam.github.io/gopng/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/digidentity.svg"
            }
        ]
    }, 
    {
        "gategoryName": "智慧后端", 
        "webUrlBeanList": [
            {
                "title": "人工知识库", 
                "description": "专注于程序员最新技术分享，最热技术解读，难点问题剖析。做广大程序员的良师益友", 
                "url": "http://book.94rg.com", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/buffer.svg"
            }, 
            {
                "title": "美团技术团队", 
                "description": "美团技术团队博客", 
                "url": "https://tech.meituan.com/", 
                "icoImage": "https://awps-assets.meituan.net/mit/blog/v20190629/asset/icon/android-icon-192x192.png?v=Whistle&t=20181017-1r"
            }, 
            {
                "title": "腾讯游戏DBA团队", 
                "description": "腾讯dba官方博客，游戏数据库服务，游戏云存储平台，tmysql，tspider，tmysqlparse开发维护", 
                "url": "https://tencentdba.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/qq.svg"
            }, 
            {
                "title": "运维生存时间", 
                "description": "Linux系统教程,运维经验分享", 
                "url": "https://www.ttlsa.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/bitcoin.svg"
            }, 
            {
                "title": "慧心斋", 
                "description": "慧心斋千里之行始于足下", 
                "url": "https://blog.csdn.net/cx308679291", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/badoo.svg"
            }, 
            {
                "title": "辛勤的蜜蜂", 
                "description": "卓帆网古之立大事者，不惟有超世之才，亦必有坚忍不拔之志!", 
                "url": "https://www.cnblogs.com/chen-xing/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/bandcamp.svg"
            }, 
            {
                "title": "燎原星火", 
                "description": "星星之火,可以燎原", 
                "url": "https://my.oschina.net/u/2461283", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/bitbucket.svg"
            }, 
            {
                "title": "java面试指南", 
                "description": "【Java学习+面试指南】 一份涵盖大部分Java程序员所需要掌握的核心知识", 
                "url": "https://snailclimb.top/JavaGuide/#/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/line.svg"
            }
        ]
    }, 
    {
        "gategoryName": "产品设计", 
        "webUrlBeanList": [
            {
                "title": "Material Design", 
                "description": "Material Design 设计官网", 
                "url": "https://material.io/design/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/ebay.svg"
            }, 
            {
                "title": "IconFont", 
                "description": "阿里矢量图标库，且提供矢量图标下载、在线存储、格式转换等功能", 
                "url": "https://www.iconfont.cn/", 
                "icoImage": "https://gtms04.alicdn.com/tps/i4/TB1_oz6GVXXXXaFXpXXJDFnIXXX-64-64.ico"
            }, 
            {
                "title": "Iconfinder", 
                "description": "高质量付费图标下载", 
                "url": "https://www.iconfinder.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/ebay.svg"
            }, 
            {
                "title": "百度脑图", 
                "description": "百度在线脑图工具，使用方便", 
                "url": "https://naotu.baidu.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/authy.svg"
            }
        ]
    }, 
    {
        "gategoryName": "优秀博客", 
        "webUrlBeanList": [
            {
                "title": "木先生", 
                "description": "木先生的个人网站", 
                "url": "https://www.hujiangtao.cn", 
                "icoImage": "https://www.hujiangtao.cn/favicon.png"
            }, 
            {
                "title": "阮一峰", 
                "description": "阮一峰的网络日志", 
                "url": "https://www.ruanyifeng.com/blog/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/acast.svg"
            }, 
            {
                "title": "张鑫旭", 
                "description": "张鑫旭的个人博客，腾讯阅文集团前端", 
                "url": "https://www.zhangxinxu.com/", 
                "icoImage": "https://www.zhangxinxu.com/favicon.ico"
            }, 
            {
                "title": "静觅 - 崔庆才", 
                "description": "崔庆才,静觅,网络,IT,技术,博客,PHP", 
                "url": "https://cuiqingcai.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/access.svg"
            }, 
            {
                "title": "廖雪峰", 
                "description": "研究互联网产品和技术，提供原创中文精品教程，Python、Java基础教程", 
                "url": "https://www.liaoxuefeng.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/airbnb.svg"
            }, 
            {
                "title": "小胡子哥", 
                "description": "阿里小胡子哥李靖", 
                "url": "https://www.barretlee.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/amazon.svg"
            }, 
            {
                "title": "月光博客", 
                "description": "关注互联网和搜索引擎的IT科技博客", 
                "url": "https://www.williamlong.info/", 
                "icoImage": "	https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/backbone.svg"
            }, 
            {
                "title": "战隼的学习探索", 
                "description": "不断探索和研究更加快速、有效的学习方法", 
                "url": "https://www.read.org.cn/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/android.svg"
            }, 
            {
                "title": "【结构之法 算法之道】", 
                "description": "职业专注AI教育，博客专注面试、算法、机器学习", 
                "url": "https://blog.csdn.net/v_JULY_v", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/apereo.svg"
            }, 
            {
                "title": "Bill Gates", 
                "description": "Yes! The blog of Bill Gates", 
                "url": "https://www.gatesnotes.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/apple_music.svg"
            }
        ]
    }, 
    {
        "gategoryName": "在线手册", 
        "webUrlBeanList": [
            {
                "title": "thinkInJava", 
                "description": "thinkInJava", 
                "url": "https://lingcoder.github.io/OnJava8/#/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/disqus.svg"
            }, 
            {
                "title": "Enterprise Architect手册", 
                "description": "Enterprise Architect,EA,可视化建模平台，UML分析工具，EA下载，EA介绍，EA价格,EA购买,EA下载，EA咨询服务", 
                "url": "http://tool.uml.com.cn/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/backbone.svg"
            }, 
            {
                "title": "Git Doc", 
                "description": "Git手册", 
                "url": "https://git-scm.com/doc", 
                "icoImage": "https://git-scm.com/favicon.ico"
            }, 
            {
                "title": "linux命令速查", 
                "description": "Linux命令搜索引擎,最专业的Linux命令大全", 
                "url": "https://chenxing.tech/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/linux.svg"
            }, 
            {
                "title": "java开源文档", 
                "description": "spring、hibernate、mybatis、httpclient、guava", 
                "url": "https://www.kancloud.cn/wizardforcel/java-opensource-doc/112205", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/cloudflare.svg"
            }
        ]
    }, 
    {
        "gategoryName": "实用工具", 
        "webUrlBeanList": [
            {
                "title": "斗图表情包在线制作", 
                "description": "表情包在线制作模板大全 - 斗图表情包在线制作", 
                "url": "https://www.52doutu.cn/maker/1/?order=timedown", 
                "icoImage": "	https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/discord.svg"
            }, 
            {
                "title": "carbon", 
                "description": "Create and share beautiful images of your source code", 
                "url": "https://carbon.now.sh/", 
                "icoImage": "	https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/html5.svg"
            }, 
            {
                "title": "CodeLF", 
                "description": "写代码不知道单词怎么命名就去这里查", 
                "url": "https://unbug.github.io/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/mailchimp.svg"
            }, 
            {
                "title": "在线图库", 
                "description": "好的博客匹配图片的网站", 
                "url": "https://pixabay.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/keybase.svg"
            }
        ]
    }, 
    {
        "gategoryName": "行业动态", 
        "webUrlBeanList": [
            {
                "title": "搜狗微信搜索", 
                "description": "微信公众号，精彩内容独家收录，一搜即达", 
                "url": "https://weixin.sogou.com/", 
                "icoImage": "https://weixin.sogou.com/favicon.ico"
            }, 
            {
                "title": "InfoQ推荐", 
                "description": "InfoQ推荐值得关注的 20 个优秀企业技术博客", 
                "url": "https://www.infoq.cn/article/20-outstanding-enterprise-technology-blog", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.0/images/svg/authy.svg"
            }
        ]
    }, 
    {
        "gategoryName": "私密花园", 
        "webUrlBeanList": [
            {
                "title": "关于本站", 
                "description": "关于本站", 
                "url": "/about", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/flattr.svg"
            }, 
            {
                "title": "百度统计", 
                "description": "欢迎来到百度统计统计/推广/联盟 账号请在此登录", 
                "url": "https://tongji.baidu.com/web/welcome/login", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.1.6/images/svg/baidu.svg"
            }, 
            {
                "title": "paddress", 
                "description": "ip追踪者，为您找到最快的ip直接方案，省去了域名解析的过程", 
                "url": "https://www.ipaddress.com/", 
                "icoImage": "https://cdn.jsdelivr.net/npm/super-tiny-icons@0.2.1/images/svg/opencast.svg"
            }
        ]
    }
],
      inputSearchKey: "",
    };
  },
  filters: {
    ellipsis(value) {
      if (!value) return "";
      if (value.length > 36) {
        return value.slice(0, 36) + "...";
      }
      return value;
    },
  },
  created() {
    this.getPageInfo();
  },
  mounted() {
    document.getElementById('cnzz_box').appendChild(document.getElementById('cnzz_stat_icon_1277196564'));
  },
  methods: {
    getPageInfo: function () {
      // this.axios
      //   .post(
      //     "/rgweb/webapi/getPageInfo",
      //     {},
      //     { emulateJSON: true },
      //     {
      //       headers: { "Content-Type": "application/json;charset=utf-8" },
      //     }
      //   )
      //   .then((reponse) => {
      //     console.log(reponse);
      //     // 将数据赋值给tableData
      //     this.items = reponse.data.data;
      //   });
    },
    baidu() {
      var searchKey = this.inputSearchKey;
      var url =
        "https://www.baidu.com/s?ie=utf-8&f=3&rsv_bp=1&rsv_idx=1&ch=16&tn=78040160_14_pg&wd=" +
        encodeURIComponent(searchKey);
      window.open(url, "_blank");
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import url("../assets/css/index.css");
</style>
