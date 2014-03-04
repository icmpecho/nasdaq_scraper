module NasdaqScraper
	class Result
		attr_reader :index, :change

		def initialize(index, change)
			@index = index
			@change = change
		end

	end
end