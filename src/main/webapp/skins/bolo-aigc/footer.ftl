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
<footer class="footer">
    <div class="container flex-v">
        <div class="flex-h justify-content-between">
            <div class="aigc-icon-container">
                <div class="flex-h align-items-center">
                    <img src="${staticServePath}/images/logo-long.png"></img>
                </div>
                <div>AI俱乐部收录了国内外数百个不同类型的AI工具，每日更新和添加最新AI工具，AI工具集还推荐了AI学习开发的常用网站、框架和模型，帮助你加入人工智能浪潮，自动化高效完成任务！
                    Ctrl + D 收藏本站到浏览器书签栏。</div>
            </div>
            <div class="aigc-flex">
                <div class="row justify-content-between align-items-center">
                    <p class="footer-links text-sm mb-3">
                        <span>
                            <a href="https://ai-fun.vip/">AI俱乐部</a>
                        </span>
                        <a href="mailto:info@ai-fun.vip">商务合作</a>
                        <a href="https://${servePath}/about-us.html">关于我们</a>
                        <a href="https://${servePath}/declare.html">免责声明</a>
                </div>
            </div>
        </div>
        <div>
            <div class="footer-copyright text-xs flex-h align-center">
                Copyright © 2023 &nbsp;&nbsp;<a href="https://ai-fun.vip" title="AI俱乐部" class="flex-h align-center" rel="home">AI俱乐部</a>&nbsp;<a href="https://beian.miit.gov.cn/" target="_blank" class="flex-h align-center" rel="link noopener">蜀ICP备2022019184号-2</a>&nbsp; &nbsp;            <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=51010702003349" target="_blank" class="flex-h align-center" rel="noopener"><img style="margin-bottom: 3px;" src="https://ai-fun.vip/wp-content/themes/onenav/images/gaba.png"> 川公网安备 51010702003349号</a></div>
        </div>
    </div>
</footer>
<script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<script src="${staticServePath}/js/lib/compress/pjax.min.js"></script>
<script src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}"></script>
<script src="${staticServePath}/skins/${skinDirName}/js/common${miniPostfix}.js?${staticResourceVersion}"></script>
<#include "../../common-template/label.ftl">

${plugins}