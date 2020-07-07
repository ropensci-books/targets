library(fs)
if (file.exists("docs")){
  dir_delete("docs")
}
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::gitbook"
)
