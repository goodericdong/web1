# Render all the .Rmd files in static/
blogdown::build_dir("static/")


# Convert all slide RMD files to HTML and PDF
slide_names_with_ext <- list.files(here::here("static/"), pattern = "*.Rmd", recursive = T)

slide_names_sans_ext <- tools::file_path_sans_ext(slide_names_with_ext)

pdfize <- function(slide_name) {
  pagedown::chrome_print(here::here(paste0("static/", slide_name, ".Rmd")))
}

sapply(slide_names_sans_ext, pdfize)

