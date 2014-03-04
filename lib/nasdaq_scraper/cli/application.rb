require 'thor'
require 'nasdaq_scraper'

module NasdaqScraper
	module Cli
		class Application < Thor
			
			desc 'scrape [URL]', 'Scrape the [URL] for NASDAQ index'
			def scrape(url)
				data = NasdaqScraper::scrape_url(url)
				puts "NASDAQ:"
				puts "Index: #{data[:index]}"
				puts "Change: #{data[:change]}"
			end

		end
	end
end