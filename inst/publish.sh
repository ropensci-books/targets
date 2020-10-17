git config --global user.email "will.landau@gmail.com"
git config --global user.name "wlandau"
[ -z "${GITHUB_PAT}" ] && exit 0
Rscript -e 'bookdown::render_book(input = "index.Rmd", output_format = "bookdown::gitbook")'
git clone -b gh-pages https://${GITHUB_PAT}@github.com/wlandau/targets-manual.git gh-pages
cd gh-pages
ls -a | grep -Ev "^\.$|^..$|^\.git$" | xargs rm -rf
cp -r ../_book/* ./
git add *
git commit -am "Update the manual" || true
git push origin gh-pages
