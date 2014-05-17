$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "piggybak_simple_variants/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "piggybak_simple_variants"
  s.version     = PiggybakSimpleVariants::VERSION
  s.authors     = ["Ludovic Jamet"]
  s.email       = ["jamet.ludovic@gmail.com"]
  s.homepage    = "https://github.com/piggybak/piggybak_simple_variants"
  s.summary     = "The most simplest implementation of variants for Piggybak."
  s.description = "You define variants, you assign a variant to a product and... it's done!"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "mysql2", '~> 0'

end
