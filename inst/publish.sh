git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"
[ -z "${GITHUB_PAT}" ] && exit 0
git clone -b gh-pages https://${GITHUB_PAT}@github.com/ropensci-books/targets.git gh-pages
cd gh-pages
ls -a | grep -Ev "^\.$|^..$|^\.git$" | xargs rm -rf
cp -r ../_book/* ./
git add *
git commit -am "Update the manual" || true
git push origin gh-pages
