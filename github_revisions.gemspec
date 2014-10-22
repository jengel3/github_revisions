$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "github_revisions/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Github Revisions"
  s.version     = GithubRevisions::VERSION
  s.authors     = ["Jake0oo0"]
  s.email       = ["jake0oo0dev@gmail.com"]
  s.homepage    = "http://revisions.jake0oo0.me"
  s.summary     = "Access a list of revisions for various Github repositories."
  s.description = "Access a list of revisions for various Github repositories."
  s.license     = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_dependency "github_api"
end