w, h = System.screenSize();

cellHeight = 100
imageUrl1 = "http://gju2.alicdn.com/bao/uploaded/i1/10000073270926575/TB2fpg0cXXXXXb6XpXXXXXXXXXX_!!0-0-juitemmedia.jpg"
imageUrl2 = "http://img4.duitang.com/uploads/item/201306/25/20130625045508_sairr.thumb.600_0.jpeg"

tableView = RefreshCollectionView {
    Section = {
        SectionCount = 2,
        RowCount = function(section)
            return 10;
        end
    },
    Cell = {
        Id = function(section, row)
            if (section == 1) then
                return "ImageAndLabel";
            else
                return "ImageAndImage";
            end
        end,
        ImageAndLabel = {
            Size = function(section, row)
                return 50, cellHeight;
            end,
            Init = function(cell, section, row)
                cell.icon = Image();
                cell.title = Label();
                print("构造Cell");
            end,
            Layout = function(cell, section, row)
                cell.icon.frame(0, 0, 20, 50);
                cell.icon.image(imageUrl1, function()
                    print("imageLoaded-ImageAndLabel", section, row)
                end);

                cell.title.frame(20, 0, w - 20, cellHeight);
                cell.title.text("测试" .. section .. "--" .. row);
            end,
            Callback = function(section, row)
                print(section, row);
                tableView.stopRefreshing();
                System.gc();
            end
        },
        ImageAndImage = {
            Size = function(section, row)
                return cellHeight;
            end,
            Init = function(cell, section, row)
                cell.icon = Image();
                cell.icon2 = Image();
            end,
            Layout = function(cell, section, row)
                print(window);
                local cellWdith, cellHeight = cell.window.size();
                cell.icon.frame(0, 0, cellHeight, cellHeight);
                cell.icon.image(imageUrl1, function()
                    print("imageLoaded-ImageAndImage-1", section, row)
                end);
                cell.icon2.frame(cellHeight + 10, 0, cellHeight, cellHeight);
                cell.icon2.image(imageUrl1, function()
                    print("imageLoaded-ImageAndImage-2", section, row)
                end);
            end,
            Callback = function(section, row)
                print(section, row);
                tableView.stopRefreshing();
                System.gc();
            end
        }
    },
    Callback = {
        Scrolling = function()
            print("scrolling");
        end,
        ScrollBegin = function()
            print("scrolling begin");
        end,
        ScrollEnd = function()
            print("scrolling end");
        end,
        PullDown = function()
            print("PullDown");
        end
    }
};

loading = false;

tableView.frame(0, 0, w, h - 64);



