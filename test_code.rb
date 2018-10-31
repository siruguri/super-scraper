require 'super_scraper'
require 'pry'

scraper = SuperScraper::GenericScraper.new ARGV[0]

scraper.find_start_link
scraper.extract
scraper.print_table

