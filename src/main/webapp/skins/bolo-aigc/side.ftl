<div class="sider-content">
    <div class="card widget flex-vertical">
        <div class="header-logo">
            <a href="${servePath}">
                <div class="card-image flex-h align-center">
                    <img src="${staticServePath}/images/logo-long.png"></img>
                </div>
            </a>
        </div>
        <div class="card-content">
            <div id="sideMenu" class="menu">
                <ul class="menu-list">
                    <#list mostUsedCategories as category>
                        <#if category.categoryURI!='special' && category.categoryURI!='special-web'>
                            <li data-desc="${staticServePath}/images/icons/${category.categoryDescription}_line.png" data-uri="${category.categoryURI}" data-title="${category.categoryTitle}">
                                <div class="level is-marginless">
                                    <div class="menu-image"><img src="${staticServePath}/images/icons/${category.categoryDescription}_line.png" /></div>
                                    <span class="level-start">
                                        <span class="level-item">${category.categoryTitle}</span>
                                    </span>
                                </div>
                            </li>
                        </#if>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
</div>