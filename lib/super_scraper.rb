require 'super_scraper/generic_scraper'

# Basic scraper
module SuperScraper
  ##
  # Create a scraper
  def self.scraper
    SuperScraper::GenericScraper.new
  end
end
