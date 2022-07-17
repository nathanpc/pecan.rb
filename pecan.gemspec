# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'pecan'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = 'Work with Pecan component archives'
  s.description = 'Deal with virtual electronic component files known as Pecan component archives'
  s.authors     = ['Nathan Campos']
  s.email       = 'nathan@innoveworkshop.com'
  s.files       = Dir['lib/*.rb'] + Dir['bin/*']
  s.homepage    = 'https://github.com/nathanpc/pecan.rb'

  s.required_ruby_version = File.read('.ruby-version').strip
end
