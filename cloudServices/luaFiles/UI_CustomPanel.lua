--可以将local字段去掉
panel = CustomError()
panel.backgroundColor(0xff0000)
panel.frame(100, 100, 200, 200)
panel.callback(function(message, arg1, arg2, arg3, arg4)
    print(message, arg1, arg2, arg3, arg4)
    if(value == "success") then
        -- do
    else
        -- do
    end
end)

print("rootView", panel.getNativeView().getAlpha())


