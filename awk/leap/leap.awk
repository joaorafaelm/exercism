{
    if ($0 % 4 != 0) { print "false"; next }
    if ($0 % 100 == 0 && $0 % 400 != 0) { print "false"; next }
    print "true"
}
