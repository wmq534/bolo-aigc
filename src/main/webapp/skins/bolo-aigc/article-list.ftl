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
<#-- Bolo - A stable and beautiful blogging system based in Solo. Copyright (c) 2020, https://github.com/adlered This
    program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public
    License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later
    version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
    implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
    for more details. You should have received a copy of the GNU Affero General Public License along with this program.
    If not, see <https://www.gnu.org/licenses/>. -->
    <div class="article-list" style="height: 100vh; overflow: scroll;">
        <div class="article-origin-list" style="display: none;">
            <#list articles as article>
                <span
                    class="article-cell"
                    style="display: none;"
                    data-articleTitle="${article.articleTitle!}"
                    data-articlePermalink="${servePath}${article.articlePermalink}"
                    data-articleImg1URL="${article.articleImg1URL}"
                    data-articleCreateDate="${article.articleCreateDate?string("yyyy年MM月dd日")}"
                    <#if article.categoryURI??>
                        data-categoryURI="${article.categoryURI}"
                        data-articleCategory="${article.articleCategory}"
                    </#if>

                    <#if article.articleAbstractText!?length gt 24>
                        data-articleAbstractText="${article.articleAbstractText!?substring(0, 24)} ......"
                    <#else>
                        data-articleAbstractText="${article.articleAbstractText}"
                    </#if>
                    data-articlePermalink="${servePath}${article.articlePermalink}"
                ></span>
                <#if article.articlePutTop>
                    <div class="level">
                        <div class="blog-slider card">
                            <div class="blog-slider__wrp swiper-wrapper">
                                <div class="blog-slider__item swiper-slide">
                                    <div class="blog-slider__img">
                                        <a href="${servePath}${article.articlePermalink}">
                                            <img src="${article.articleImg1URL}" alt="${article.articleTitle!}"
                                                referrerpolicy="origin">
                                        </a>
                                    </div>
                                    <div class="blog-slider__content">
                                        <div>
                                            <span class="blog-slider__code"
                                                style="display:inline-block">${article.articleCreateDate?string("yyyy年MM月dd日")}</span>
                                            <#if article.categoryURI??>
                                                <span><a class="has-link-black-ter"
                                                        href="${servePath}/category/${article.categoryURI}">${article.articleCategory}</a></span>
                                            </#if>
                                        </div>
                                        <div class="blog-slider__title "><a class="title is-5"
                                                href="${servePath}${article.articlePermalink}">${article.articleTitle!}</a>
                                        </div>
                                        <div class="blog-slider__text" content="">
                                            <#if article.articleAbstractText!?length gt 24>
                                                ${article.articleAbstractText!?substring(0, 24)} ......<#else>
                                                    ${article.articleAbstractText!}</#if>
                                        </div>
                                        <a href="${servePath}${article.articlePermalink}"
                                            class="blog-slider__button">阅读更多</a>
                                    </div>
                                </div>

                            </div>
                            <div class="blog-slider__pagination"></div>
                        </div>
                    </div>
                <#else>
                        <div class="card">
                            <div class="card-image">
                                <a href="${servePath}${article.articlePermalink}">
                                    <img class="thumbnail" src="${article.articleImg1URL}" alt="${article.articleTitle!}"
                                        referrerpolicy="origin">
                                </a>
                            </div>
                            <div class="card-content article " id="card-content" style="width: 100%">
                                <div class="level article-meta is-size-7 is-uppercase is-mobile is-overflow-x-auto">
                                    <div class="level-left">
                                        <time
                                            class="level-item has-text-grey">${article.articleCreateDate?string("yyyy年MM月dd日")}</time>
                                        <#if article.articleCategory != "">
                                            <a class="has-link-black-ter"
                                                href="${servePath}/category/${article.categoryURI}">${article.articleCategory}</a>
                                        </#if>
                                    </div>
                                </div>
                                <h1 class="title is-size-5 is-size-5-mobile has-text-weight-normal">

                                    <a class="has-link-black-ter"
                                        href="${servePath}${article.articlePermalink}">${article.articleTitle!}</a>

                                </h1>
                                <div id="is-hidden-touch" class="content is-hidden-touch">
                                    <#if article.articleAbstractText!?length gt 128>
                                        ${article.articleAbstractText!?substring(0, 128)} ......<#else>
                                            ${article.articleAbstractText!}</#if>
                                    <#-- ${article.articleAbstractText!?substring(0, 128)} ...... -->
                                </div>

                                <div class="level is-mobile">
                                    <div class="level-start">
                                        <div class="level-item">
                                            <a class="button is-size-7 is-light"
                                                href="${servePath}${article.articlePermalink}">阅读更多</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                </#if>
            </#list>
        </div>

        <div class="article-render-list"></div>
        <#include "footer.ftl">
    </div>