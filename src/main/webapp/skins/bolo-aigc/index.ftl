<#include "../../common-template/macro-common_head.ftl">

<!DOCTYPE html>
<html>

<head>
    <@head title="${blogTitle}">
        <link rel="stylesheet" href="${staticServePath}/js/lib/bulma.min.css"/>
        <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fantastic/css/all.min.css">
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <link rel="stylesheet"
              href="${staticServePath}/skins/${skinDirName}/css/index.css?${staticResourceVersion}"/>
        <link rel="stylesheet" href="${staticServePath}/js/lib/swiper.min.css">
        <script src='${staticServePath}/js/lib/swiper.min.js'></script>
        <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.2.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="icon" href="${staticServePath}/images/favicon.png">
    </@head>
</head>

<body>
    <div class="root-container home-container">
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
    <script src='${servePath}/skins/${skinDirName}/js/events.js'></script>
</body>

</html>
