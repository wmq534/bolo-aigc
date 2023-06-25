<nav class="navbar navbar-main">
    <div class="container header-container">
        <div class="navbar-brand transparent flex-h align-center">
            <div class="nav-logo flex-h just-center align-center">
                <img class="nvabar-logo" src="${staticServePath}/images/logo.png"></img>
            </div>
            <div id="aigcAllCategoryTab" class="nav-item visible-xs-inline-block ">
                <span>AI俱乐部</span>
                <div id="aigcAllCategoryDropdown" class="dropdown">
                    <ul class="menu-list">
                        <#list mostUsedCategories as category>
                            <#if category.categoryURI!='special'>
                                <li data-desc="${category.categoryDescription}" data-uri="${category.categoryURI}" data-title="${category.categoryTitle}">
                                    <div class="level is-marginless">
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
            <span class="nav-item hidden-xs"><a href="${servePath}/about-us.html">关于我们</a></span>
        </div>
    </div>
</nav>


