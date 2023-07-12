#!/bin/bash
bash bin/build_me.sh &> /dev/null
bundle exec jekyll serve --watch --incremental --livereload --host 0.0.0.0
