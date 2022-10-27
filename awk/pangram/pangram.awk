{
    gsub(/[^a-zA-Z]/, "")
    split(tolower($0), sentence, "")
    for (i in sentence) letters[sentence[i]] = 1
    print (length(letters) == 26) ? "true" : "false"
}
