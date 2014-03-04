# NasdaqScraper

You can use this gem to fetch NASDAQ frontpage from http://www.nasdaq.com and scrape data for NASDAQ index and index changes from that page

## Installation

Add this line to your application's Gemfile:

    gem 'nasdaq_scraper', :git => 'https://github.com/icmpecho/nasdaq_scraper.git'

And then execute:

    $ bundle

Or manually install by cloning this repository and run:

		$ rake build

Then:
    
    $ rake install


## Usage

To fetch NASDAQ data as text

    nasdaq_scraper scrape [ optional url ]

To fetch NASDAQ data as json

    nasdaq_scraper scrape --json [ optional url ]

If you left url blank it'll be http://www.nasdaq.com

To view help

    nasdaq_scraper


## Contributing

1. Fork it ( http://github.com/icmpecho/nasdaq_scraper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
