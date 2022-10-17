{
    gsub(/[ \t]+$/, "", $0);
    query = $0
}
END {
    if (length(query) < 2) {
        print("Fine. Be that way!")
    } else {
        if (query ~ /\?$/) {
            if (query ~ /[a-z0-9:)]+/){
                print("Sure.")
            } else { 
                print("Calm down, I know what I'm doing!")
            }
        } else {
            if (query ~ /^[^a-z]*$/) {
                if (query !~ /[a-zA-Z]+/) {
                    print("Whatever.")
                } else {
                    print "Whoa, chill out!"
                }
            } else {
                print("Whatever.")
            }
        }
    }
}
