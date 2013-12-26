require 'rubygems'

SPEC = Gem::Specification.new do |s|
    s.name        = "assure"
    s.version     = "1.0.1"
    s.author      = "Pluron, Inc."
    s.email       = "support@pluron.com"
    s.homepage    = "http://github.com/acunote/assure"
    s.license     = 'MIT'
    s.platform    = Gem::Platform::RUBY
    s.description = "Adds assure and internal_error methods"
    s.summary     = "Raises internal error when expression evaluates to nil or false."

    s.files         = `git ls-files`.split("\n")
    s.test_files    = `git ls-files -- test/*`.split("\n")

    s.require_path  = "lib"
    s.has_rdoc      = true
end
