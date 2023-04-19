report: report.rmd
	Rscript -e "rmarkdown::render('report.rmd','bookdown::html_document2')"

output/data: analysis/data.R
	Rscript data.R

output/figs: analysis/figure.R
	Rscript figure.R

clean:
  rm -rf report.html
  rm -rf output/
