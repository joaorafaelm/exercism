END { printf "One for %s, one for me.", ($0) ? $0 : "you"; }
