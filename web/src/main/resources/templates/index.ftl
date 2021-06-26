<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="程序员导航网"
    keywords="导航网，json在线格式化，图床，格式转化，base64在线编码"
    description="导航网，json在线格式化，图床，格式转化，base64在线编码">
    </@header>

    <div class="container-fluid">
        <div class="row">
            <nav id="sidebarMenu" class="col-md-2 col-lg-2 d-md-block sidebar collapse fixed-top">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column custom-ul">
                        <#list pageInfo as indexPageUrlInfoBean>
                            <li class="nav-item ${(indexPageUrlInfoBean_index == 0)?string('active','')}">
                                <a class="nav-link" aria-current="page"
                                   href='#${indexPageUrlInfoBean.gategoryName}'>
                                    <span data-feather="home"></span>
                                    ${indexPageUrlInfoBean.gategoryName}
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </nav>

            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <#list pageInfo as indexPageUrlInfoBean>
                    <div class="card  mb-3 indexboxs" id="${indexPageUrlInfoBean.gategoryName}">
                        <div class="card-header indexbox_title">${indexPageUrlInfoBean.gategoryName}</div>
                        <div class="card-body indexbox_body">

                            <#list indexPageUrlInfoBean.webUrlBeanList as webUrlBean>

                                <div class="card mb-3 mycardDiv">
                                    <div class="row g-0 mycard">
                                        <div class="col-md-4 myImg">
                                            <img src="${webUrlBean.icoImage}"
                                                 class="img-fluid rounded-start " alt="...">
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body">
                                                <h5 class="card-title myfontsize_14_bold">${webUrlBean.title}</h5>
                                                <p class="card-text text-truncate myfontsize_12_normal">
                                                    ${webUrlBean.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </#list>

                        </div>
                    </div>
                </#list>
            </main>
        </div>
    </div>

    <a href="#top" class="el-backtop" style="right: 50px; bottom: 70px;"><i class="fa fa-arrow-up fa-lg" aria-hidden="true"></i></a>
    <@footer></@footer>
</@compress>