module NasdaqScraper
	class Result
		attr_reader :index, :change

		def initialize(index, change)
			@index = index
			@change = change
		end

		def to_str
			"NASDAQ: Index(#{@index}), Change(#{@change})"
		end

	end
end