
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nyt_bestsellers_cli_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "nyt_bestsellers_cli_gem"
  spec.version       = NytBestsellersCliGem::VERSION
  spec.authors       = ["Richard Spitkovsky"]
  spec.email         = ["rjspitkovsky@gmail.com"]

  spec.summary       = "Check out New York Times Bestseller List"
  spec.description   = "Provides information on the latest New York Times Bestsellers List"
  spec.homepage      = "https://github.com/rjspitkovsky/nyt-bestsellers-cli-app"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
