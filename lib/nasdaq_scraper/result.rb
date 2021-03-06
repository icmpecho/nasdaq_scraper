module NasdaqScraper
	class Result
		attr_reader :index, :change

		def initialize(index=nil, change=nil)
			@index = index
			@change = change
		end

		def to_str
			if(valid?)
				"NASDAQ: Index(#{@index}), Change(#{@change})"
			else
				"An error occured."
			end
		end

		def to_json
			if(valid?)
				{
					index: @index,
					change: @change,
				}.to_json
			else
				{}.to_json
			end
		end

		def valid?
			@index == nil ? false : true
		end

	end
end