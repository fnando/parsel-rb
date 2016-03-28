require "./lib/parsel/version"

Gem::Specification.new do |s|
  s.name        = "parsel"
  s.version     = Parsel::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nando Vieira"]
  s.email       = ["fnando.vieira@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/parsel"
  s.summary     = "Encrypt and decrypt data with a given key."
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map {|f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency "rake"
  s.add_development_dependency "minitest-utils"
end
