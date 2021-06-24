<template>
  <div>
    <el-row>
      <el-col :span="24">
        <div class="grid-content bg-purple" style="float:right;margin:20px">
          <el-select
            v-model="value"
            placeholder="展开层级"
            @change="currentSel"
          >
            <el-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
          <el-button type="primary" @click.native="formatJson()"
            >格式化</el-button
          >
        </div></el-col
      >
    </el-row>
    <el-row>
      <el-col :span="12">
        <div class="grid-content bg-purple" style="margin: 20px">
          <el-input
            :rows="30"
            type="textarea"
            placeholder="请输入待格式化内容"
            v-model="textareaOld"
          >
          </el-input></div
      ></el-col>
      <el-col :span="12"
        ><div style="margin:20px;">
          <json-viewer
            :value="textareaNew"
            :expand-depth="expandDepth"
            copyable
            boxed
            sort
            expanded
          ></json-viewer></div
      ></el-col>
    </el-row>
  </div>
</template>

<script>
import { isJSON } from "../assets/js/common.js"; //可以选择需要的方法引入
import JsonViewer from "vue-json-viewer";
import "vue-json-viewer/style.css";
export default {
  // 注册组件
  components: {
    JsonViewer
  },
  data() {
    return {
      expandDepth: 3,
      textareaOld: "",
      textareaNew: {},
      options: [
        {
          value: "2",
          label: "2级"
        },
        {
          value: "3",
          label: "3级"
        },
        {
          value: "4",
          label: "4级"
        },
        {
          value: "5",
          label: "5级"
        },
        {
          value: "7",
          label: "7级"
        },
        {
          value: "8",
          label: "8级"
        }
      ],
      value: ""
    };
  },
  methods: {
    formatJson() {
      var str = this.textareaOld;
      var isJson = isJSON(str);
      if (!isJson) {
        alert("不是有效的json");
        return false;
      }
      this.textareaNew = JSON.parse(str);
    },
    currentSel(selVal) {
      this.expandDepth = parseInt(selVal);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
