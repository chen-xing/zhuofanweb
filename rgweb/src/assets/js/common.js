function isJSON(str) {
  if (typeof str == "string") {
    try {
      var obj = JSON.parse(str);
      if (typeof obj == "object" && obj) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      console.log("error：" + str + "!!!" + e);
      return false;
    }
  }
  console.log("It is not a string!");
}
export {  //添加export抛出模块
    isJSON
}