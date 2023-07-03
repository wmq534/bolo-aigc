<!DOCTYPE html>
<html>

<head>
    <@head title="${linkLabel} - ${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/js/lib/bulma.min.css"/>
        <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fantastic/css/all.min.css">
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/js/lib/swiper.min.css">
        <script src='${staticServePath}/js/lib/swiper.min.js'></script>
    </@head>
    <style>
        .link-body {
            position: relative;
            margin: 10px auto;
            padding: 0;
            border: 0;
            font-size: 100%;
            font-style: inherit;
            font-weight: inherit;
            outline: 0;
            vertical-align: baseline;
            display: flex;
            flex-direction: row;
        }

        .link-avatar {
            display: block;
            -o-object-fit: cover;
            object-fit: cover;
            border-radius: 100%;
            width: 68px;
            height: 68px;
            margin-right: 20px;
            cursor: pointer;
            -webkit-transition: all .8s;
            transition: all .8s
        }

        .link-avatar:hover {
            -webkit-transform: rotate(1turn);
            transform: rotate(1turn)
        }

        .link-contain-main {
            margin-left: 58px;
            border: 0;
            font-size: 100%;
            font-style: inherit;
            font-weight: inherit;
            margin: 0;
            outline: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            vertical-align: baseline;
        }
    </style>

    <#-- <#include "style.theme.ftl"> -->
</head>

<body class="is-3-column">
<#include "header.ftl">
<div class="card-normal">
    <section class="section">
        <div class="container">
            <div class="columns">

                <div class="column is-8-tablet is-8-desktop is-9-widescreen is-9-fullhd has-order-2 column-main"
                     style="margin-left: 10px">
                    <div class="columns">
                        <div
                                class="column is-12-tablet is-12-desktop is-12-widescreen has-order-2 column-main">
                            <div class="level">
                                <div class="columns" style="width:100%">
                                    <div
                                            class="column is-12-tablet is-12-desktop is-8-widescreen is-8-fullhd has-order-2 column-main">
                                        <div class="card widget">
                                            <div class="card-content">
                                                <h3 class="menu-label">
                                                    ${linkLabel}
                                                </h3>

                                                <div>
                                                    <#list links as link>
                                                        <div class="link-body">
                                                            <div class="link-avatar-div">
                                                                <a href="" rel="nofollow"
                                                                   target="_blank">
                                                                    <img alt="${link.linkDescription}"
                                                                         src="${link.linkIcon}"
                                                                         class="link-avatar">
                                                                </a>
                                                            </div>
                                                            <div class="link-contain-main">
                                                                <div class="link-meta">
                                                                    <div itemprop="author"
                                                                         class="link-author">
                                                                        <a href="${link.linkAddress}"
                                                                           rel="nofollow"
                                                                           target="_blank"
                                                                           title="${link.linkTitle}"
                                                                           class="author-name">${link.linkTitle}</a>
                                                                    </div>

                                                                </div>
                                                                <div itemprop="description"
                                                                     class="link-content">
                                                                    ${link.linkDescription}
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </#list>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div
                                            class="column is-4-tablet is-4-desktop  is-hidden-touch is-hidden-desktop-only is-4-widescreen is-4-fullhd   has-order-3 column-right <%= sticky_class(position) %>">
                                        <#include "side-right.ftl">


                                    </div>
                                </div>
                            </div>
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
</body>

</html>
