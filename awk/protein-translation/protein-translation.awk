{
    for (i=0; i<length($0)/3;i++) {
        codon = substr($0, i*3+1, 3)
        if (codon ~ /AUG/) proteins = proteins "Methionine "
        else if (codon ~ /UUU|UUC/) proteins = proteins "Phenylalanine "
        else if (codon ~ /UUA|UUG/) proteins = proteins "Leucine "
        else if (codon ~ /UCU|UCC|UCA|UCG/) proteins = proteins "Serine "
        else if (codon ~ /UAU|UAC/) proteins = proteins "Tyrosine "
        else if (codon ~ /UGU|UGC/) proteins = proteins "Cysteine "
        else if (codon ~ /UGG/) proteins = proteins "Tryptophan "
        else if (codon ~ /UAA|UAG|UGA/) break
        else {print "Invalid codon"; exit 1}
    }
    sub(/ +$/, "", proteins); print proteins
}
