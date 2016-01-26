# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'subst_attr'
  s.version = '0.0.1.4'
  s.summary = 'Declare attributes that have default implementations that are substitutes or null objects'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/subst-attr'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'attribute'

  s.add_runtime_dependency 'naught'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-spec-context'
  s.add_development_dependency 'pry'
end
