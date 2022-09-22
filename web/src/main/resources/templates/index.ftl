<#include "include/macros.ftl">
<@compress single_line=false>
    <@header title="程序员导航网|主人翁个人笔记"
    keywords="程序员之家,程序员首页,程序员门户网站,程序员网址导航,网址导航,程序员门户,coder,coder's home,coderhome,coder home,coders' home"
    description="程序员导航网，便于程序员日常使用的网址集合，你想要的都在这里☺。">
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

                                <div class="card mb-3 mycardDiv" onclick="gourl('${webUrlBean.url}')">
                                    <div class="row g-0 mycard">
                                        <div class="col-md-4 myImg">
                                            <img src="${webUrlBean.icoImage}"
                                                 class="img-fluid rounded-start " alt="...">
                                        </div>
                                        <div class="col-md-10 mycontent">
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
    <@footer></@footer>
</@compress>