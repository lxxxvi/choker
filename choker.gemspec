require File.join(__dir__, "lib", "choker", "version")

Gem::Specification.new do |s|
  s.name        = 'choker'
  s.version     = Choker::VERSION
  s.date        = '2016-10-29'
  s.summary     = "Choker... (tbd)"
  s.description = "A simple hello world gem"
  s.authors     = ["Mario Schüttel"]
  s.email       = 'github@lxxxvi.ch'
  s.files       = %w[
                      lib/choker.rb
                      lib/choker/version.rb
                    ]
  s.homepage    = 'http://rubygems.org/gems/choker'
  s.license     = 'MIT'
end