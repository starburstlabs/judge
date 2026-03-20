$:.push File.expand_path('../lib', __FILE__)

require 'judge/version'

Gem::Specification.new do |s|
  s.name = 'judge'
  s.version = Judge::VERSION
  s.homepage = 'http://github.com/joecorcoran/judge'
  s.summary = 'Client side validation for Rails'
  s.description = 'Validate Rails forms on the client side, simply'
  s.email = 'joecorcoran@gmail.com'
  s.authors = ['Joe Corcoran']
  s.files = Dir['{app,config,lib,vendor}/**/*'] + ['LICENSE.txt', 'README.md']
  s.license = 'MIT'

  s.add_runtime_dependency     'rails',                  '>= 7.2', '< 9'

  s.add_development_dependency 'rspec-rails',            '~> 7.0'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'sqlite3',                '~> 2.1'
  s.add_development_dependency 'factory_bot',            '~> 6.0'
  s.add_development_dependency 'appraisal',              '~> 2.0'
end
