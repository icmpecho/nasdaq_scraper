require 'thor'
require 'nasdaq_scraper'

module NasdaqScraper
	module Cli
		class Application < Thor
			
			desc 'scrape [URL]', 'Scrape the [URL] for NASDAQ index'
			method_option :json, :type => :boolean, :description => 'Generate JSON result', :default => false
			def scrape(url)
				data = NasdaqScraper::scrape_url(url)
				if options[:json]
					puts data.to_json
				else
					puts data.to_str
				end
			end

		end
	end
end