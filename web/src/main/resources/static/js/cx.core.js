function search() {
    var searchKey = $("#searchKeyWorld").val();
    if (null == searchKey || '' == searchKey) {
        return false;
    }
    var url =
        "https://www.baidu.com/s?ie=utf-8&f=3&rsv_bp=1&rsv_idx=1&ch=16&tn=78040160_14_pg&wd=" +
        encodeURIComponent(searchKey);
    window.open(url, "_blank");
}

$(function () {
    $("#sidebarMenu").find("li").bind("click", function () {
        $this = $(this);
        $this.siblings().removeClass("active");
        $this.addClass("active");
    })
});

function gourl(url) {
    window.open(url, "_blank");
}

function clientClickButton(event) {
    if (event.keyCode == 13) {
        search();
        event.returnValue = false;
    }
}
