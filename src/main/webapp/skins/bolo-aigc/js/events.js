function moveListItemIntoList(array, targetArray, item) {
  const index = array.findIndex((ele) => {
    ele.type = item.type;
  });
  const ix = array.splice(index, 1);
  targetArray.push(...ix);
}

function rerenderMenuSider(menuList) {
  function createMenuItem(item, parentpath, children) {
    return `
    <li data-desc="${item.desc}" data-uri="${item.type}" data-title="${
      item.title
    }" data-parentpath="${parentpath}">
        <div class="level is-marginless">
            <div class="menu-image"><img src="${item.desc}"/></div>
            <span class="level-start">
                <span class="level-item">${item.title}</span>
            </span>
        </div>
        ${children ?? ""}
    </li>
    `;
  }
  const htmls = menuList.map((item) => {
    let children = "";
    if (item.children?.length) {
      const chiChildren = item.children.map((item) =>
        createMenuItem(item, item.type)
      );
      children = `
                <ul class="children-menu-list">
                    ${chiChildren.join("")}
                </ul>
            `;
    }
    return createMenuItem(item, "", children);
  });
  $("#sideMenu .menu-list").html(htmls.join(""));
  $("#sideMenu .menu-list li").on('click', function(e) {
    const { uri, parentpath } = e.currentTarget.dataset;
    location.href = `${location.origin}#article-module-${parentpath || uri}`;
    return false;
  })
}

function createModules(list, map) {
  return list
    .map((item) => {
      const { type, title, children } = item;
      const cells = map[type];
      let childrenMenu = "";
      if (children?.length) {
        const allCells = [];
        const tmp = children.map((item2) => {
          const { type, title } = item2;
          const cells1 = map[type];
          allCells.push(cells1);
          return {
            lis: `
                  <li class="children-menu-item" data-type="${type}">
                      <span>${title}</span>
                  </li>
                  `,
            content: `
                      <div id="article-module-children-${type}" class="article-list-content-children flex-h flex-wrap">
                          ${cells1 ? cells1.map(createCell).join("") : ""}
                      </div>
                  `,
          };
        });
        childrenMenu = `
              <div style="display: flex;">
                  <ul class="children-menu-container flex-h">
                      ${tmp.map((item) => item.lis).join("")}
                  </ul>
              </div>
              <div class="children-menu-content flex-h flex-wrap">${tmp
                .map((item) => item.content)
                .join("")}</div>
          `;
      }
      return `
              <div class="module" data-type="${type}" style="display: block;" id="article-module-${type}">
                  <div class="module-title ${
                    childrenMenu ? "module-title-nomargin" : ""
                  }">
                      <div class="module-image">
                          <img src="${item.desc}"></img>
                      </div>
                      <span>${title}</span>
                  </div>
                  ${childrenMenu}
                  <div class="module-cards-content container">${
                    cells ? cells.map(createCell).join("") : ""
                  }</div>
              </div>
          `;
    })
    .join("");
}

function createCell(article) {
  const dom1 = document.createElement("div");
  dom1.innerHTML = article.articleabstract;
  const textContent = dom1.textContent;

  let imgUrl =  article["articleAbstractText".toLowerCase()];
  if (imgUrl.startsWith('/ailogos')) {
    imgUrl = `${location.origin}/images${imgUrl}`;
  }

  return `
    <div class="article-cell col-2">
      <div class="card-wrap">
        <a href="${article.articlepermalink}">
          <div class="card-outside">
            <div class="card-image">
              <img class="thumbnail" src="${imgUrl}">
            </div>
            <div class="card-content article" style="width: 100%">
              <div class="title is-size-5 is-size-5-mobile has-text-weight-normal">
                ${article.articletitle}
              </div>
              <div class="description">
                ${textContent?.length > 24 ? textContent.substring(0, 24) + '...' : textContent ?? ''}
              </div>
            </div>
          </div>
        </a>  
      </div>
    </div>
  `;
}


