<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <router-view />
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  height: 100%;
}
body {
  margin: 0;
}
.el-scrollbar__wrap {
  overflow: hidden;
}
html,
body {
  height: 100%;
}

         ::-webkit-scrollbar{
               width:6px;
         }

         ::-webkit-scrollbar-thumb{
                border-radius:10px;
                background:#0398af;
         }

         ::-webkit-scrollbar-track{
                border-radius:10px;
                height:100px;
                background:#064094;
        }
</style>
