# -*- encoding: utf-8 -*-
# stub: axios_rails 0.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "axios_rails".freeze
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Katherine Adam".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-09-14"
  s.description = "Adds Axios into your Rails app.".freeze
  s.email = ["muedasnka@gmail.com".freeze]
  s.homepage = "https://github.com/KatherineMuedas/axios_rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Integrates Axios into your Rails app.".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