$(document).ready(function () {
  // 获取路由
  const baseUrl = "/";

  const menuList1 = $("#aigcAllCategoryDropdown .menu-list li");
  menuList1.on("click", (evt) => {
    // 为header中导航添加事件
    const type = evt?.currentTarget.dataset.uri;
    location.href = `${location.origin}${baseUrl}category/${type}`;
  });

  // 左侧导航栏
  const menuList = $("#sideMenu .menu-list li");
  
  const menuSortList = [];
  const tmpMap = {};
  const hasList = {
    mergeList: ["photo", "office"],
    photo: ["illustr", "Lossless", "erase", "repair", "thing"],
    office: ["word", "excel", "ppt", "mind"],
  };
  hasList.ignoreMenu = [].concat(hasList.photo, hasList.office);
  $.each(menuList, function (idx, item) {
    const { uri, title, desc } = item?.dataset ?? {};
    const obj = { type: uri, title: title, desc };
    tmpMap[uri] = obj;
    if (hasList.ignoreMenu.includes(uri)) {
      return;
    }
    menuSortList.push(obj);
  });
  hasList.mergeList.forEach((item) => {
    const list = hasList[item]; // photo office
    const obj = tmpMap[item];
    if (!obj) return;
    list.forEach((item2) => {
      // word
      const obj1 = tmpMap[item2];
      if (!obj1) return;
      if (!obj.children) {
        obj.children = [];
      }
      obj.children.push(obj1);
    });
  });

  console.log("menuSortList", menuSortList);
  // 重新渲染导航
  rerenderMenuSider(menuSortList);

  const pathname = location.pathname;
  if (pathname === baseUrl) {
    // 首页, 重新渲染
    const articleCells = $(".article-list .article-origin-list .article-cell");
    const menuSortMap = {};
    $.each(articleCells, function (idx, item) {
      const categoryUri = item?.dataset?.categoryuri;
      if (categoryUri) {
        if (!menuSortMap[categoryUri]) {
          menuSortMap[categoryUri] = [];
        }
        menuSortMap[categoryUri].push({ ...item.dataset });
        return;
      }
    });
    console.log("article map", menuSortMap);

    // 重新渲染首页
    const html = createModules(menuSortList, menuSortMap);
    $(".article-list .article-render-list").html(html);
    console.log("html", menuSortList, menuSortMap);
    // 为子导航添加事件
    $(".children-menu-container").on(
      "click",
      ".children-menu-item",
      function (e) {
        $(e.currentTarget).addClass("active").siblings().removeClass("active");
        const categoryUri = e.currentTarget.dataset.type;
        const activeContent = $(`#article-module-children-${categoryUri}`);
        activeContent.addClass(`active`).siblings().removeClass("active");
      }
    );
    $(".children-menu-container:first-child").trigger("click");
  } else if (pathname.startsWith(`${baseUrl}articles`)) {
    $("#jumpBtn").on("click", (evt) => {
      window.open(evt.currentTarget.dataset.targetUrl, "_blank");
    });
    const src = $('#articleLogo').attr('src');
    if (src.startsWith('/ailogos')) {
      $('#articleLogo').attr('src', `${location.origin}/images${src}`);
    }
  } else if (pathname.startsWith(`${baseUrl}category`)) {
    // 首页, 重新渲染
    const articleCells = $(".article-list .article-origin-list .article-cell");
    const menuSortMap = [];
    $.each(articleCells, function (idx, item) {
      menuSortMap.push({ ...item.dataset });
    });
    const htmls = menuSortMap.map(createCell).join('');
    console.log('list', htmls);
    $(".article-list .article-render-list").html(`<div class="module-cards-content container">${htmls}</div>`);
  }

  $("#aigcAllCategoryTab").mouseover((evt) => {
    $("#aigcAllCategoryDropdown").css("display", "block");
  });

  $("#aigcAllCategoryTab").mouseout((evt) => {
    $("#aigcAllCategoryDropdown").css("display", "none");
  });
});
