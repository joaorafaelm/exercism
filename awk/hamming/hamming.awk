BEGIN { FS = "\n"; RS=""; h = 0; valid = 1}

function haming(){
  split($1, left, ""); split($2, right, "")

  for(i in left) if(right[i] != left[i]) h += 1 
  return h
}

{ if(length($1) != length($2)){ valid = 0; exit(1) } }

END{ print valid ? haming() : "strands must be of equal length"}
