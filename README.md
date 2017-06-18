# Install

`require super_scraper`

# Use
Get the title of Reddit articles

```
    ss = SuperScraper.scraper
    ss.pages.add ['www.reddit.com']
    ss.patterns.add 'www.reddit.com', 'a.title'
    ss.extract 'www.reddit.com'
```

