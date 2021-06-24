<template>
  <div class="layout">
    <a-layout id="components-layout-demo-fixed-sider">
      <div style="float: left">
        <a-layout-sider collapsible :style="{ width: '250px' }">
          <div class="logo">
            <img
              src="https://www.chenzhuofan.top/images/logo.png"
              style="width: 250px"
            />
          </div>
          <ul>
            <li
              class="main111"
              v-for="item in items"
              style="
                width: 200px;
                font-size: 18px;
                color: #fff;
                padding-top: 40px;
                border-bottom: 1px solid #313437;
              "
            >
              <a :href="'#' + item.gategoryName"
                ><i class="el-icon-star-on">{{ item.gategoryName }}</i></a
              >
            </li>
          </ul>
        </a-layout-sider>
      </div>
      <div style="float: left">
        <a-layout :style="{}">
          <a-layout-header :style="{}">
            <el-input
              v-model="inputSearchKey"
              placeholder="请输入内容"
              style="width: 600px"
            ></el-input>
            <el-button type="primary" round @click="baidu">百度一下</el-button>
          </a-layout-header>

          <a-layout-content :style="{ padding: '0 50px', marginTop: '64px' }">
            <div
              :style="{
                position: 'relative',
                background: '#fff',
                padding: '24px',
                minHeight: '380px',
              }"
            >
              <div class="main111" v-for="item in items">
                <div
                  style="float:left;height:40px;width:100%;padding: 0px;border-left: 5px solid #0084ff; background-color: #FFFFFF;z-index=99"
                >
                  <i
                    :id="item.gategoryName"
                    class="el-icon-edit"
                    style="float: left; margin-left: 10px; font-size: 20px"
                    >{{ item.gategoryName }}</i
                  >
                </div>
                <div
                  v-for="content in item.webUrlBeanList"
                  style="
                    width: 400px;
                    height: 120px;
                    float: left;
                    padding: 20px;
                  "
                >
                  <el-card :body-style="{ padding: '0px', width: '100px' }">
                    <a :href="content.url" target="_blank">
                      <div
                        style="
                          float: left;
                          padding: 20px;
                          display: inline;
                          width: 400px;
                        "
                      >
                        <div style="float: left; width: 50px">
                          <img :src="content.icoImage" class="image" />
                        </div>
                        <div
                          style="float: left; width: 200px; margin-left: 15px"
                        >
                          <span>{{ content.title }}</span>
                          <div class="bottom clearfix">
                            <time class="time">{{ content.description }}</time>
                            <!-- <el-link type="primary">{{content.url}}</el-link> -->
                          </div>
                        </div>
                        <div style="clear: both"></div>
                      </div>
                    </a>
                  </el-card>
                </div>
              </div>
            </div>
          </a-layout-content>
          <a-layout-footer :style="{ textAlign: 'center' }">
            Ant Design ©2018 Created by Ant UED
          </a-layout-footer>
        </a-layout>
      </div>
    </a-layout>
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      items: [],
      inputSearchKey: "",
    };
  },
  created() {
    this.getPageInfo();
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    getPageInfo: function () {
      this.axios
        .post(
          "https://www.chenzhuofan.top/webapi/getPageInfo",
          {},
          { emulateJSON: true },
          {
            headers: { "Content-Type": "application/json;charset=utf-8" },
          }
        )
        .then((reponse) => {
          console.log(reponse);
          // 将数据赋值给tableData
          this.items = reponse.data.data;
        });
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
#components-layout-demo-fixed-sider {
  background: rgba(255, 255, 255, 0.2);
}
.logo {
  width: 250px;
}
.layout {
  border: 1px solid #d7dde4;
  background: #f5f7f9;
  position: relative;
  border-radius: 4px;
  overflow: hidden;
}
.layout-logo {
  width: 100px;
  height: 30px;
  background: #5b6270;
  border-radius: 3px;
  float: left;
  position: relative;
  top: 15px;
  left: 20px;
}
.layout-nav {
  width: 420px;
  margin: 0 auto;
  margin-right: 20px;
}
</style>