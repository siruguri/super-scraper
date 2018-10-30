$:.push File.expand_path("../lib", __FILE__)
require 'super_scraper/version'
Gem::Specification.new do |spec|
  spec.name          = 'super_scraper'
  spec.version       = SuperScraper::VERSION
  spec.authors       = ["Sameer Siruguri"]
  spec.email         = ["sameers.public@gmail.com"]
  spec.description   = %q{This gem is a SUPER scraper.}
  spec.summary       = %q{This gem is a SUPER scraper. It works so easily!}
  spec.homepage      = "https://github.com/siruguri/super-scraper"
  spec.license       = "MIT"
  spec.files         = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency('httparty', '~> 0.16')
  spec.add_dependency('nokogiri', '~> 1.8')
end
