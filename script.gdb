define ml
    set $addr = $arg0  # 将第一个参数存入临时变量
    info line *$addr   # 执行 info line *A
end
