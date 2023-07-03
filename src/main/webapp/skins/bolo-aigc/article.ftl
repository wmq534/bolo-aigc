<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">

<!DOCTYPE html>
    <html>
        <head>
            <@head title="${article.articleTitle} - ${blogTitle}"
                description="${article.articleAbstract?html}">
                <link rel="stylesheet" href="${staticServePath}/js/lib/bulma.min.css" />
                <link rel="stylesheet" href="https://ftp.stackoverflow.wiki/bolo/fantastic/css/all.min.css">
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}" />
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/style.css?${staticResourceVersion}" />
                     <link rel="stylesheet" href="${staticServePath}/js/lib/swiper.min.css">
                <link rel="stylesheet" href="${staticServePath}/skins/${skinDirName}/css/detail.css?${staticResourceVersion}" />
        <script src='${staticServePath}/js/lib/swiper.min.js'></script>
            </@head>
        </head>
            <body>
                <script>
                    var loggedIn = ${article.logged};
                </script>

                <div class="detail-container">
                    <div class="sider-left">
                        <#include "side.ftl">
                    </div>
                    <div class="main-container">
                        <div class="main-top">
                            <#include "header.ftl">
                        </div>
                        <div class="main-content">
                            <div class="main-content-header flex-h">
                                <#if article.articleCategory!='special'>
                                    <div class="card-wrap-img">
                                        <img id="articleLogo" src="${article.articleAbstractText}" ></img>
                                    </div>
                                </#if>
                                <div class="flex-v">
                                    <#if article.articleCategory!='special'>
                                        <div class="level-left">
                                                <div class="level-item has-text-grey">
                                                    ${article.articleCategory}
                                                </div>
                                            </div>
                                    </#if>
                                    <h1 class="title is-size-3 is-size-4-mobile has-text-weight-normal">
                                        ${article.articleTitle}
                                    </h1>
                                    <#if article.articleTags!='special'>
                                        <div id="jumpBtn" class="content post-article" data-target-url="${article.articleImg1URL}">
                                            <span>项目官网</span>
                                            <svg xmlns="https://codegeex.cn" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right">
                                                <polyline points="6 17 12 12 6 7"/>
                                            </svg>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div id="articleContent" class="content post-article">
                                ${article.articleContent}
                            </div>
                            <div class="comment-contianer">
                                <#if interactive == "on">
                                    <div class="card">
                                        <div class="card-content">
                                            <h3 class="title is-5 has-text-weight-normal">评论</h3>
                                            <@comments commentList=articleComments article=article
                                                count=article.articleCommentCount>
                                            </@comments>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                            <a id="back-to-top" title="返回顶部" href="javascript:"><i class="fas fa-chevron-up"></i></a>
                            <@comment_script oId=article.oId commentable=article.commentable>
                                <#if 0 !=randomArticlesDisplayCount>
                                    page.loadRandomArticles('<h3>${randomArticlesLabel}</h3>');
                                </#if>
                                <#if 0 !=relevantArticlesDisplayCount>
                                    page.loadRelevantArticles('${article.oId}', '<h3>${relevantArticlesLabel}</h3>');
                                </#if>
                                Skin.initArticle()
                            </@comment_script>
                        </div>

                        <div class="main-footer">
                            <#include "footer.ftl">
                        </div>
                    </div>
                </div>
            <script>
                // 延时检测右侧 “相关阅读” 是否为空，如果空则删除空 div，好看些
                $(function () {
                    var tempHtml =
                        '<a rel="nofollow" href="javascript:void(0)"><i class="fas fa-search fa-spin"></i> 努力寻找中 ...</a>';
                    $('#rArticles').append(tempHtml);
                    setTimeout(function () {
                        var judgeEmptyShowing = $('#rArticles').html();
                        judgeEmptyShowing = judgeEmptyShowing.replace(tempHtml, '');
                        $('#rArticles').html(judgeEmptyShowing);
                        judgeEmptyShowing = judgeEmptyShowing.replace(/[\r\n]/g,
                        "");
                        judgeEmptyShowing = judgeEmptyShowing.replace(new RegExp(
                            /( )/g), "");
                        if (judgeEmptyShowing === '') {
                            $('#rArticles').html(
                                '<a href="javascript:void(0)"><i class="fa fa-battery-empty"></i> 什么都没找到</a>'
                            );
                            setTimeout(function () {
                                $('#r2').fadeOut(1000);
                            }, 1000)
                        }
                    }, 3000)
                })
            </script>
            <script src='${servePath}/skins/${skinDirName}/js/events.js'></script>
        </body>
    </html>
