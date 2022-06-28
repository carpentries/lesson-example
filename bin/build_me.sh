#!/usr/bin/env bash

git branch -d localbuild || echo 'branch local build does not exist to delete'
git checkout -b localbuild

python -m venv ./venv || echo 'venv already exists'

#TODO: Make this windows safe
source venv/bin/activate

gem install github-pages bundler kramdown kramdown-parser-gfm

python3 -m pip install --upgrade pip setuptools wheel pyyaml==5.3.1 requests
python3 -m pip install -r requirements.txt

python bin/get_submodules.py

#TODO: Check for rmarkdown and build it if appropriate

python bin/make_favicons.py
python bin/get_schedules.py
python bin/get_setup.py

# Build the site.
bundle install
bundle exec jekyll serve --baseurl=""

# Clean the things not tracked by git
rm setup.md
rm -r _site/ venv/ collections/ fig/ _includes/rsg/*-lesson/ slides/ _includes/ submodules/
find -f ./data \! -name "*.md" -depth 1 -delete
rm assets/favicons/rsg/apple* assets/favicons/rsg/favicon* assets/favicons/rsg/mstile*

git checkout main
git branch -d localbuild || echo 'branch local build does not exist to delete'