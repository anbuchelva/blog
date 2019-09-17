#!/bin/sh
rm -rf public
git config --global user.email "anbuchelva@gmail.com"
git config --global user.name "anbuchelva"
git clone https://github.com/anbuchelva/blog public
hugo --gc --minify
cd public
git remote -v
git add .
git status
msg="Deployed by Netlify $(date)"
# if [ -n "$*" ]; then
	# msg="$*"
# fi
git commit -m "$msg"
git push -f -q https://${GH_TOKEN}:x-oauth-basic@github.com/anbuchelva/blog.git master