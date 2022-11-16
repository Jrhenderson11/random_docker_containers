#!/bin/bash
git clone https://github.com/learning-zone/website-templates.git 

template_name=$(cat website-templates/README.md | grep $(printf "%02d" $(( $RANDOM % 170 + 1 ))) | tail -n1 |tr '\t' ' ' | cut -d "|" -f3 | tr -s ' ' | cut -d " " -f2)

echo -e "\ntemplate: $template_name"
ls "website-templates/$template_name/"
cp -r "website-templates/$template_name/"* /usr/share/nginx/html
echo "Done"