$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fetcher/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fetcher"
  s.version     = Fetcher::VERSION
  s.authors     = ["TIETO"]
  s.homepage    = "https://github.com/Tieto/fetcher"
  s.summary     = "Fetcher is a simple message fetcher perfect for using in a daemon or via cron."
  s.description = "Fetcher implements the following common pattern: Connect to a server; Download available messages; Send each message to another object for further processing; Remove downloaded messages from the remote server"

  s.files = Dir["{app,config,db,lib,generators}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
  s.add_dependency "SystemTimer" if RUBY_VERSION < '1.9.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "mocha"
end
