module SuperScraper
  # Generic scraper
  class GenericScraper
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
    end
  end
end
