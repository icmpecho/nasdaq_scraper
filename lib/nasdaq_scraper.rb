require "nasdaq_scraper/version"
require "rest-client"

module NasdaqScraper

  def scrape(html)
  	data = html.match(/nasdaqHomeIndexChart.storeIndexInfo\(\"NASDAQ\",\"(?<index>\d+.\d+)\",\"(?<change>[+-]*\d+.\d+)\"/)
  	data ? { index: data[:index].to_f, change: data[:change].to_f } : nil
  end

  def scrape_url(url)
  	begin
  		response = RestClient.get url
  	rescue
  		return nil
  	end
  	scrape response.to_str
  end

  module_function :scrape
  module_function :scrape_url

end
