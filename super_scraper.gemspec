Gem::Specification.new do |spec|
  spec.name          = 'super-scraper'
  spec.version       = SuperScraper::VERSION
  spec.authors       = ["Sameer Siruguri"]
  spec.email         = ["siruguri@gmail.com"]
  spec.description   = %q{This gem is a SUPER scraper.}
  spec.summary       = %q{This gem is a SUPER scraper.}
  spec.homepage      = "https://github.com/siruguri/super-scraper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest'  
end
