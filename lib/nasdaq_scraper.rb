require "nasdaq_scraper/version"

module NasdaqScraper

  def scrape(html)
  	data = html.match(/nasdaqHomeIndexChart.storeIndexInfo\(\"NASDAQ\",\"(?<index>\d+.\d+)\",\"(?<change>[+-]\d+.\d+)\"/)
  	{ index: data[:index].to_f, change: data[:change].to_f }
  end

  module_function :scrape
  
end
