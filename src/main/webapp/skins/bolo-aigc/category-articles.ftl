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
<#-- Solo - A small and beautiful blogging system written in Java. Copyright (c) 2010-present, b3log.org This program is
    free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
    details. You should have received a copy of the GNU Affero General Public License along with this program. If not,
    see <https://www.gnu.org/licenses/>. -->
<#include "../../common-template/macro-common_head.ftl">

<!DOCTYPE html>
<html>

<head>
    <@head title="${category.categoryTitle} - ${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/js/lib/bulma.min.css"/>
        <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fantastic/css/all.min.css">
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/js/lib/swiper.min.css">
        <script src='${staticServePath}/js/lib/swiper.min.js'></script>
    </@head>
</head>

<body class="is-3-column">
<div class="root-container category-articles-container">
    <div class="sider-left">
        <#include "side.ftl">
    </div>
    <div class="main-container">
        <div class="main-top">
            <#include "header.ftl">
        </div>
        <div class="main-content">
            <#include "article-list.ftl">
        </div>
        <div class="main-footer">
            <#include "footer.ftl">
        </div>
    </div>
</div>

<div class="card-normal">
    <section class="section">
        <div class="container">
            <div class="columns">

                <div class="column is-8-tablet is-8-desktop is-9-widescreen is-9-fullhd has-order-2 column-main"
                     style="margin-left: 10px">
                    <div class="columns">
                        <div class="column is-12-tablet is-12-desktop is-12-widescreen has-order-2 column-main">
                            <#include "article-list.ftl">
                        </div>
                    </div>
                </div>
                <#include "side.ftl">
            </div>

        </div>
    </section>
</div>
<a id="back-to-top" title="返回顶部" href="javascript:"><i class="fas fa-chevron-up"></i></a>
<#include "footer.ftl">
<script src='${servePath}/skins/${skinDirName}/js/events.js'></script>
</body>

</html>
