#!/bin/bash

# Define the location of the HTML files
html_dir="html/"

# Define the location of the sitemap file
sitemap_file="sitemap.xml"

# Start the sitemap file
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $sitemap_file
echo "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">" >> $sitemap_file

# Loop through all the HTML files and add them to the sitemap
for file in $(ls $html_dir*.html); do
  echo "  <url>" >> $sitemap_file
  echo "    <loc>https://esp8266code.com/${file##*/}</loc>" >> $sitemap_file
  echo "    <lastmod>$(date +%Y-%m-%d)</lastmod>" >> $sitemap_file
  echo "    <changefreq>monthly</changefreq>" >> $sitemap_file
  echo "    <priority>0.5</priority>" >> $sitemap_file
  echo "  </url>" >> $sitemap_file
done

# End the sitemap file
echo "</urlset>" >> $sitemap_file
