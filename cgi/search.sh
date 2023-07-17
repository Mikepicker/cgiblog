#!/bin/bash

cd ../html

search=$QUERY_STRING
search="${search#*=}"
IFS='+' read -ra keywords <<< "$search"

html_body="<ul>"

for file in *.html; do
    
  if [ "$file" = "index.html" ]; then
    continue;
  fi

  meta_keywords=$(grep -oP '(?<=<meta\sname="keywords"\scontent=").*(?=">)' "$file" | tr ',' ' ')
  meta_title=$(grep -oP '(?<=<title>).*(?=</title>)' "$file")
  meta_description=$(grep -oP '(?<=<meta\sname="description"\scontent=").*(?=">)' "$file")

  for keyword in "${keywords[@]}"; do
      if grep -q "$keyword" "$file" <<< "$meta_keywords"; then
          html_body+="<li><a href="$file">$meta_title</a></li>"
          break
      fi
  done
done

html_body+="</ul>"

# Escape the HTML body for use in sed
escaped_body=$(echo "$html_body" | sed 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')

echo "content-type: text/html"
echo ""
sed 's/\$body\$/'"$escaped_body"'/g' ../templates/template_search.html
