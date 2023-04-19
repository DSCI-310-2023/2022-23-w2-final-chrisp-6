report: report.rmd
  Rscript render report.rmd --to_html

data: analysis/load_clean.R
  mkdir analysis/output
  Rscript load_clean.R

figs: analysis/figures.R
	Rscript analysis/figures.R

clean:
  rm -rf report.html
