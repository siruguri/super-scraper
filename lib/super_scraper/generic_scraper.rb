require 'httparty'
require 'nokogiri'
module SuperScraper
  # Generic scraper
  class GenericScraper
    attr_reader :url, :nodes, :start_link
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

    def find_start_link
      nodes = Nokogiri::HTML.parse(HTTParty.get(url))
      min_diff = -10
      min_date = nil
      nodes.css('ul.frp-widget li').each do |node|
        a_link = node.children.select { |child| child.name == 'a' }.first
        if a_link
          text = a_link.text
          matches = /(\d{1,2}\/\d{1,2}\/\d{4})/.match text
          if matches
            _date = Date._parse matches[1]
            # Dates are upside down in _parse
            date = Date.new _date[:year], _date[:mday], _date[:mon]
            puts date
            if min_diff == -10 || min_diff > (Date.today - date).to_i
              min_diff = (Date.today - date).to_i
              min_date = date
            end
          end
        end
      end
    end

    def extract
      return if start_link.nil?
      body = HTTParty.get start_link
      @nodes = Nokogiri::HTML.parse body
    end

    def print_table
      return if nodes.nil?
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
