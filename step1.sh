# change file name in line number 5

git for-each-ref --format="%(refname)" refs/original/
git for-each-ref --format="%(refname)" refs/original/ | while read ref; do git update-ref -d "$ref"; done
git filter-branch --index-filter "git rm -rf --cached --ignore-unmatch package.json" HEAD