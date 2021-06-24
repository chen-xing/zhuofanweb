<template>
  <div>
    <el-row>
      <el-button type="primary" @click="choiceImg">
        上传
        <i class="el-icon-upload el-icon--right"></i>
      </el-button>
      <!-- <input
        type="file"
        ref="filElem"
        accept="image/*"
        multiple
        style="display:block;"
        @change="getFile"
      /> -->
    </el-row>
    <div class="preview">
      <hr />
    </div>
  </div>
</template>
<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  methods: {
    choiceImg () {
      this.axios.get('http://ttapi.tsign.cn/openwebserver/login?context=fwMLUpiW%2Bueocu37V4gAyUoIt6c6noQzmI6%2BrrjNxEiD4%2BkkB9KLCSeOfh%2FWoMcku2rN1V%2Fn6yh2C0SNEAde6Fos7XPnZxdTug8CkwSMxjFvG9bu321SI3sHEIoDwMIi278rqxVD8gIBPfO9a2N52KUNm66%2BWB0hSvrz3NgUwkskWxuA2KtHcTnGA9Y4D4%2FmzF8mg8vum4KBEL9VMZv24iDyG40f1WoAq4kbwYUF6Z4wIyKrsiEMoS%2BnvUPnCaRKlosAr6VKXVxGGxjTJ5tOtcYR3m2GJDVSuP%2Fyup5caL5FLcfXmj1nOCOs5wjknE9Dbuf9UHKhENF7X7sJ%2BAIxp99xK%2F8eACHEJAVrWILVPKibWY0DQ4e4s25qs74AxaDn8FtTBGAXbwxwtj0q3EIdDEMKNWMhuUKJtRHiHCAmBqu5%2F0Nkvfpn4OjlwyQztpPl8HJSQv30HrhKfNVTcltGQb0VxQVwvDgIKwn2MySG7zH9mqm3lusiX2dQ5%2Bg2%2FZsD6Oo1kuxUYTb0Rp96Wd%2BDJUyeJh%2BOqIKRYcRxLXv4XLayD3Gmr2nGHQg2ZxFyvRO3TbgFcdSOZhNLRESIe%2BrWb92wyJA5K9zC0wUk18IgAzObky5PkhKwxK8%2BtgZKrUswqjSATyZ3s24zPL71DoTv01NKFifAJ%2FITe5d%2F2FkczN7xpha2yn792XSOiZHmCYg5NMsp2T7zoPdxL73QnZY9M9Dprh8MgCi8IimwbKqgj2o%3D&t=1568171134781&webserver-version=v2').then((response) => {
        alert(response)
        console.log(response)
      })
    }
  }
}
</script>

<style scoped>
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
    "Helvetica Neue", Arial, "sans-serif";
  background: url(https://api.uomg.com/api/image.lofter?format=images);
  background-size: cover;
}

@font-face {
  font-family: "webfont_2";
  src: url("//at.alicdn.com/t/webfont_bar76uyhrpd.eot"); /* IE9*/
  src: url("//at.alicdn.com/t/webfont_bar76uyhrpd.eot?#iefix")
      format("embedded-opentype"),
    /* IE6-IE8 */ url("//at.alicdn.com/t/webfont_bar76uyhrpd.woff")
      format("woff"),
    /* chrome、firefox */ url("//at.alicdn.com/t/webfont_bar76uyhrpd.ttf")
      format("truetype"),
    /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
      url("//at.alicdn.com/t/webfont_bar76uyhrpd.svg#思源黑体-极细")
      format("svg"); /* iOS 4.1- */
}

.text-center {
  text-align: center;
}

.text-white {
  color: #fff;
}

.header,
.footer {
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
  background-color: rgba(255, 255, 255, 0.3);
}

.jumbotron input[type="file"] {
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
  background-color: rgba(255, 255, 255, 0.3);
}
</style>
