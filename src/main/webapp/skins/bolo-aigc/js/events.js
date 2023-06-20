$(document).ready(function() {
    const menuList = $('.menu-list li');
    console.log('ready', menuList);
    menuList.on('click', (evt) => {// 为左侧导航添加事件
        const type = evt?.currentTarget.dataset.uri;
        location.href = `${location.origin}/bolo#article-module-${type}`;
    });

    // 获取路由
    const baseUrl = '/bolo';
    const pathname = location.pathname;
    if (pathname === baseUrl) { // 首页, 重新渲染
        const menuSortList = [];
        const menuSortMap = {};
        $.each(menuList, function(idx, item) {
            if (item.dataset.uri) {
                menuSortList.push({ type: item.dataset.uri, title: item.dataset.title, desc: item.dataset.desc });
            }
        })
    
        const articleCells = $('.article-list .article-origin-list .article-cell');
        console.log('article-cell', articleCells);
        $.each(articleCells, function(idx, item) {
            const categoryUri = item?.dataset?.categoryuri;
            if (categoryUri) {
                if (!menuSortMap[categoryUri]) {
                    menuSortMap[categoryUri] = [];
                }
                menuSortMap[categoryUri].push({ ...item.dataset });
            }
        })
        console.log('article map', menuSortMap);
    
        const html = createModule(menuSortList, menuSortMap);
        const renderList = $('.article-list .article-render-list')[0];
        renderList.innerHTML = html;
        console.log('html', renderList);
        
    
        function createModule(list, map) {
            return list.map(item => {
                const { type, title } = item;
                const cells = map[type];
                return `
                    <div class="module" data-type="${type}" style="display: block;" id="article-module-${type}">
                        <div class="module-title"><img src="${item.desc}"><span>${item.title}</span></img></div>
                        <div class="module-cards-content container">${cells ? cells.map(createCell).join('') : ''}</div>
                    </div>
                `
            }).join('');
        }
    
        function createCell (article) {
            console.log('cell', article);
            const category = article.articlecategory ? `<a class="has-link-black-ter" href="${article.categoryuri}">${article.articlecategory}</a>` : '';
            return `
                <div class="article-cell col-2">
                    <div class="card-wrap">
                        <a href="${article.articlepermalink}">
                            <div class="card-outside">
                                <div class="card-image">
                                    <img class="thumbnail" src="${article.articleimg1url}" alt="${article.articletitle}">
                                </div>
                                <div class="card-content article" style="width: 100%">
                                    <div class="title is-size-5 is-size-5-mobile has-text-weight-normal">
                                        ${article.articletitle}
                                    </div>
                                    <div class="description">
                                        ${article.articleabstracttext.substr(0, 24)}
                                    </div>
                                </div>
                            </div>
                        </a>  
                    </div>
                </div>
            `;
        }
    } else if (pathname.startsWith(`${baseUrl}/articles`)) {
        const articleContentDom = $('#b3_solo_h1_0');
        if (articleContentDom.length) {
            const adom = articleContentDom.find('a');
            const href = adom.attr('href');
            // articleContentDom.remove(adom);
            // adom.remove();
            $('#jumpBtn').attr('data-url', href);
            console.log('content', articleContentDom, articleContentDom.length, href);
        }   
        $('#jumpBtn').on('click', (evt) => {
            window.open(evt.currentTarget.dataset.url, '_blank');
        })
    }
})