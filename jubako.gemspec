$:.push File.expand_path("../lib", __FILE__)

require "jubako/version"

Gem::Specification.new do |s|
  s.name        = "jubako"
  s.version     = Jubako::VERSION
  s.authors     = ["Yuki Hattori"]
  s.email       = ["yukihattori1116@gmail.com"]
  s.homepage    = "https://github.com/yhatt"
  s.summary     = "Support multi-level layout inheritances in Rails view"
  s.description = "Jubako gives multi-level layout inheritance in Rails view."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.1.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pry-byebug"
end
