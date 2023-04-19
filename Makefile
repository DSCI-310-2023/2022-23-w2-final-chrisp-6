report: report.rmd
	Rscript -e "rmarkdown::render('report.rmd','bookdown::html_document2')"

data: analysis/data.R
	Rscript data.R

figs: analysis/figure.R analysis/data.R
	Rscript figure.R

clean:
  rm -rf report.html
  rm -rf output/
