# frozen_string_literal: true

require_relative 'lib/archive/pecan/version'

Gem::Specification.new do |s|
  s.name        = 'archive-pecan'
  s.version     = Archive::Pecan::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'Virtual electronic component archives'
  s.description = <<~DESC
    Deal with virtual electronic component files known as Pecan component
    archives.
  DESC
  s.authors     = ['Nathan Campos']
  s.email       = 'nathan@innoveworkshop.com'
  s.homepage    = 'https://github.com/nathanpc/pecan.rb'
  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/nathanpc/pecan.rb/issues',
    'documentation_uri' => 'https://www.rubydoc.info/gems/archive-pecan',
    'homepage_uri' => s.homepage,
    'source_code_uri' => 'https://github.com/nathanpc/pecan.rb'
  }

  s.files       = Dir['lib/**/*.rb']
  s.executables = Dir.chdir('bin/') { Dir['bin/*'] }

  s.extra_rdoc_files = Dir['README.md', 'LICENSE']
  s.rdoc_options += [
    '--title', 'Pecan - Virtual Electronic Component Archives',
    '--main', 'README.md',
    '--line-numbers',
    '--inline-source',
    '--quiet'
  ]

  s.required_ruby_version = File.read('.ruby-version').strip
  s.add_runtime_dependency 'minitar', '= 0.6.1'
end
