# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-subst_attr'
  s.version = '0.2.1.0'
  s.summary = 'Declare attributes that have default implementations that are substitutes or null objects'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/subst-attr'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'evt-attribute'
  s.add_runtime_dependency 'evt-reflect'

  s.add_runtime_dependency 'naught'

  s.add_development_dependency 'test_bench'
end
