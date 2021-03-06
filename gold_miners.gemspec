
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gold_miners/version"

Gem::Specification.new do |spec|
  spec.name          = "gold_miners"
  spec.version       = GoldMiners::VERSION
  spec.authors       = ["'Daniel Karagiannis'"]
  spec.email         = ["'dakaragiannis@gmail.com'"]

  spec.summary       = %q{Stock Screener for gold miners.}
  spec.description   = %q{App scrapes investor info for gold mining stocks.}
  spec.homepage      = "https://github.com/dakaras/gold_miners-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
# The gemspec defines what’s in the gem, who made it, and the version of the gem.
# It’s also your interface to RubyGems.org.
# add nokogiri gem here and type bundle to install 
