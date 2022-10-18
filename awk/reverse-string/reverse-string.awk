{
    name = ""
    for (i=length($0); i>0;i--) {
        name = name substr($0, i, 1)
    }
    print(name)
}
