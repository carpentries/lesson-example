# -*- encoding: utf-8 -*-
# stub: execjs 2.10.0 ruby lib

Gem::Specification.new do |s|
  s.name = "execjs".freeze
  s.version = "2.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sam Stephenson".freeze, "Josh Peek".freeze]
  s.date = "2024-10-23"
  s.description = "ExecJS lets you run JavaScript code from Ruby.".freeze
  s.email = ["sstephenson@gmail.com".freeze, "josh@joshpeek.com".freeze]
  s.homepage = "https://github.com/rails/execjs".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "Run JavaScript code from Ruby".freeze

  s.installed_by_version = "3.2.33" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
