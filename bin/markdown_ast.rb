#!/usr/bin/env ruby

# Use Kramdown parser to produce AST for Markdown document.
require "bundler/inline"

gemfile do
  source  'https://rubygems.org'
  gem 'json'
  gem 'kramdown'
end

markdown = STDIN.read()
doc = Kramdown::Document.new(markdown)
tree = doc.to_hash_a_s_t
puts JSON.pretty_generate(tree)
