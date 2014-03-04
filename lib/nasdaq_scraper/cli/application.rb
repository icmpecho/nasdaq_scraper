require 'thor'
require 'nasdaq_scraper'

module NasdaqScraper
	module Cli
		class Application < Thor
			
			desc 'scrape [URL]', 'Scrape the [URL] for NASDAQ index'
			def scrape(url)
				data = NasdaqScraper::scrape_url(url)
				if(!data)
					puts "An error occured."
					return
				end
				puts data.to_str
			end

		end
	end
end