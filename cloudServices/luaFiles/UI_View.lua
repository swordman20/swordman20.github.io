view = View()
view.frame(0, 10, 100, 100)
view.backgroundColor(0x44aa0000)
local x, y = view.center();
Toast("中心点位置: " .. x .. "," .. y)


view.backgroundColor(1)
print(view.backgroundColor())

view.backgroundColor(0x88000001)
print(view.backgroundColor())

view.backgroundColor(0x000001, 0.5)
print(view.backgroundColor())

view.backgroundColor(0xff000001, 0.5)
print(view.backgroundColor())


view.children(function(parent)
    print(parent)
    local child1 = View()
    child1.frame(2, 2, 90, 90)
    child1.backgroundColor(0x00ff00)
    child1.children(function(parent)
        print(parent)
        local child2 = View()
        child2.frame(2, 2, 80, 80)
        child2.backgroundColor(0xff0000)
        child2.children(function(parent)
            print(parent)
            local child3 = View()
            child3.frame(2, 2, 60, 60)
            child3.backgroundColor(0x0000ff)
        end)
    end)
end)
