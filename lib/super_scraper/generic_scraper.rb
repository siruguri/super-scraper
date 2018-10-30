require 'httparty'
require 'nokogiri'
module SuperScraper
  # Generic scraper
  class GenericScraper
    attr_reader :url, :nodes
    def initialize(url)
      @url = url
    end
    
    ##
    # @return [Array] list of registered pages
    def pages
      Page.list
    end

    ##
    # @return [Array<SuperScraper::Pattern>] list of registered patterns
    def patterns
      Pattern.list
    end
    
    ##
    # @return [String] text value from extraction
    def extract
      body = HTTParty.get url
      @nodes = Nokogiri::HTML.parse body
    end

    def print_table
      nodes.css('.entry-content p').each do |node|
        link = node.children.find { |child| child.name == 'a' }
        if link
          linktext = link.children.find { |child| child.text? }.text
          text = node.children.find { |child| child.text? }
          puts "<a href=#{link['href']}>#{linktext} - #{text}</a><br/>"
        end
      end
    end
  end
end
