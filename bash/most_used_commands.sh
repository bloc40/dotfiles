# List the most used commands
function most {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
  #------- Another version ---------------
  #history | awk '{print $2}' | awk 'BEGIN {FS="|"} {print $1}' | sort | uniq -c | sort -r | head
}
