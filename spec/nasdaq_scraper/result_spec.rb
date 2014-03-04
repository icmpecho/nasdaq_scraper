require 'spec_helper'
require 'nasdaq_scraper/result'

describe NasdaqScraper::Result do
	let(:result) { NasdaqScraper::Result.new(4351.03,73.73) }
	it 'have accessor to index' do
		result.index.should eq 4351.03
	end
	it 'have accessor to change' do
		result.change.should eq 73.73
	end
end