for file in source/_drafts/*.md; do	
	if head -20 "$file" | grep -Fiqx "draft: false"
		then
			mv "$file" "source/_posts/"
			echo "Publishing $(basename "$file") from draft"
		else
			echo "Keeping $(basename "$file") in draft"
	fi
done
for file in source/_posts/*.md; do
	if head -20 "$file" | grep -Fiqx "draft: true"
		then
			mv "$file" "source/_drafts/"
			echo "Revoke publish post $(basename "$file") to draft"
	fi
done
echo "Clean database"
hexo clean
echo "Build Posts"
hexo generate