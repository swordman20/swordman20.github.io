--上拉刷新
LIGHT_GRAY = 0xf5edb3
cellHeight = 100
imageUrl1 = "http://gju2.alicdn.com/bao/uploaded/i1/10000073270926575/TB2fpg0cXXXXXb6XpXXXXXXXXXX_!!0-0-juitemmedia.jpg"
imageUrl2 = "http://img4.duitang.com/uploads/item/201306/25/20130625045508_sairr.thumb.600_0.jpeg"
local SCREEN_WIDTH = System.screenSize()
function createPageIndicator()
    local indicator = PagerIndicator()
    indicator.xy(SCREEN_WIDTH / 2 - 20, 135)
    return indicator
end

pageView = PagerView({
    PageCount = 4,
    Pages = {
        Title = function(position)
            return "Title"
        end,
        Init = function(page, pos)
            page.icon = Image()
            --设置图片
            page.icon.image(imageUrl1)
        end,
        Layout = function(page, pos)
            page.icon.frame(0, 0, SCREEN_WIDTH, 150)
        end
    },
})
pageView.indicator(createPageIndicator())
--Imageview和Label,将屏幕分成四份
view=View()
icon = Image(imageUrl1)
--icon.frame(0,0, 50, 50);
icon.flexCss("width: 50, height: 50")
label = Label()
label.text("移动和包")
label.font(14)
label.frame(0, 60, 50, 50);
view.frame(0, 170, 70, 20)
view.flexChildren(icon,label)
--for i = 0, 3, 1 do
--    view=View()
--    icon = Image(imageUrl1)
--    icon.frame(0, 0, 50, 50);
--    label = Label()
--    label.text("移动和包")
--    label.font(14)
--    label.frame(0, 50, 70, 20)
--    view.add(icon,label)
--    view.frame(20+SCREEN_WIDTH/4*i,170,70,70)
--
--end
--积分兑换排行榜文字
labeTop = Label()
labeTop.text("积分兑排行榜")
labeTop.font(14)
labeTop.frame(SCREEN_WIDTH / 2 - 40, 260, 100, 20)
labeTop.adjustFontSize()
--积分兑换排行榜滚动
local scrollView = HScrollView()
for i = 0, 10, 1 do
    local btn = Image(imageUrl1)
    btn.frame(i * SCREEN_WIDTH / 4 + 5, 10, SCREEN_WIDTH / 4 - 5, 80)
    label = Label()
    label.text = "积分排行榜"
    label.frame(i * SCREEN_WIDTH / 4 + 10, 100, 200, 20)
    --没起作用
    -- btn.flexCss("margin: 5, margin-left: 10")
    --label.flexCss("margin: 5,align-self: stretch")
    scrollView.addView(btn)
    scrollView.addView(label)
end
scrollView.xy(0, 280)
scrollView.size(SCREEN_WIDTH, 120)
scrollView.backgroundColor(LIGHT_GRAY)
--每日精品特惠
labeCon = Label()
labeCon.text("每日精品特惠")
labeCon.font(14)
labeCon.frame(SCREEN_WIDTH / 2 - 40, 410, 50, 20)
labeCon.adjustSize()

--每日精品特惠的商品Imageview和Label平分屏幕
--tableView = RefreshTableView {
--    Section = {
--        SectionCount = 1,
--        RowCount = function(section)
--            return 10;
--        end
--    },
--    Cell = {
--        Id = function(section, row)
--            if (section == 1) then
--                return "ImageAndImage";
--            end
--        end,
--        ImageAndLabel = {
--            Size = function(section, row)
--                return cellHeight;
--            end,
--            Init = function(cell, section, row)
--                cell.icon = Image();
--                cell.title = Label();
--                print("构造Cell");
--            end,
--            Layout = function(cell, section, row)
--                cell.icon.frame(20, 0, cellHeight, cellHeight);
--                cell.icon.image(imageUrl1, function()
--                    print("imageLoaded-ImageAndLabel", section, row)
--                end);
--
--                cell.title.frame(20 + cellHeight, 0, w - cellHeight, cellHeight);
--                cell.title.text("测试" .. section .. "--" .. row);
--            end,
--            Callback = function(section, row)
--                print(section, row);
--                tableView.stopRefreshing();
--                System.gc();
--            end
--        },
--        ImageAndImage = {
--            Size = function(section, row)
--                return cellHeight;
--            end,
--            Init = function(cell, section, row)
--                cell.icon = Image();
--                cell.icon2 = Image();
--            end,
--            Layout = function(cell, section, row)
--                print(window);
--                local cellWdith, cellHeight = cell.window.size();
--                cell.icon.frame(0, 0, cellHeight, cellHeight);
--                cell.icon.image(imageUrl1, function()
--                    print("imageLoaded-ImageAndImage-1", section, row)
--                end);
--
--
--                cell.icon2.frame(cellHeight + 10, 0, cellHeight, cellHeight);
--                cell.icon2.image(imageUrl1, function()
--                    print("imageLoaded-ImageAndImage-2", section, row)
--                end);
--            end,
--            Callback = function(section, row)
--                print(section, row);
--                tableView.stopRefreshing();
--                System.gc();
--            end
--        }
--    },
--    Callback = {
--        Scrolling = function()
--            print("scrolling");
--        end,
--        ScrollBegin = function()
--            print("scrolling begin");
--        end,
--        ScrollEnd = function()
--            print("scrolling end");
--        end,
--        PullDown = function()
--            print("PullDown");
--        end
--    }
--};
--tableView.frame(0, 430, w, h - 64);












