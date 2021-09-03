<nav class="navbar navbar-expand-lg navbar-dark bg-dark " id="top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="/static/image/logo.jpg" alt="" width="102"
                 height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item ">
                    <a class="nav-link active" aria-current="page" href="/">home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/json">json格式化</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/figurebed" tabindex="-1" aria-disabled="true">免费图床</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/search?keyword=人工博客" tabindex="-1" aria-disabled="true">搜索</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://md.94rg.com/" tabindex="-1" aria-disabled="true">md美化</a>
                </li>
            </ul>
            <form class="d-flex">
                <input id="searchKeyWorld" class="form-control me-2" type="search" placeholder="Search"
                       aria-label="Search" style="width:600px;height:40px;line-height: 40px;"
                       onkeydown="clientClickButton(event)">
                <button class="btn btn-primary" type="button" onclick="search();">Search</button>
            </form>
        </div>
    </div>
    <a href="#top" class="el-backtop" style="right: 20px; bottom: 60px;"><i class="fa fa-arrow-up fa"
                                                                            aria-hidden="true"></i></a>
</nav>