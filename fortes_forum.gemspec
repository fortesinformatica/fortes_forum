$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fortes_forum/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fortes_forum"
  s.version     = FortesForum::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FortesForum."
  s.description = "TODO: Description of FortesForum."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
end
