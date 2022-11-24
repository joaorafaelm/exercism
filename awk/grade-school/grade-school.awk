BEGIN { FS = OFS = ","; PROCINFO["sorted_in"] = action == "roster" ? "@val_num_asc" : "@ind_str_asc" }
!($1 in students) { students[$1] = $2 }
END {
    for (name in students)
        if (action == "roster" || grade == students[name]) { printf _ ? "," name : name; _ = 1 }
}
