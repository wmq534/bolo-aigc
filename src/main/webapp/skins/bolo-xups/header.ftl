<#--

    Bolo - A stable and beautiful blogging system based in Solo.
    Copyright (c) 2020, https://github.com/adlered

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<!-- 博客头部 -->
<body class="home">
<header class="header">
    <section class="container header-main">
        <div class="logo">
            <a href="${servePath}/">
                <div class="cover">
                    <span class="name">${blogTitle}</span>
                    <span class="description">${blogSubtitle}</span>
                </div>
            </a>
        </div>
        <div class="dropnav icon-paragraph-justify" id="JELON__btnDropNav"></div>
        <ul class="menu hidden" id="JELON__menu">
            <li class="item current">
                <a href="${servePath}/" title="首页" class="fa fa-home">&nbsp;首页</a>
            </li>
        </ul>
        <div class="profile clearfix">
            <div class="feeds fl">
                <p class="links">
                    <#if isLoggedIn>
                        <a href="${servePath}/admin-index.do#main">${adminLabel}</a>
                        |
                        <a href="${logoutURL}">${logoutLabel}</a>
                    <#else>
                        <a href="${servePath}/start">${startToUseLabel}</a>
                    </#if>
                </p>
                <p class="sns">
                    <a href="http://weibo.com/jangdelong" class="sinaweibo" target="_blank"><b>■</b> 新浪微博</a>
                    <a href="https://juejin.im/user/3984285869282919" class="qqweibo" target="_blank"><b>■</b> 掘金</a>
                    <a href="javascript: void(0);" class="wechat">
                        <b>■</b>
                        公众号
                        <span class="popover">
                            <img src="/img/wechat_mp.jpg" width="120" height="120" alt="我的微信订阅号">
                            <i class="arrow"></i>
                        </span>
                    </a>
                </p>
            </div>
            <div class="avatar fr">
                <img src="${adminUser.userAvatar}" alt="avatar" title="Jelon" >
            </div>
        </div>
    </section>
</header>