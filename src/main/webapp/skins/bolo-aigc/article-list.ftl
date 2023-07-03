<div class="article-list">
    <div class="article-origin-list" style="display: none;">
        <#list articles as article>
            <span
                class="article-cell"
                style="display: none;"
                data-articleTitle="${article.articleTitle!}"
                data-articlePermalink="${servePath}${article.articlePermalink}"
                data-articleImg1URL="${article.articleImg1URL}"
                data-articleCreateDate="${article.articleCreateDate?string("yyyy年MM月dd日")}"
                data-oid="${article.oId}"
                data-articleAbstractText="${article.articleAbstractText}"
                data-articleAbstract="${article.articleAbstract}"
                data-articlePermalink="${servePath}${article.articlePermalink}"
                <#if article.categoryURI??>
                    data-categoryURI="${article.categoryURI}"
                    data-articleCategory="${article.articleCategory}"
                </#if>
            ></span>
        </#list>
    </div>
    <div class="article-render-list"></div>
</div>