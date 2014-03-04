require 'spec_helper'
require 'nasdaq_scraper/result'

describe NasdaqScraper::Result do
	let(:result) { NasdaqScraper::Result.new(4351.03,73.73) }
	let(:invalid_result) { NasdaqScraper::Result.new }
	it 'have accessor to index' do
		result.index.should eq 4351.03
	end
	it 'have accessor to change' do
		result.change.should eq 73.73
	end
	it 'can be converted to string' do
		result.to_str.should eq "NASDAQ: Index(4351.03), Change(73.73)"
	end
	it 'can be converted to json' do
		result.to_json.should eq '{"index":4351.03,"change":73.73}'
	end
	it 'can be converted to empty json when invalid' do
		invalid_result.to_json.should eq "{}"
	end
	it 'can validate itself' do
		result.should be_valid
		invalid_result.should_not be_valid
	end
end