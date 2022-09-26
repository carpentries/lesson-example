#!/usr/bin/env bash

# Build R
if ls _episodes_rmd/*.Rmd >/dev/null 2>&1; then
  Rscript renv/activate.R
  Rscript -e 'renv::restore()'
  RMD_PATH=$(find ./_episodes_rmd -name '*.Rmd')
  Rscript -e 'for (f in commandArgs(TRUE)) if (file.exists(f)) rmarkdown::render(f, knit_root_dir=getwd(), output_dir=dirname(sub("./_episodes_rmd/", "./_episodes/", f)))' ${RMD_PATH[*]}
  perl -pi -e "s/([>\s]*)(>\s)(.*?)(\{: \.[a-zA-Z]+\})/\1\2\3\n\1\4\n\1/g" ./_episodes/*.md
  perl -0777pi -e "s/(?<!\n)\{: .challenge\}/\n\{: .challenge\}/g" ./_episodes/*.md
fi

echo 'Making favicons'
python3 bin/make_favicons.py
echo 'Making schedules'
python3 bin/get_schedules.py
echo 'Making setup'
python3 bin/get_setup.py


