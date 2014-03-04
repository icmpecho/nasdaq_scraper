require "nasdaq_scraper/version"
require "rest-client"
require 'nasdaq_scraper/result'

module NasdaqScraper

  def scrape(html)
  	data = html.match(/nasdaqHomeIndexChart.storeIndexInfo\(\"NASDAQ\",\"(?<index>\d+.\d+)\",\"(?<change>[+-]*\d+.\d+)\"/)
  	data ? NasdaqScraper::Result.new( data[:index].to_f, data[:change].to_f ) 
  		: NasdaqScraper::Result.new( nil, nil )
  end

  def scrape_url(url)
  	begin
  		response = RestClient.get url
  	rescue
  		return NasdaqScraper::Result.new( nil, nil )
  	end
  	scrape response.to_str
  end

  module_function :scrape
  module_function :scrape_url

end
