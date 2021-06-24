<template>
<div>
  <ul class="infinite-list" v-infinite-scroll="load" style="overflow:auto">
    <li v-for="(item,index) in newsList">
      li><a target="_blank" href="item.url">
item.title</a><span>item.gmtCreat</span></li>
    </li>
  </ul>
  <div id="loadMore" v-show="droping">加载中</div>
<div id="loadMore" v-show="noMore">没有更多的数据</div>
</div>
</template>
<script>
export default {
  data() {
    return {
      busy:false,
     newsList: [],
     moreList : [],
     i : 0,
     droping : false,
     noMore : false
    };
  },
  methods: {
    load() {
      var _vm = this;
        this.busy = true;
        this.droping = true;
        this.dropDown = false;
        _vm.i += 1;
          var data = {
            "pageNo": _vm.i,
            "pageSize": 10,
          };
           this.axios
        .post(
          "/rgweb/webapi/getItNews",
          {},
          { emulateJSON: true },
          {
            headers: { "Content-Type": "application/json;charset=utf-8" }}).then(function(response) {
            _vm.moreList = response.data.data.itNewsBeanList;
            if(_vm.moreList.length == 0){
              _vm.noMore = true;
              _vm.droping = false;
              _vm.busy = true;
            }else{
              _vm.droping = true;
              _vm.noMore = false;
              _vm.moreList.forEach(function(item){
                _vm.newsList.push(item);
              })
            }
          }).catch(function(error) {
            console.info(error)
          });
          this.busy = false;
      }
    }
};
</script>
