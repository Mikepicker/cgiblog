#!/bin/bash

# build posts
cd posts
for i in ./*; do
  html_file=${i%.*}.html

  if [[ $(head -n 1 $i) == "draft" ]]; then
    continue;
  fi

  if ! [ -e ../html/${html_file} ] || [ $i -nt ../html/${html_file} ] || [ ../templates/template_post.html -nt ../html/${html_file} ]; then
    pandoc --wrap=none --standalone --template ../templates/template_post.html $i -o ../html/${html_file};
  fi
done;

# build home
cd ../html

latest_posts=$(ls | grep -v index.html | head -n 20)

html_body="<ul>"

for file in $latest_posts; do
    meta_title=$(grep -oP '(?<=<title>).*(?=</title>)' "$file")
    html_body+="<li><a href="$file">$meta_title</a></li>"
done

html_body+="</ul>"

escaped_body=$(echo "$html_body" | sed 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')

sed 's/\$body\$/'"$escaped_body"'/g' ../templates/template_home.html > index.html

cd ..
./build_sitemap.sh
