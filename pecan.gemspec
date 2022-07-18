# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'archive-pecan'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Work with Pecan component archives'
  s.description = 'Deal with virtual electronic component files known as Pecan component archives'
  s.authors     = ['Nathan Campos']
  s.email       = 'nathan@innoveworkshop.com'
  s.files       = Dir['lib/**/*.rb']
  s.executables = Dir.chdir('bin/') { Dir['bin/*'] }
  s.homepage    = 'https://github.com/nathanpc/pecan.rb'

  s.required_ruby_version = File.read('.ruby-version').strip
  s.add_runtime_dependency 'minitar', '= 0.6.1'
end
