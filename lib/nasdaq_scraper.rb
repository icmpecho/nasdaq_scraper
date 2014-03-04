require "nasdaq_scraper/version"

module NasdaqScraper

  def scrape(html)
  	data = html.match(/nasdaqHomeIndexChart.storeIndexInfo\(\"NASDAQ\",\"(?<index>\d+.\d+)\",\"(?<change>[+-]\d+.\d+)\"/)
  	data ? { index: data[:index].to_f, change: data[:change].to_f } : nil
  end

  module_function :scrape
  
end
