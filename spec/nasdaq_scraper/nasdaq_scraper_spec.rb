require 'spec_helper'
require 'nasdaq_scraper'

describe NasdaqScraper do
	html = <<eof
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js"><!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title dir="ltr">NASDAQ Stock Market - Stock Quotes - Stock Exchange News - NASDAQ.com</title>
<meta name="description" content="Official site of The NASDAQ Stock Market featuring free stock quotes, stock exchange prices, stock market news, and online stock trading tools." />
<meta name="google-site-verification" content="Dhoeh6-0waQxEPPElgAnjhR1wgUGqfMNL4rrngOshx4" />
<meta name="msvalidate.01" content="F041A7B7EB3DBF466D76535008243A8B" />

<link rel="apple-touch-icon" href="http://content.nasdaq.com/images/Q_apple.png" />
<link rel="shortcut icon" href="http://content.nasdaq.com/images/qfav.ico" type="image/ico" />
<link rel="icon" href="http://content.nasdaq.com/images/qfav.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://content.nasdaq.com/images/qfav.ico" type="image/x-icon" />

<meta name="robots" content="index,follow" />
<link rel="canonical" href="http://www.nasdaq.com/" />
<link rel="publisher" href="https://plus.google.com/+nasdaq" />
<meta itemprop="name" content="The NASDAQ Stock Market" />
<meta itemprop="description" content="The financial site for individual investors from the NASDAQ Stock Market, featuring real-time stock quotes &amp; market data, market news &amp; commentary, a customizable portfolio, and much more." />
<meta itemprop="url" content="http://www.nasdaq.com/" />
<meta itemprop="image" content="http://content.nasdaq.com/images/Q-logo.jpg" /> 
<meta property="og:title" content=" NASDAQ's Homepage for Retail Investors" />
<meta property="og:type" content="website" />
<meta property="og:site_name" content="NASDAQ.com" />
<meta property="og:url" content="http://www.nasdaq.com/" />
<meta property="og:image" content="http://content.nasdaq.com/images/Q-logo.jpg" />
<meta name="apple-itunes-app" content="app-id=334788512" />
<script src="http://www.nasdaq.com/dynamic_includes/marketstatus.js"></script>
<script src="http://www.nasdaq.com/aspx/marketstatus.aspx"></script>
<script src="http://www.nasdaq.com/includes/jquery.min.js"></script>
<script src="http://www.nasdaq.com/includes/global.min-2222014v4.js"></script>
<script src="http://www.nasdaq.com/includes/home-main.js?m1"></script>
<script src="http://www.nasdaq.com/includes/carousel-script.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="http://www.nasdaq.com/includes/home-style-2262014v1.css" />
<!--[if lt IE 9]>
	<script src="http://www.nasdaq.com/includes/html5shiv-printshiv.js"></script>
	<link rel="stylesheet" type="text/css" href="http://www.nasdaq.com/includes/global-ie8.css?m1" />
<![endif]-->
<!-- IE8 hack for optionshouse ad -->
<!--[if IE 8]>
<style>
	#home-editors-pick h2 + div {
	float: none;
}
</style>
<![endif]-->
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" media="all" href="http://www.nasdaq.com/includes/global-ie7.css?m1" />
<![endif]-->
<link rel="stylesheet" type="text/css" media="all" href="http://www.nasdaq.com/includes/layout.css" />
<script type="text/javascript">
    //<![CDATA[
    myPage='home';
    sectionId = 'liHome';//section tab
    breadCrumbId = 'Li1';//page
    is_dartSite = "home";
    is_dartZone = "home9";
    propVar = "home";
    propVar15 = "Home and our company"

    if(isMobileBrowser())
    {
	    if(cookies_enabled())
	    {
		    var mcindex = document.cookie.indexOf("mobileaccess=true");
		    if(mcindex==-1)//mobile cookie not found
		    {
			    window.location = "http://m.nasdaq.com";
		    }
	    }
	    else//cookies not enabled
		    window.location = "http://m.nasdaq.com";
    }

    function highChartDeferredActions()
    {
	    nasdaqHomeIndexChart.getDefaultChartData();
	    displayEarningForecast();
	    displayEarningSurprise();
	    displayRecommendations();
    }

    $(function(){
    addScriptList([{"url":"http://www.nasdaq.com/includes/highcharts/highstock.js","async":true},
	    {"url":"http://www.nasdaq.com/includes/highcharts/highstockexporting.js","async":true,"callback":"highChartDeferredActions()"}]);
    nasdaqIndexRow.init_d('homepage');
    });

    var server_time = new Date(1393936943226);
    //]]>
</script>
<script type="text/javascript">
    function close_interstitial()
    {
	    $('#interstitial').removeClass('visible');
	    $('#interstitial_backdrop').removeClass('visible');
    }

    function open_interstitial()
    {
	    $('#interstitial_backdrop').addClass('visible'); //display the loading box
	    $('#interstitial').addClass('visible');
    }

    function check_interstitial()
    {
	    if($('#interstitial_content').find('div').length>0)
	    {
		    open_interstitial();
		    setTimeout(close_interstitial,10000);
	    }
    }
</script>
<script type="text/javascript">window.jQuery || document.write('<script src="http://www.nasdaq.com/includes/jquery.min.js"><\/script>')</script>
<script type="text/javascript">
var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
g.src='//www.google-analytics.com/ga.js';
s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
<script src="http://127.0.0.1:35729/livereload.js?ext=Chrome&amp;extver=2.0.9"></script>
<style type="text/css" title="dynamic"></style>
<script>updateSiteTheme();</script>
</head>

<body>
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-W828"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-W828');</script>

<div class="ad-space">
    <div class="wrapper">
        <div class="ad-banner">
            <script type="text/javascript" language="JavaScript">makeAd('1','728x90',is_dartSite,is_dartZone,'','', true);</script>
        </div>
        <div class="floatL">
            <!-- START includes/hot-topics.inc -->        
            Hot Topics: 
            <a href="http://www.nasdaq.com/investing/etfs/" onclick="triggerAsyncOmnitureClickEvent('nav:hot-topics:ETFs')">ETFs</a> | 
            <a href="http://www.nasdaq.com/personal-finance/banking.aspx" onclick="triggerAsyncOmnitureClickEvent('nav:hot-topics:Banking')">Banking</a> | 
            <a href="http://www.nasdaq.com/personal-finance/taxes.aspx" onclick="triggerAsyncOmnitureClickEvent('nav:hot-topics:Taxes')">Taxes</a> | 
	        <a href="http://www.nasdaq.com/investing/online-brokers/" onclick="triggerAsyncOmnitureClickEvent('nav:hot-topics:Broker')">Online Broker Center</a>            
<!-- START includes/hot-topics.inc -->
        </div>
        <div id="nWelcome" class="floatR">
            <a href="http://community.nasdaq.com/">Register or Login</a>
        </div>
		<!-- begin notifier placeholder -->
		<div id="global_notifier" class="floatR">
			<div id="notifier"></div>
		</div>
		<!-- end notifier placeholder -->
	</div> 
</div>
<div class="site__header">
    <!--*****************************Begin includes/nMainNavHome.inc**************************************************-->

<!-- {{{{{{{{{{{{{{{{{{{ NOTE: update includes/MainNavPartner.inc with new changes as well }}}}}}}}}}}}}}}}}}}}}}}} -->

<div class="site__nav">
    <h3 class="logo">
        <a href="http://www.nasdaq.com/">
            <img src="http://www.nasdaq.com/images/nasdaq_logo_2014.png" width="240" title="Home" alt="Nasdaq logo" />
        </a>
    </h3>
    <ul class="js-nav-toggle primary">
        <li class="site-nav-quotes">
            <a href="http://www.nasdaq.com/quotes">Quotes</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="first-drop">
                        <li class="stock"><a href="http://www.nasdaq.com/quotes/">Stock Quotes</a></li>
                        <li><a href="http://www.nasdaq.com/aspx/flashquotes.aspx">Flash Quotes</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/stock-quotes.aspx">Summary Quotes</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/real-time.aspx">Real Time Quotes</a></li>
                        <li><a href="http://www.nasdaq.com/extended-trading/">Extended Trading</a></li>
                        <li><a href="http://www.nasdaq.com/options/">Options Trading Center</a></li>
                    </ul>
                    <ul class="first-drop">
                        <li class="charts"><a href="http://www.nasdaq.com/quotes/stock-charts.aspx">Charts</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/stock-charts.aspx">Basic Charts</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/interactive-charts.aspx">Interactive Charts</a></li>
                    </ul>
                    <ul class="first-drop">
                        <li class="news"><a href="http://www.nasdaq.com/quotes/company-news.aspx">Company News</a></li> 
		                <li><a href="http://www.nasdaq.com/quotes/company-news.aspx">News</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/press-releases.aspx">Press Releases</a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="first-drop">
                        <li class="profile"><a href="http://www.nasdaq.com/quotes/stock-reports.aspx">Company Profile</a></li> 
                        <li><a href="http://www.nasdaq.com/quotes/stock-reports.aspx">Stock Reports</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/sec-filings.aspx">SEC Fillings</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/short-interest.aspx">Short Interest</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/business-competitors.aspx">Competitors</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/ownership.aspx">Ownership</a></li>
                    </ul>
                    <ul class="first-drop">
                        <li class="fundamentals"><a href="http://www.nasdaq.com/quotes/company-financials.aspx">Fundamentals</a></li> 
		                <li><a href="http://www.nasdaq.com/quotes/company-financials.aspx">Financials</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/revenue-eps.aspx">Revenue EPS</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/analyst-research.aspx">Analyst Research</a></li>
		                <li><a href="http://www.nasdaq.com/quotes/stock-guru-analysis.aspx">Guru Analysis</a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="site-nav-markets">
            <a href="http://www.nasdaq.com/markets/">Markets</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/extended-trading/"><span>Extended Hours</span></a></li>
                        <li><a href="http://www.nasdaq.com/extended-trading/premarket-mostactive.aspx">Pre-Market Activity</a></li>
                        <li><a href="http://www.nasdaq.com/extended-trading/afterhours-mostactive.aspx">After Hours Activity</a></li>
                    </ul>
                    <ul class="secondary-drop">
                        <li><a href="http://dynamic.nasdaq.com/aspx/mostactive.aspx"><span>Stocks</span></a></li> 
                        <li><a href="http://dynamic.nasdaq.com/aspx/mostactive.aspx">Most Active</a></li>
                        <li><a href="http://www.nasdaq.com/markets/unusual-volume.aspx">Unusual Volume</a></li>
                        <li><a href="http://www.nasdaq.com/aspx/52-week-high-low.aspx">52 Week High/Low</a></li>
                        <li><a href="http://www.nasdaq.com/markets/upcoming-splits.aspx">Upcoming Splits</a></li>
                        <li><a href="http://www.nasdaq.com/markets/sec-filings-n.aspx">New SEC Filings</a></li>
                        <li><a href="http://www.nasdaq.com/markets/ipos">IPO Summary</a></li>
                        <li><a href="http://www.nasdaq.com/earnings/earnings-calendar.aspx">Earnings Calendar</a></li>
                        <li><a href="http://www.nasdaq.com/dividend-stocks/">Dividend Stocks</a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/markets/commodities.aspx"><span>Commodities</span></a></li>
                        <li><a href="http://www.nasdaq.com/investing/etfs/"><span>ETFs</span></a></li>
                        <li><a href="http://www.nasdaq.com/markets/barchart-sectors.aspx"><span>Sector Analysis</span></a></li>
                        <li><a href="http://www.nasdaq.com/markets/global-markets.aspx"><span>Global Markets</span></a></li>
                        <li><a href="http://www.nasdaq.com/earnings/daily-analyst-recommendations.aspx"><span>Analyst Activity</span></a></li>
                        <li><a href="http://www.nasdaq.com/earnings/daily-analyst-recommendations.aspx">Upgrades/Downgrades</a></li>
                        <li><a href="http://www.nasdaq.com/earnings/analyst-forecast-change.aspx">Forecast Changes</a></li>
                        <li><a href="http://www.nasdaq.com/earnings/daily-earnings-surprise.aspx" class="a-mega">Earning Surprises</a></li>
                    </ul>
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/markets/indices/major-indices.aspx"><span>Indices</span></a></li> 
                        <li><a href="http://www.nasdaq.com/markets/indices/major-indices.aspx">Market Indices</a></li>
                        <li><a href="http://www.nasdaq.com/markets/indices/sector-indices.aspx">Sector Indices</a></li>
                        <li><a href="http://www.nasdaq.com/markets/index-highs">Statistical Milestones</a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="site-nav-news">
            <a href="http://www.nasdaq.com/news/">News</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/quotes/company-news.aspx"><span>Company News</a></span></li>
                        <li><a href="http://www.nasdaq.com/aspx/market-headlines.aspx"><span>Market Headlines</span></a></li>
                        <li><a href="http://www.nasdaq.com/marketstream/"><span>Market Stream</span></a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/markets/us-economic-calendar.aspx"><span>Economic Calendar</span></a></li>
                        <li><a href="http://www.nasdaq.com/video/video.aspx"><span>Business Video</span></a></li>
                    </ul>
                </div>
                <div class="clearB"></div>
                <div class="paddingL10px paddingR10px paddingB10px">
                    <!-- START includes/main-navigation-featured-video.inc -->

<div class="marginB5px">
	<h4>Featured Article</h4>
</div>
<table>
	<tr>
		<td valign="top">
			<a href="http://www.nasdaq.com/article/earnings-expectations-for-the-week-of-march-3-costco-solarcity-and-more-cm331469" class="floatL paddingT5px">
				<img src="http://www.nasdaq.com/images/news/0303earnings2.jpg" width="100" height="100" border="0" />
			</a>
		</td>
		<td valign="top" class="floatL paddingL15px">
			<a href="http://www.nasdaq.com/article/earnings-expectations-for-the-week-of-march-3-costco-solarcity-and-more-cm331469" class="fontS14px">
				Earnings Expectations For The Week Of March 3
			</a>
			<br />
			<p>Costco, Solar City and more</p>
		</td>
	</tr>
</table>
		
<!-- END includes/main-navigation-featured-video.inc -->
                </div>
            </div>
        </li>
        <li class="site-nav-investing">
            <a href="http://www.nasdaq.com/investing/">Investing</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/investing/how-to-invest.aspx"><span>How to Invest</span></a></li> 
                        <li><a href="http://www.nasdaq.com/investing/how-to-invest.aspx">Investing Basics</a></li>
                        <li><a href="http://www.nasdaq.com/investing/online-brokers/">Broker Comparison</a></li>
                        <li><a href="http://www.nasdaq.com/investing/glossary/">Glossary</a></li>
                    </ul>
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/investing/stocks.aspx"><span>Stocks</span></a></li>
                        <li><a href="http://www.nasdaq.com/investing/mutual-funds.aspx"><span>Mutual Funds</span></a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/investing/tools.aspx"><span>Investing Tools</span></a></li>
                        <li><a href="http://www.nasdaq.com/reference/stock-screener.aspx">Stock Screener</a></li>
                        <li><a href="http://www.nasdaq.com/investing/guru/guru-stock-screener.aspx">Guru Screener</a></li>
                        <li><a>&nbsp;</a></li>
                    </ul>
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/advisor/"><span>Financial Advisor <br />Center</span></a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="site-nav-advanced">
            <a href="http://www.nasdaq.com/investing/advanced-investing.aspx">Advanced Investing</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/investing/etfs/"><span>ETFs</span></a></li>
                        <li><a href="http://www.nasdaq.com/investing/forex/"><span>Forex</span></a></li>
                        <li><a href="http://www.nasdaq.com/markets/commodities.aspx"><span>Commodities</span></a></li>
                        <li><a href="http://www.nasdaq.com/investing/bonds.aspx"><span>Bonds</span></a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="secondary-drop">
                     	<li><a href="http://www.nasdaq.com/options/"><span>Options</span></a></li>
                        <li><a href="http://www.nasdaq.com/markets/ipos"><span>IPO Summary</span></a></li>
                        <li><a href="http://www.nasdaq.com/markets/barchart-sectors.aspx"><span>Sector Analysis</span></a></li>
                        <li><a><span>&nbsp;</span></a></li>
                    </ul>
                </div>
            </div>
        </li>
        <li class="site-nav-pf">
            <a href="http://www.nasdaq.com/personal-finance/">Personal Finance</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/personal-finance/retirement.aspx"><span>Retirement</span></a></li>
                        <li><a href="http://www.nasdaq.com/personal-finance/real-estate.aspx"><span>Real Estate</span></a></li>
                        <li><a href="http://www.nasdaq.com/personal-finance/banking.aspx"><span>Banking</span></a></li>
                        <li><a href="http://www.nasdaq.com/personal-finance/franchise.aspx"><span>Franchises</span></a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul class="secondary-drop">
                        <li><a href="http://www.nasdaq.com/personal-finance/taxes.aspx"><span>Taxes</span></a></li>
                        <li><a href="http://www.nasdaq.com/personal-finance/investments.aspx"><span>Investments</span></a></li>
                        <li><a href="http://www.nasdaq.com/personal-finance/small-business.aspx"><span>Small Business</span></a></li>
                        <li><a><span>&nbsp;</span></a></li>
                    </ul>
                </div>
                <div class="clearB"></div>
                <div class="paddingL10px paddingR10px paddingB10px">
                    <!-- START includes/main-navigation-featured-article.inc -->

<div class="marginB5px">
	<h4>Featured Article</h4>
</div>
<table>
	<tr>
		<td valign="top">
			<a href="http://www.nasdaq.com/article/dont-fall-into-these-social-security-traps-cm331490" class="floatL paddingT5px" onclick="triggerAsyncOmnitureClickEvent('nav:personal-finance:featured-article')">
				<img src="http://www.nasdaq.com/images/news/0303socsec2.jpg" width="100" height="100" border="0" />
			</a>
		</td>
		<td valign="top" class="floatL paddingL15px">
			<a href="http://www.nasdaq.com/article/dont-fall-into-these-social-security-traps-cm331490" class="fontS14px" onclick="triggerAsyncOmnitureClickEvent('nav:personal-finance:featured-article')">
				Don't Fall Into These Social Security Traps
			</a>
			<br />
			<p>Here are 6 things to watch out for</p>
		</td>
	</tr>
</table>
		
<!-- END includes/main-navigation-featured-article.inc -->
                </div>
            </div>
        </li>
        <li class="site-nav-nasdaq">
            <a href="http://community.nasdaq.com/">My Nasdaq</a>
            <div class="site__nav__dropdown">
                <div class="floatL half">
                    <ul class="secondary-drop">
                        <li><a href="http://community.nasdaq.com/MyPortfolio.aspx"><span>My Portfolio</span></a></li> 
                        <li><a href="http://community.nasdaq.com/MyRatings.aspx"><span>Stock Ratings</span></a></li> 
                        <li><a href="http://community.nasdaq.com/community-settings.aspx"><span>Settings</span></a></li>
                        <li><a href="http://community.nasdaq.com/community-settings.aspx?tab=account">My Account</a></li>
                        <li><a href="http://community.nasdaq.com/community-settings.aspx?tab=profile">Edit Profile</a></li>
                        <li><a href="http://community.nasdaq.com/manage-connections.aspx">Connnections</a></li>
                        <li><a href="http://community.nasdaq.com/community-settings.aspx?tab=photo">Profile Photo</a></li>
                    </ul>
                </div>
                <div class="floatR half">
                    <ul id="communitynav" class="secondary-drop"><!-- content gets set dynamically -->
                        <li class="profile">
                            <p>Join the NASDAQ Community today and get free, instant access to portfolios, stock ratings, real-time alerts, and more!</p>
                            <ul>
                                <li><a href="http://community.nasdaq.com/">Join Today</a></li>
                            </ul>
                        </li>
                        <li class="floatL">
							<div class="marginT10px marginB5px">
                            	<h4>Already a member?</h4>
							</div>
							<a href="http://community.nasdaq.com/login.aspx" class="blue-button">Login</a>
                        </li>
                    </ul>
                </div>
            </div>
        </li>
    </ul>
</div><!--//site__nav-->
<script>initNav();</script>

<!--*****************************End includes/nMainNavHome.inc**************************************************-->
    <div class="site__search">
        <div class="wrapper">
            <div class="floatL" style="width:120px;height:60px">
                <script type="text/javascript" language="javascript">makeAd('2','120x60',is_dartSite,'bookend_left','','');</script>
            </div>
            <form method="post" action="/" id="stock-search" class="stock-search" onsubmit="return false;">
                <label for="stock-search-text">
                    <input type="text" name="stock-search-text" id="stock-search-text" class="ajax-search" placeholder="Enter symbol, name or keyword" />
                    <button type="submit" id="stock-search-submit">Search</button>
                </label>
                <a href="#stock-searches" title="Configure your experience" class="lightbox-call">
                    <span aria-hidden="true" data-icon="g" id="search-preferences" class="search-preferences icon"></span>
                </a>
            </form>
            <script type="text/javascript">
                $(function(){
                    $('#stock-search-text').focus();
                });
                Nasdaq_Quotesearch.init();
            </script>
            <div class="floatL" style="width:120px;height:60px">
                <script type="text/javascript" language="javascript">makeAd('2','120x60',is_dartSite,is_dartZone,'','');</script>
            </div>
        </div><!--//wrapper-->
    </div><!--//site__search-->
</div>
<div class="marginLAuto marginRAuto" style="position:relative;width:970px;padding:10px 0">
			<script>makeAd('3','970x90','home','','','');</script>
		</div>
<div class="wrapper">
    <div class="site__content">
        <div class="highlight">
            <center>
                <script src="http://www.nasdaq.com/aspx/indexrowhtml.aspx?indexname=GMNOIMAGE"></script>
            </center>
        </div><!--//highlight-->
        <div class="grid__3-4">
            <div class="floatL">
                <h1>Stock Market Activity</h1>
            </div>
            <h3 id="indexvolume" class="floatR">&nbsp;</h3>
            <div class="clearB"></div>
            <div class="floatL marginB10px">
                <script type="text/javascript" language="javascript">makeAd('4','330x20',is_dartSite,is_dartZone,'','');</script>
            </div>
            <div class="grid">
                <div class="grid__1-2">
                    

<div id="HomeIndexTable" class="genTable thin">
    <table id="indexTable" class="floatL marginB5px">
        <tr>
            <th>Index</th>
            <th>Value</th>
            <th>Change Net / %</th>
        </tr>
        <script type="text/javascript">
            //<![CDATA[
            
                nasdaqHomeIndexChart.storeIndexInfo("NASDAQ","4277.30","-30.82","0.72","2,033,058,694","4284.15","4239.65");
                nasdaqHomeIndexChart.storeIndexInfo("DJIA","16168.03","-153.68","0.94","","16321.71","16071.25");
                nasdaqHomeIndexChart.storeIndexInfo("S&P 500","1845.73","-13.72","0.74","","1859.45","1834.44");
                nasdaqHomeIndexChart.storeIndexInfo("NASDAQ-100","3668.37","-27.73","0.75","","3678.38","3637.67");
                nasdaqHomeIndexChart.storeIndexInfo("NASDAQ-100 PMI","3660.21","-35.89","0.97","","3663.10","3659.60");
                nasdaqHomeIndexChart.storeIndexInfo("NASDAQ-100 AHI","3666.26","-2.11","0.06","","3668.33","3665.73");
                nasdaqHomeIndexChart.storeIndexInfo("Russell 1000","1033.78","-7.58","0.73","","1041.36","1027.28");
                nasdaqHomeIndexChart.storeIndexInfo("Russell 2000","1176.36","-6.67","0.56","","1183.03","1164.77");
                nasdaqHomeIndexChart.storeIndexInfo("FTSE All-World ex-US*","267.88","1.41","0.53","","267.90","266.19");
                nasdaqHomeIndexChart.storeIndexInfo("FTSE RAFI 1000*","8385.63","-60.08","0.71","","8445.71","8335.19");
            //]]>
            nasdaqHomeIndexChart.displayIndexes();
        </script>
    </table>
</div>



                    <div class="clearB"></div>
                    <div class="floatL">
                        

 <table id="homepageIndexRow" border="0" cellpadding="0" cellspacing="0">
                           <tr>
                                <td id="homepageIndexRowTime" class="paddingL5px small" itemprop="dateModified" content="2014-03-04T07:42:23-05:00">
                                    Data as of&nbsp;
                                    Mar&nbsp;3,&nbsp;2014

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="floatR">
                        <a href="http://www.nasdaq.com/markets/indices/major-indices.aspx" onclick="triggerAsyncOmnitureClickEvent('home:module:indices')">
                            View Major Indices
                        </a>
                    </div>
                </div>
                <div class="grid__1-2">
                    <div class="charteriffic" id="charteriffic"><!-- chartss --></div>
                </div>
            </div>

            <hr />

		    <div class="grid__1-2 site__top-stories">
		        
<div id="home-editors-pick">
    <div>
        <h2>After Hours: Editor's picks</h2>
        <div>
            <a rel="nofollow" href="http://optionshouse.benzinga.com">
                <img src="http://www.nasdaq.com/images/sboh-185x40.gif" height="40" width="185" alt="Sponsored By: Optionshouse" />
            </a>
        </div>
    </div>
    <div class="clearB"></div>
    
            <ul class="orange-ordered-list marginR0p marginT0p marginB0px">
                <li>
                    <a id="ep1_rptLeft_link1_0" onclick="triggerAsyncOmnitureClickEvent(&#39;home:module:editorspick1&#39;)" href="http://www.nasdaq.com/article/consumer-stocks-climbing-off-session-lows-mens-warehouse-jos-a-bank-edging-higher-agree-to-merger-talks-cm331737">Consumer Stocks Climbing Off Session Lows; Men's Warehouse, Jos. A Bank Edging Higher, Agree to Merger Talks</a>
                    <div class="clearB"></div>
                </li>
            </ul>
        
            <ul class="orange-ordered-list marginR0p marginT0p marginB0px">
                <li>
                    <a id="ep1_rptLeft_link1_1" onclick="triggerAsyncOmnitureClickEvent(&#39;home:module:editorspick2&#39;)" href="http://www.nasdaq.com/article/financial-stocks-paring-losses-slightly-ashford-hospitality-trust-off-3-following-downgrades-property-sale-cm331745">Financial Stocks Paring Losses Slightly; Ashford Hospitality Trust Off 3% Following Downgrades, Property Sale</a>
                    <div class="clearB"></div>
                </li>
            </ul>
        
            <ul class="orange-ordered-list marginR0p marginT0p marginB0px">
                <li>
                    <a id="ep1_rptLeft_link1_2" onclick="triggerAsyncOmnitureClickEvent(&#39;home:module:editorspick3&#39;)" href="http://www.nasdaq.com/article/afterhours-earnings-report-for-march-3-2014-scty-vips-gwre-geva-urs-mr-asna-mdr-nuva-dxpe-mcp-auq-cm331702">After-Hours Earnings Report for March 3, 2014 :  SCTY, VIPS, GWRE, GEVA, URS, MR, ASNA, MDR, NUVA, DXPE, MCP, AUQ</a>
                    <div class="clearB"></div>
                </li>
            </ul>
        
</div>
				<div class="clearB"></div>
		        <div class="floatL">
		            <h2>Latest Market News Headlines</h2>
		        </div>
				<div class="floatR">
					<script type="text/javascript" language="javascript">makeAd('2','88x31','quotes','atf','','');</script>
				</div>
				<div class="clearB"></div>
                <!-- Begin MarketNewsAnalysis.inc -->
<ul id="Homepage-Market-News">
<li><a href="http://www.nasdaq.com/article/earnings-reaction-history-gtx-inc-429-followthrough-indicator-37-sensitive-cm331877">Earnings Reaction History: GTx Inc., 42.9% Follow-Through...</a></li>
<li><a href="http://www.nasdaq.com/article/london-markets-ftse-100-rises-1-as-ukraine-tensions-ease-20140304-00084">LONDON MARKETS: FTSE 100 Rises 1% As Ukraine Tensions Ease</a></li>
<li><a href="http://www.nasdaq.com/article/correction-to-story-monday-on-astrazeneca-bydureon-pen-story-20140304-00026">Correction to Story Monday on AstraZeneca Bydureon Pen Story</a></li>
<li><a href="http://www.nasdaq.com/article/detroit-floats-new-pact-with-creditors-20140303-01556">Detroit Floats New Pact With Creditors</a></li>
<li><a href="http://www.nasdaq.com/article/phase-ii-review-for-huntsmanrockwood-deal-analyst-blog-cm331847">Phase II Review for Huntsman-Rockwood Deal - Analyst Blog</a></li>
<li><a href="http://www.nasdaq.com/article/gold-and-bonds-shine-as-russia-leads-global-selloff-cm331813">Gold And Bonds Shine As Russia Leads Global Sell-Off</a></li>
<li><a href="http://www.nasdaq.com/press-release/stonemor-partners-lp-reschedules-time-of-conference-call-and-webcast-to-discuss-fourth-quarter-and-20140304-00264">StoneMor Partners, L.P. Reschedules Time of Conference Call...</a></li>
</ul>
<!-- End MarketNewsAnalysis.inc -->

                <a href="http://www.nasdaq.com/aspx/market-headlines.aspx" class="blue-button">
                    More Market Headlines
                </a>
                <div class="clearB"></div>
		    </div>
            <div class="grid__1-2 site__top-stories">
                                <!-- START includes/homefeaturedstory.inc -->
                <div class="featured-story">
                    <h2>Featured Story</h2>
                    <a href="http://www.nasdaq.com/article/cheniere-energy-won39t-liquefy-your-portfolio-cm331442">
                        <img src="http://www.nasdaq.com/images/news/0303natgas.jpg" width="215" height="155" alt="featured story" />
                    </a>
                    <div>
                        <h3>
                            <a href="http://www.nasdaq.com/article/cheniere-energy-won39t-liquefy-your-portfolio-cm331442">
                            Cheniere Energy Won't Liquefy Your Portfolio
                            </a>
                        </h3>
                        <p>Despite spike in natural gas due to cold weather, prices are still very low</p>
                    </div>
                </div>
                <div class="featured-video">
                    <h2>Featured Video</h2>
                    <div>
<script type='text/javascript' src='http://pshared.5min.com/Scripts/PlayerSeed.js?sid=281&width=435&height=268&playList=518141522' async ></script>
                    </div>
                    <a href="http://www.nasdaq.com/video/video.aspx" class="blue-button">View More</a>
                </div>
				<!-- END includes/homefeaturedstory.inc -->
            </div>
            
            <div class="clearB"></div>
            <hr />

            <h2>Stock Activity</h2>
            

<div id="hp-mostactive-module" class="tabs">
    <div class="tab-wrap">
        <ul id="header-tabs" class="js-tab-toggle margin0p">
            <li>
                <a href="javascript:void(0)" id="most-active" class="tab-header-a-mo on" onclick="showcontent('most-active');">
                    <span>Most Active</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" id="most-advanced" onclick="showcontent('most-advanced');">
                    <span>Most Advanced</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" id="most-declined" onclick="showcontent('most-declined');">
                    <span>Most Declined</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" id="dollar-volume" onclick="showcontent('dollar-volume');">
                    <span>Dollar Volume</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" id="unusual-volume" onclick="showcontent('unusual-volume');">
                    <span>Unusual Volume</span>
                </a>
            </li>
            <!--
            <li>
                <a href="javascript:void(0)" id="my-list" onclick="showcontent('my-list');">
                    <span>My List</span>
                </a>
            </li>
            -->
        </ul>
    </div>
    
    <div class="clearB"></div>

    <div class="tab-pane active" id="Mostactive">
        <!--<h2><span id="MostActiveVolume1_MostactiveTitle">Most Active Share Volume</span></h2>-->
        <div class="genTable thin marginT10px">
            <table>
                
                        <tr>
                            <th>Company</th>
                            <th>Last Sale<sup>*</sup></th>
                            <th>Change Net / %</th>
                            <th>Share Volume</th>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/FB.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/fb'>Facebook, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/fb'>(FB)</a>
                                </div>
                            </td>
                            <td>$67.41</td>
                            <td><span class='red'>1.05&nbsp;&#9660;&nbsp;1.53%</td>
                            <td>55,331,160</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/CSCO.GIF><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/csco'>Cisco Systems, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/csco'>(CSCO)</a>
                                </div>
                            </td>
                            <td>$21.57</td>
                            <td><span class='red'>0.23&nbsp;&#9660;&nbsp;1.06%</td>
                            <td>36,651,376</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/QQQQ.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/qqq'>PowerShares QQQ Trust, Series 1</a>&nbsp;<a href='http://www.nasdaq.com/symbol/qqq'>(QQQ)</a>
                                </div>
                            </td>
                            <td>$89.68</td>
                            <td><span class='red'>0.66&nbsp;&#9660;&nbsp;0.73%</td>
                            <td>35,780,979</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/MU.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/mu'>Micron Technology, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/mu'>(MU)</a>
                                </div>
                            </td>
                            <td>$24.48</td>
                            <td><span class='green'>0.29&nbsp;&#9650;&nbsp;1.20%</td>
                            <td>33,804,874</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/ZNGA.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/znga'>Zynga Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/znga'>(ZNGA)</a>
                                </div>
                            </td>
                            <td>$5.24</td>
                            <td><span class='green'>0.18&nbsp;&#9650;&nbsp;3.56%</td>
                            <td>31,384,969</td>
                        </tr>
                        
                    
            </table>
            <div class="floatL paddingT5px">
                <small class="date">As of 3/3/2014 4:00:00 PM</small>
            </div>
            <div class="floatR paddingT10px">
                <a href="../aspx/mostactive.aspx?exchange=nasdaq&mostactive=SHR" target="_top" class="blue-button">
                    <span>View More</span>
                </a>
                <div class="clearB"></div>
            </div>
        </div><!-- genTable -->
    </div><!-- Mostactive -->

    <div class="tab-pane" id="Advancers">
        <!--<h2><span id="MostActiveVolume1_Label1">Most Advanced</span></h2>-->
        <div class="genTable thin marginT10px">
            <table>
                
                        <tr>
                            <th>Company</th>
                            <th>Last Sale<sup>*</sup></th>
                            <th>Change Net / %</th>
                            <th>Share Volume</th>
                        </tr>
                    
                    <tr>
                    <td class="symbol_links_td">
                        <div class="coLogo"><img src=http://content.nasdaq.com/logos/vimc.gif><br /></div>
                        <div class="coName">
                            <a href='http://www.nasdaq.com/symbol/vimc'>Vimicro International Corporation</a>&nbsp;<a href='http://www.nasdaq.com/symbol/vimc'>(VIMC)</a>
                        </div>
                    </td>
                    <td>$4.24 </td>
                    <td><span class='green'>1.28&nbsp;&#9650;&nbsp;43.24% </td>
                    <td>2,233,173 </td>
                    </tr>
                    
                    
                    <tr>
                    <td class="symbol_links_td">
                        <div class="coLogo"></div>
                        <div class="coName">
                            <a href='http://www.nasdaq.com/symbol/fate'>Fate Therapeutics, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/fate'>(FATE)</a>
                        </div>
                    </td>
                    <td>$9 </td>
                    <td><span class='green'>2.03&nbsp;&#9650;&nbsp;29.12% </td>
                    <td>102,634 </td>
                    </tr>
                    
                    
                    <tr>
                    <td class="symbol_links_td">
                        <div class="coLogo"><img src=http://content.nasdaq.com/logos/CCIH.gif><br /></div>
                        <div class="coName">
                            <a href='http://www.nasdaq.com/symbol/ccih'>ChinaCache International Holdings Ltd.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/ccih'>(CCIH)</a>
                        </div>
                    </td>
                    <td>$26.07 </td>
                    <td><span class='green'>4.97&nbsp;&#9650;&nbsp;23.55% </td>
                    <td>1,731,665 </td>
                    </tr>
                    
                    
                    <tr>
                    <td class="symbol_links_td">
                        <div class="coLogo"><img src=http://content.nasdaq.com/logos/BUR.gif><br /></div>
                        <div class="coName">
                            <a href='http://www.nasdaq.com/symbol/bur'>Burcon Nutrascience Corp</a>&nbsp;<a href='http://www.nasdaq.com/symbol/bur'>(BUR)</a>
                        </div>
                    </td>
                    <td>$3.80 </td>
                    <td><span class='green'>0.71&nbsp;&#9650;&nbsp;22.98% </td>
                    <td>3,160 </td>
                    </tr>
                    
                    
                    <tr>
                    <td class="symbol_links_td">
                        <div class="coLogo"><img src=http://content.nasdaq.com/logos/RDNT.gif><br /></div>
                        <div class="coName">
                            <a href='http://www.nasdaq.com/symbol/rdnt'>RadNet, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/rdnt'>(RDNT)</a>
                        </div>
                    </td>
                    <td>$2.29 </td>
                    <td><span class='green'>0.35&nbsp;&#9650;&nbsp;18.04% </td>
                    <td>2,171,436 </td>
                    </tr>
                    
                    
            </table>
            <div class="floatL paddingT5px">
                <small class="date">As of 3/3/2014 4:00:00 PM</small>
            </div>
            <div class="floatR paddingT10px">
                <a href="../aspx/mostactive.aspx?exchange=nasdaq&mostactive=ADV" target="_top" class="blue-button">
                    <span>View More</span>
                </a>
                <div class="clearB"></div>
            </div>
        </div>
    </div>

    <div class="tab-pane" id="Decliners">
        <!--<h2><span id="MostActiveVolume1_Label2">Most Declined</span></h2>-->
        <div class="genTable thin marginT10px">
            <table>
                
                        <tr>
                            <th>Company</th>
                            <th>Last Sale<sup>*</sup></th>
                            <th>Change Net / %</th>
                            <th>Share Volume</th>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/QIWI.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/qiwi'>QIWI plc</a>&nbsp;<a href='http://www.nasdaq.com/symbol/qiwi'>(QIWI)</a>
                                </div>
                            </td>
                            <td>$38.82 </td>
                            <td><span class='red'>7.81&nbsp;&#9660;&nbsp;16.75% </td>
                            <td>2,104,610</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/YNDX.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/yndx'>Yandex N.V.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/yndx'>(YNDX)</a>
                                </div>
                            </td>
                            <td>$32.25 </td>
                            <td><span class='red'>5.25&nbsp;&#9660;&nbsp;14.00% </td>
                            <td>21,244,264</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/GEVA.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/geva'>Synageva BioPharma Corp.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/geva'>(GEVA)</a>
                                </div>
                            </td>
                            <td>$101.36 </td>
                            <td><span class='red'>13.31&nbsp;&#9660;&nbsp;11.61% </td>
                            <td>583,270</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/nlnk'>NewLink Genetics Corporation</a>&nbsp;<a href='http://www.nasdaq.com/symbol/nlnk'>(NLNK)</a>
                                </div>
                            </td>
                            <td>$39.08 </td>
                            <td><span class='red'>5.12&nbsp;&#9660;&nbsp;11.58% </td>
                            <td>1,120,786</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/SPPR.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/spprp'>Supertel Hospitality, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/spprp'>(SPPRP)</a>
                                </div>
                            </td>
                            <td>$5.92 </td>
                            <td><span class='red'>0.76&nbsp;&#9660;&nbsp;11.38% </td>
                            <td>8,736</td>
                        </tr>
                        
                    
            </table>
            <div class="floatL paddingT5px">
                <small class="date">As of 3/3/2014 4:00:00 PM</small>
            </div>
            <div class="floatR paddingT10px">
                <a href="../aspx/mostactive.aspx?exchange=nasdaq&mostactive=DEC" target="_top" class="blue-button">
                    <span>View More</span>
                </a>
                <div class="clearB"></div>
            </div>
        </div>
    </div>

    <div class="tab-pane" id="DollarVolume">
        <!--<h2><span id="MostActiveVolume1_Label3">Most Dollar Volume</span></h2>-->
        <div class="genTable thin marginT10px">
            <table>
                
                        <tr>
                            <th>Company</th>
                            <th>Last Sale<sup>*</sup></th>
                            <th>Change Net / %</th>
                            <th>Share Volume</th>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/AAPL.GIF><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/aapl'>Apple Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/aapl'>(AAPL)</a>
                                </div>
                            </td>
                            <td>$527.76 </td>
                            <td><span class='green'>1.52&nbsp;&#9650;&nbsp;0.29% </td>
                            <td>8,529,092</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/FB.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/fb'>Facebook, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/fb'>(FB)</a>
                                </div>
                            </td>
                            <td>$67.41 </td>
                            <td><span class='red'>1.05&nbsp;&#9660;&nbsp;1.53% </td>
                            <td>56,831,684</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/QQQQ.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/qqq'>PowerShares QQQ Trust, Series 1</a>&nbsp;<a href='http://www.nasdaq.com/symbol/qqq'>(QQQ)</a>
                                </div>
                            </td>
                            <td>$89.67 </td>
                            <td><span class='red'>0.67&nbsp;&#9660;&nbsp;0.74% </td>
                            <td>38,887,105</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/TSLA.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/tsla'>Tesla Motors, Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/tsla'>(TSLA)</a>
                                </div>
                            </td>
                            <td>$250.56 </td>
                            <td><span class='green'>5.75&nbsp;&#9650;&nbsp;2.35% </td>
                            <td>13,090,307</td>
                        </tr>
                        
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/GOOG.gif><br /></div>
                                <div class="coName">
                                    <a href='http://www.nasdaq.com/symbol/goog'>Google Inc.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/goog'>(GOOG)</a>
                                </div>
                            </td>
                            <td>$1,202.69 </td>
                            <td><span class='red'>12.96&nbsp;&#9660;&nbsp;1.07% </td>
                            <td>2,101,198</td>
                        </tr>
                        
                    
            </table>
            <div class="floatL paddingT5px">
                <small class="date">As of 3/3/2014 4:00:00 PM</small>
            </div>
            <div class="floatR paddingT10px">
                <a href="../aspx/mostactive.aspx?exchange=nasdaq&mostactive=DOV" target="_top" class="blue-button">
                    <span>View More</span>
                </a>
                <div class="clearB"></div>
            </div>
        </div>
    </div>

    <!--
    <div class="tab-pane" id="MyList">
        <h3>My List</h3>
        <script language="javascript" type="text/javascript">
        </script>
        <div class="mylist_new">
            You can <a href="/reference/MyNasdaqConfig.stm">edit your list</a> by changing the stock symbols on the My NASDAQ page.
        </div>
        <div class="genTable thin marginT10px">
            <div id="MyListTableDiv"></div>
        </div>
        <div id="MostActiveVolume1_SetMyListPanel">
	
            <div class="mylist_edit">
                Please click on the link to edit your list 
                <a href="/reference/MyNasdaqConfig.stm">Set Up</a>
            </div>
        
</div>
    </div>
    -->

    <div class="tab-pane" id="UnusualVolume">
        <div class="genTable thin marginT10px">
            <table>
                <tr>
                    <th>Company</th>
                    <th>Last Sale</th>
                    <th>Price Change Net / %</th>
                    <th>Share Volume</th>
                    <th>Volume % Change</th>
                </tr>
                
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"></div>
                                <div class="coName"><a href='http://www.nasdaq.com/symbol/vhc'>VirnetX Holding Corp</a>&nbsp;<a href='http://www.nasdaq.com/symbol/vhc'>(VHC)</a></div>
                            </td>
                            <td nowrap>$20.93</td>
                            <td nowrap><span class="green">1.43&nbsp;&#9650;&nbsp;7.33%</td>
                            <td>5,468,234</td>
                            <td><b>1332%</b></td>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/PERI.GIF><br /></div>
                                <div class="coName"><a href='http://www.nasdaq.com/symbol/peri'>Perion Network Ltd</a>&nbsp;<a href='http://www.nasdaq.com/symbol/peri'>(PERI)</a></div>
                            </td>
                            <td nowrap>$13.14</td>
                            <td nowrap><span class="green">1.21&nbsp;&#9650;&nbsp;10.14%</td>
                            <td>2,094,083</td>
                            <td><b>1035%</b></td>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"></div>
                                <div class="coName"><a href='http://www.nasdaq.com/symbol/lo'>Lorillard, Inc</a>&nbsp;<a href='http://www.nasdaq.com/symbol/lo'>(LO)</a></div>
                            </td>
                            <td nowrap>$53.61</td>
                            <td nowrap><span class="green">4.55&nbsp;&#9650;&nbsp;9.27%</td>
                            <td>25,705,347</td>
                            <td><b>706%</b></td>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"></div>
                                <div class="coName"><a href='http://www.nasdaq.com/symbol/sqqq'>ProShares UltraPro Short QQQ </a>&nbsp;<a href='http://www.nasdaq.com/symbol/sqqq'>(SQQQ)</a></div>
                            </td>
                            <td nowrap>$52.27</td>
                            <td nowrap><span class="green">1.11&nbsp;&#9650;&nbsp;2.17%</td>
                            <td>7,275,784</td>
                            <td><b>668%</b></td>
                        </tr>
                    
                        <tr>
                            <td class="symbol_links_td">
                                <div class="coLogo"><img src=http://content.nasdaq.com/logos/CGEN.GIF><br /></div>
                                <div class="coName"><a href='http://www.nasdaq.com/symbol/cgen'>Compugen Ltd.</a>&nbsp;<a href='http://www.nasdaq.com/symbol/cgen'>(CGEN)</a></div>
                            </td>
                            <td nowrap>$11.87</td>
                            <td nowrap><span class="green">.53&nbsp;&#9650;&nbsp;4.67%</td>
                            <td>1,297,319</td>
                            <td><b>426%</b></td>
                        </tr>
                    
                
                </tr>
            </table>
            <div class="floatL paddingT5px">
                <small class="date">
		        	
			        <p class="date">As of 3/3/2014 4:06:00 PM</p>
			        
                </small>
            </div>
            <div class="floatR paddingT10px">
                <a href="../markets/unusual-volume.aspx" target="_top" class="blue-button">
                    <span>View More</span>
                </a>
                <div class="clearB"></div>
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        getDisplayActive();
    </script>
</div>
            
            <div class="clearB"></div>
            <hr />

            <div class="grid expected-ipo">
                <div class="grid__1-2">
                


 <h3>
    Upcoming IPOs
    
</h3>

<!-- begin removed for the panel design 
<table border="0" cellpadding="0" cellspacing="0" class="sectiontable" style="display:none">
<tr>
	<td colspan="2"><b>Upcoming IPOs
        for the week of 3/3/2014</b></td>
</tr>
</table>
end removed for the panel design -->
<div id="homeipo_panelIPO">
	
 
                    <div id="HomepageIPO1_panelIPO">
                        <div class="genTable thin">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Price Range</th>
                                    </tr>
                                </thead>
                                
    <tr >
		<td><a id="homeipo_IPOTable_co_link_0" href="http://www.nasdaq.com/markets/ipos/company/dipexium-pharmaceuticals-llc-833984-74572">DIPEXIUM PHARMACEUTICA</a></td>
     
		<td>$12.00 - $14.00</td>
	</tr>
	
    <tr class='genTablealt'>
		<td><a id="homeipo_IPOTable_co_link_1" href="http://www.nasdaq.com/markets/ipos/company/achaogen-inc-647671-74489">ACHAOGEN INC</a></td>
     
		<td>$12.00 - $14.00</td>
	</tr>
	
    <tr >
		<td><a id="homeipo_IPOTable_co_link_2" href="http://www.nasdaq.com/markets/ipos/company/diamond-s-shipping-group-inc-926320-74561">DIAMOND S SHIPPING GRO</a></td>
     
		<td>$14.00 - $16.00</td>
	</tr>
	

	</table>
     </div>
	<h4><a href="http://www.nasdaq.com/markets/ipos/">View the IPO Center</a></h4>  
    </div>  

</div>
                             




                   
                </div><!--//grid__1-2-->
                <div class="grid__1-2">
                    <h3>Economic Calendar</h3>
                    <!-- START Economic Events & Analysis box -->
                    <div id="econEventsAnalysis">
                        <div class="genTable thin">
                            <!--
                            <table>
                                <tr>
                                    <th>Time</th>
                                    <th>Name</th>
                                </tr>
                            </table>
                            -->
                            <script type="text/javascript" src="http://anasdaq.econoday.com/nasdaqnew.js"></script>
                        </div>
                        <h4>
                            <a title="Economic Calendar" href="http://www.nasdaq.com/markets/us-economic-calendar.aspx">View Economic Events &amp; Analysis</a>
                        </h4>
                    </div>
                    <!-- END Economic Events & Analysis box -->
                </div><!--//grid__1-2-->
            </div><!--//grid-->

            <div class="grid earnings-content">
                <hr /><h2>Earnings</h2>
                

<div class="grid__1-3">
                    <h3 class="marginT0p">Earnings Calendar</h3>
                                
                    <!--// START homeearnings.ascx Split (Earnings Calendar) -->
                    <div id="home-earnings-calendar">
                        
                        <p>Visit <a href="http://www.nasdaq.com/earnings/earnings-calendar.aspx">Earnings Calendar </a> for the week starting 03/04; <span id="earningsreport_lreports">415</span> reports are scheduled.</p>
                        
                        <h4><a href="http://www.nasdaq.com/earnings/earnings-calendar.aspx">View Earnings Calendar</a></h4>
                    </div>
                    <!--// END homeearnings.ascx Split (Earnings Calendar) -->
                    
                </div>

 
 <div class="grid__1-3">
                    <!--// START homeearnings.ascx Split (Earnings Report) -->
                    <div id="home-earnings-report">
                    <h3>Earnings Report</h3>
         <a href="http://www.nasdaq.com/symbol/bns/press-releases">Bank of Nova Scotia (The) is expected to report earnings</a>
                        <p>
                            <span id="earningsreport_lreportmsg">See quotes for others reporting</span>
					<a href="http://www.nasdaq.com/symbol/azo/premarket">AZO</a>
					<a href="http://www.nasdaq.com/symbol/insy/premarket">INSY</a>
					<a href="http://www.nasdaq.com/symbol/salt/premarket">SALT</a>
					<a href="http://www.nasdaq.com/symbol/tsl/premarket">TSL</a>
					<a href="http://www.nasdaq.com/symbol/ssp/premarket">SSP</a>
					<a href="http://www.nasdaq.com/symbol/brli/premarket">BRLI</a>
					<a href="http://www.nasdaq.com/symbol/trib/premarket">TRIB</a>
					<a href="http://www.nasdaq.com/symbol/jrn/premarket">JRN</a>
					<a href="http://www.nasdaq.com/symbol/gtiv/premarket">GTIV</a>
					<a href="http://www.nasdaq.com/symbol/oxfd/premarket">OXFD</a>
					<a href="http://www.nasdaq.com/symbol/mcgc/premarket">MCGC</a>
                           
                        </p>
                    </div>
                    <!--// END homeearnings.ascx Split (Earnings Report) -->
                    
                </div>
                <div class="grid__1-3">

                    <!--// START homeearnings.ascx Split (Earnings Quote) -->
                    <div id="home-earning-quote" class="borderAll">
                    <span id="earningsreport_QuotesDataLable"><div class="earnings-img">BNS</div><div><div><a href="http://www.nasdaq.com/symbol/bns/premarket">BNS</a><div class="clearB paddingT5px"></div><span class="red">&#9660;0.36</span></div><div><div><span>$56.87</span><div class="clearB paddingT5px"></div><span class="red">0.63%</span></div></div></div></span>
     		
                        
                    </div>
                    <!--// END homeearnings.ascx Split (Earnings Quote) -->

                </div>
  

            
         
            </div><!--//grid-->

            <div class="grid earnings-charts">
                <div class="grid__1-3">
                    <h3>Recommendations</h3>
                    
					
<div id="Rcontainer">
</div>

<script type="text/javascript">
    function displayRecommendations()
    {

        var colors = Highcharts.getOptions().colors,
            categories = ['Upgrades', 'Downgrades', 'Coverage Initiated'],
            name = 'Recommendations',
            data = [{
                    y: 6,  //upgrades
                    color: colors[0]
                                   }, {
                    y: 9, //downgrades
                    color: colors[0]
                }, {
                    y: 15, //Coverage Initiated 
                    color: colors[3]
                }];

        function setChart(name, categories, data, color) {
                                                chart.xAxis[0].setCategories(categories, false);
                                                chart.series[0].remove(false);
                                                chart.addSeries({
                                                                name: name,
                                                                data: data,
                                                                color: color || 'white'
                                                }, false);
                                                chart.redraw();
        }

        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'Rcontainer',
                type: 'column'
            },
            title: {
                text: ''
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: categories
            },
            yAxis: {
                title: {
                    text: ''
                }
            },
            plotOptions: {
                column: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                var drilldown = this.drilldown;
                                if (drilldown) { // drill down
                                    setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                                } else { // restore
                                    setChart(name, categories, data);
                                }
                            }
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        color: colors[0],
                        style: {
                            fontWeight: 'bold'
                        },
                        formatter: function() {
                            return this.y;
                        }
                    }
                }
            },
           tooltip: {
                formatter: function() {
                    var point = this.point,
                        s = this.x +':<b>'+ this.y +'</b>';
                    if (point.drilldown) {
                        s += '';
                    } else {
                        s += '';
                    }
                    return s;
                }
            },
            series: [{
                name: name,
                data: data,
                color: 'white'
            }],
            exporting: {
                enabled: false
            }
        });
    }
</script>
                </div>
                <div class="grid__1-3">
                    <h3>Forecasts</h3> 
                    
					
<div id="earningforecastcontainer">
</div>

<script type="text/javascript">
    function displayEarningForecast()
		{
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'earningforecastcontainer',
                    type: 'bar'
                },
                title: {
                    text: ''
                },
                xAxis: {
                    categories: ['Increases', 'Decreases'],
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    formatter: function () {
                        return '' +
                    this.series.name + ': ' + this.y + '';
                    }
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                navigation: {
                    buttonOptions: {
                        enabled: false
                    }
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: 'Analyst Forecast Changes',
                    data: [198, 506]  //265 is the Increases, 401 are the decreases
                }]
            });
        }
</script>
                </div>
                <div class="grid__1-3">
                    <h3>Surprises</h3> 
                    
					
<div id="earningsurprisecontainer">
</div>

<script type="text/javascript">
    function displayEarningSurprise()
    {

        var colors = Highcharts.getOptions().colors,
            categories = ['<a href="http://www.nasdaq.com/earnings/daily-earnings-surprise.aspx#Exceeded">Upgrades</a>', '<a href="http://www.nasdaq.com/earnings/daily-earnings-surprise.aspx#Met">Met</a>', '<a href="http://www.nasdaq.com/earnings/daily-earnings-surprise.aspx#Failed To Meet">Failed</a>', '<a href="http://www.nasdaq.com/earnings/earnings-calendar.aspx">Expected Reports</a>'],
            name = 'Company Earnings',
            data = [{
                    y: 5, //Exceeded
                    color: colors[0]
                                   }, {
                    y: 0, //Met
                    color: colors[0]
                }, {
                    y: 6, //Failed
                    color: colors[0]
                }, {
                    y: 412, //Expected Reports
                    color: colors[3]
                    }];

        function setChart(name, categories, data, color) {
                                                chart.xAxis[0].setCategories(categories, false);
                                                chart.series[0].remove(false);
                                                chart.addSeries({
                                                                name: name,
                                                                data: data,
                                                                color: color || 'white'
                                                }, false);
                                                chart.redraw();
        }

        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'earningsurprisecontainer',
                type: 'column'
            },
            title: {
                text: ''
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: categories
            },
            yAxis: {
                title: {
                    text: ''
                }
            },
            plotOptions: {
                column: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function() {
                                var drilldown = this.drilldown;
                                if (drilldown) { // drill down
                                    setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
                                } else { // restore
                                    setChart(name, categories, data);
                                }
                            }
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        color: colors[0],
                        style: {
                            fontWeight: 'bold'
                        },
                        formatter: function() {
                            return this.y;
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    var point = this.point,
                        s = this.x +':<b>'+ this.y +'</b>';
                    if (point.drilldown) {
                        s += '';
                    } else {
                        s += '';
                    }
                    return s;
                }
            },
            series: [{
                name: name,
                data: data,
                color: 'white'
            }],
            exporting: {
                enabled: false
            }
        });
    }
</script>
                </div>
            </div><!--//grid-->
            
            <div class="grid etf-content">
                
<!-- Begin ETF Performance -->


  
                <hr /><h2>ETFs</h2>
                <div class="grid__1-3">
                    <h3>Decliners</h3> 

                    <!--// START ETF Decliners Mockup -->
                    <div class="down">
                        <div class="floatL">
                            <ul>
                             
                
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:100%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:58.829932075711%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:52.1087428718484%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:50.0060008929329%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:48.1999430606183%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
            </ul>
                        </div>
                        <div class="floatL">
                            <ul>
                              
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/rsx">RSX</a> -6.87%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/gulf">GULF</a> -4.04%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/ewo">EWO</a> -3.58%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/ewg">EWG</a> -3.44%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/ewi">EWI</a> -3.31%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                            </ul>
                        </div>
                    </div>
                    <!--// END ETF Decliners Mockup -->
                    
                </div>
                <div class="grid__1-3">
                    <h3>Advancers</h3>
                    
                    <!--// START ETF Advancers Mockup -->
                    <div class="up">
                        <div class="floatL">
                            <ul>
                              
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/uvxy">UVXY</a> 11.23%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/tvix">TVIX</a> 10.87%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/vxx">VXX</a> 5.49%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/bzq">BZQ</a> 5.04%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                                <li>
                                    <div class="stock-info">
                                        <span>
                                         
                                <a href="http://www.nasdaq.com/symbol/edz">EDZ</a> 4.94%
                           
                                         
                                        </span>
                                    </div>
                                    <div class="clearB"></div>
                                </li>
                                    
                               
                            </ul>
                        </div>
                        <div class="floatL">
                            <ul>

                                
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:100%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:96.8299526716872%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:48.9380883523604%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:44.9209811021703%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                        <li>
                             <div class="percent-wrap">
                                <div class="percent-diff" style="width:44.0089347245572%"></div>
                            </div>
                             <div class="clearB"></div>
                          
                        </li>
                    
                               
                            </ul>
                        </div>
                    </div>
                    <!--// END ETF Advancers Mockup -->

                </div>

<!--end etf-panels div-->
                <div class="grid__1-3">
                    <h3><a href="http://www.nasdaq.com/investing/etfs/">ETF Headlines</a></h3>
                    <!--// START ETF Headlines -->                    
                    <!-- Begin MarketNewsAnalysis.inc -->
<ul class="orange-ordered-list marginR0p marginT0p marginB5px">
<li><a href="http://www.nasdaq.com/article/gold-and-bonds-shine-as-russia-leads-global-selloff-cm331813">Gold And Bonds Shine As Russia Leads Global Sell-Off</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/ishares-msci-mexico-capped-eww-enters-oversold-territory-cm331768">iShares MSCI Mexico Capped (EWW) Enters Oversold Territory</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/ukraine-unrest-rattling-etfs-rsx-epol-esr-cm331765">Ukraine Unrest Rattling ETFs (RSX, EPOL, ESR)</a><small>03/03/2014</small></li>
</ul>
<!-- End MarketNewsAnalysis.inc -->

                    <!--// END ETF Headlines -->
                </div>
            </div><!--//grid-->

             <div class="grid hub-headlines">
                <hr />
                <div class="grid__1-3">
                    <h2><a href="http://www.nasdaq.com/options/">Options</a></h2>
                    <div class="marginR15px"> 
                        <!-- Begin MarketNewsAnalysis.inc -->
<ul class="orange-ordered-list marginR0p marginT0p marginB5px">
<li><a href="http://www.nasdaq.com/article/dow-sheds-154-points-as-geopolitical-concerns-dominate-headlines-cm331766">Dow Sheds 154 Points as Geopolitical Concerns Dominate...</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/agco-director-buys-nearly-18-million-in-stock-cm331703">AGCO director buys nearly $18 million in stock</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/interesting-january-2015-stock-options-for-wmt-cm331610">Interesting January 2015 Stock Options for WMT</a><small>03/03/2014</small></li>
</ul>
<!-- End MarketNewsAnalysis.inc -->

                    </div>
                </div>
                <div class="grid__1-3">
                    <h2><a href="http://community.nasdaq.com/articles-by-category.aspx?category=economy">Economy</a></h2>
                    <!--// START Economy Headlines -->
                    <div id="econ-stories" class="marginR15px">
                        <ul class="orange-ordered-list marginR0p marginT0p marginB5px">
                            <!-- Begin MarketNewsAnalysis.inc -->
	
<li><a href="http://www.nasdaq.com/article/a-tough-spring-ahead-for-stocks-cm331831">A Tough Spring Ahead for Stocks?</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/midafternoon-market-update-ukrainian-crisis-still-weighs-on-select-equities-as-plug-power-rallies-on-cowen-note-cm331786">Mid-Afternoon Market Update: Ukrainian Crisis Still Weighs...</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/midday-market-update-akorn-shares-slip-after-downbeat-outlook-dendreon-gains-cm331695">Mid-Day Market Update: Akorn Shares Slip After Downbeat...</a><small>03/03/2014</small></li>

<!-- End MarketNewsAnalysis.inc -->

                        </ul>
                    </div>
                    <!--// END Economy Headlines -->
                </div>
                <div class="grid__1-3">
                    <h2><a href="http://www.nasdaq.com/investing/forex/">Forex and Currencies</a></h2>
                    <!--// START Forex and Currencies Headlines -->
                    <div id="forex-currencies-stories">
                        <ul class="orange-ordered-list marginR0p marginT0p marginB5px">
                           <!-- Begin MarketNewsAnalysis.inc -->
	
<li><a href="http://www.nasdaq.com/article/mt-gox-bankruptcy-will-force-changes-in-bitcoin-cm331153">Mt. Gox Bankruptcy Will Force Changes In Bitcoin</a><small>02/28/2014</small></li>
<li><a href="http://www.nasdaq.com/article/bitcoin-boom-bubble-and-bust-cm327206">Bitcoin: Boom, Bubble and Bust</a><small>02/18/2014</small></li>
<li><a href="http://www.nasdaq.com/article/the-next-altcoin-to-hit-20-million-cm323873">The Next Altcoin To Hit $20 Million?</a><small>02/05/2014</small></li>

<!-- End MarketNewsAnalysis.inc -->

                        </ul>
                    </div>
                    <!--// END Forex and Currencies Headlines -->
                </div>
                <div class="grid__1-3">
                    <h2><a href="http://www.nasdaq.com/investing/">Investing</a></h2>
                    <!--// START Forex and Currencies Headlines -->
                    <div id="investing-stories">
                        <ul class="orange-ordered-list marginR0p marginT0p marginB5px">
                            <!-- Begin MarketNewsAnalysis.inc -->
	
<li><a href="http://www.nasdaq.com/article/air-products-eyes-more-growth-in-industrial-gas-market-cm331790">Air Products Eyes More Growth In Industrial Gas Market</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/realty-income-moves-up-in-market-cap-rank-passing-kimco-realty-cm331793">Realty Income Moves Up In Market Cap Rank, Passing Kimco...</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/darling-international-larger-than-sampp-500-component-cliffs-natural-resources-cm331796">Darling International Larger Than S&amp;P 500 Component...</a><small>03/03/2014</small></li>

<!-- End MarketNewsAnalysis.inc -->

                        </ul>
                    </div>
                    <!--// START Forex and Currencies Headlines -->
                </div>
                <div class="grid__1-3">
                    <h2><a href="http://www.nasdaq.com/personal-finance/retirement.aspx">Retirement</a></h2>
                    
                    <!--// START Retirement Headlines -->
                    <div id="retirement-stories">
                        <ul class="orange-ordered-list marginR0p marginT0p marginB5px">
                            <!-- Begin MarketNewsAnalysis.inc -->
	
<li><a href="http://www.nasdaq.com/article/5-best-retirement-spots-in-the-us-cm331530">5 Best Retirement Spots in the U.S.</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/dont-fall-into-these-social-security-traps-cm331490">Don&#39;t Fall Into These Social Security Traps</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/7-retirement-investing-mistakes-cm330953">7 Retirement Investing Mistakes</a><small>02/28/2014</small></li>

<!-- End MarketNewsAnalysis.inc -->

                        </ul>
                    </div>
                    <!--// END Retirement Headlines -->
                    
                </div>
                <div class="grid__1-3">
                    <h2><a href="http://www.nasdaq.com/personal-finance/">Personal Finance</a></h2>
                    <!--// START Personal Finance Headlines -->
                    <div id="pf-stories">
                        <ul class="orange-ordered-list marginR0p marginT0p marginB5px">
                            <!-- Begin MarketNewsAnalysis.inc -->
<ul class="orange-ordered-list marginR0p marginT0p marginB5px">
<li><a href="http://www.nasdaq.com/article/air-products-eyes-more-growth-in-industrial-gas-market-cm331790">Air Products Eyes More Growth In Industrial Gas Market</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/what-is-a-blog-and-why-should-small-business-care-cm331761">What is a blog and why should small business care?</a><small>03/03/2014</small></li>
<li><a href="http://www.nasdaq.com/article/personal-tax-software-which-one-is-the-best-cm331701">Personal Tax Software: Which One Is The Best?</a><small>03/03/2014</small></li>
</ul>
<!-- End MarketNewsAnalysis.inc -->

                        </ul>
                    </div>
                    <!--// END Personal Finance Headlines -->
                </div>
            </div><!--//grid-->
        </div><!--//end grid__3-4-->
  
        <div class="grid__1-4 site__sidebar">
            <div class="sidebar__ad--300x280 sidebar--section" style="height:250px">
                <script type="text/javascript">makeAd('4','300x250',is_dartSite,is_dartZone,'','', true);</script>
            </div>
      
            <div class="divider"></div>

            <div class="sidebar__marketsite sidebar--section">
                <h2>Today at NASDAQ OMX</h2>
                <div class="sidebar__marketsite--event cycle-slideshow"
                    data-cycle-slides="> a"
                    data-cycle-prev=".cycle-prev"
                    data-cycle-next=".cycle-next"
                    data-cycle-timeout=0
                    data-cycle-loader=wait
                    data-cycle-auto-height="container">
                    <script>
                        var marketsiteTemplate = '<a href="$url" title="$cname Marketsite Event">' +
                                            '<img width="334" height="189" src="$imgurl" alt="$cname Marketsite Event" />' +
                                            '<div style="padding:10px 0 0 30px;width:270px;">' +
                                                '<h2>$cname</h2>' +
                                            '</div>' +
                                        '</a>';
                        marketEventDisplay();
                    </script>
                     <a href="http://www.nasdaq.com/marketsite/marketsite-events-detail.aspx?fn=201401-open01092014.txt" title="Microsoft Corporation Marketsite Event">
                        <img width="334" height="189" src="http://www.nasdaq.com/reference/hiresphotos/201401images/mo_010914a.jpg" alt="Microsoft Corporation Marketsite Event" />
                        <div style="padding:10px 0 0 30px;width:270px;">
                            <h2>Microsoft Corporation</h2>
                        </div>
                    </a>
                    <a href="http://www.nasdaq.com/marketsite/marketsite-events-detail.aspx?fn=201401-open01082014.txt" title="Einstein Noah Restaurant Group, Inc. Marketsite Event">
                        <img width="334" height="189" src="http://www.nasdaq.com/reference/hiresphotos/201401images/mo_010814a.jpg" alt="Einstein Noah Restaurant Group, Inc. Marketsite Event" />
                        <div style="padding:10px 0 0 30px;width:270px;">
                            <h2>Einstein Noah Restaurant Group</h2>
                        </div>
                    </a>
	            </div>
	            <!-- Offset depends on height of image; could do this programmatically -->
	            <!-- pos: absolute it set in scss/sidebar/_cycle.scss:24 -->
	            <div class="cycle-prev"></div>
	            <div class="cycle-next"></div>
	            
	            <script type="text/javascript">
	            var slideshows = $('.cycle-slideshow').on('cycle-prev cycle-next', function(e, opts) {
	                // advance the other slideshow
	                slideshows.not(this).cycle('goto', opts.currSlide);
	            });
	            </script>
            </div><!--//sidebar-section-->
      
            <div class="divider"></div>

            <div class="sidebar__brokers">
                <h2>Featured Brokers</h2>
                <ul>
                    <li class="broker">
                        <div class="marginB15px">
                            <script type="text/javascript" language="JavaScript">makeAd('4','120x60','home','panel1_ul','','');</script>
                        </div>
                    </li>
                    <li class="broker">
                        <div class="marginB15px">
                            <script type="text/javascript" language="JavaScript">                                makeAd('5', '120x60', 'home', 'panel1_ur', '', '');</script>
                        </div>
                    </li>
                    <li class="broker">
                        <div>
                            <script type="text/javascript" language="JavaScript">                                makeAd('6', '120x60', 'home', 'panel1_ll', '', '');</script>
                        </div>
                    </li>
                    <li class="broker">
                        <div>
                            <script type="text/javascript" language="JavaScript">                                makeAd('7', '120x60', 'home', 'panel1_lr', '', '');</script>
                        </div>
                    </li>
                </ul>
                <div class="clearB paddingB10px"></div>
                <a href="http://www.nasdaq.com/investing/online-brokers/" class="blue-button floatR">
                    Compare Online Brokers
                </a>
                <div class="clearB"></div>
            </div>

            <div class="divider"></div>

            <div class="compare__rates">
                <form method="post" action="" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="583F9945" />
	<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="Mfip6uROP+RTbDgKmlj+3fwDqjG8VXQ9tuZ84GDi8FveaMtvBarMGMcFfKqGDrnpxw4eXx0umXnX3naQzV6FwSp7XGy62JLlyrHSYeqfXo/aie+RVQ35LF5jdYcnzXSyWlg+1HOT9kiMDQiA7H9iCVUSHIy3k1SJTKEqRNpP3adyJbcWRulmh0hQB4Pote3OR3+1zeU+yiu4pgvJAppRcMwcSpDIHo5+1nLndkp5m+vnOaO8b11oDDTm2ewcaFsA4gEssKSbKrKKcCQRYriBA13wNR+xHknVVf85P/EKkIltldayIbpPMyF8M4Hqz4zrIoFBz5mYFiJOAx9lN9fA7g==" />
</div>
                    
<div id="bankate-cd-widget" class="genTable">
    <h3 class="table-headtag marginB0p">Compare CDs &amp; Investment Rates</h3>
    <table>
        <tr>
            <th colspan="3">
                1. National or local:
            </th>
        </tr>
        <tr style="font-size: 11px;">
            <td colspan="3">
                <input id="national" type="radio" name="bankate1$locale" value="national" checked="checked" /><label for="national"> Nationally available highest yields</label>
                <div class="clearB paddingB5px">
                </div>
                <input id="local" type="radio" name="bankate1$locale" value="local" onclick="focusZip();" /><label for="local"> Locally available</label>
                <div id="zipentry">
                    <div class="clearB paddingB5px">
                    </div>
                    Zip Code:
                    <input name="bankate1$zipcode" type="text" maxlength="5" id="zipcode" size="5" OnBlur="focusLocal()" />
                </div>
            </td>
        </tr>
        <tr>
            <th colspan="3">
                2. Select products to compare:
            </th>
        </tr>
        <tr style="font-size: 11px;">
            <td>
                <input id="mo3" type="radio" name="bankate1$product" value="mo3" /><label for="mo3"> 3 mo CD</label>
                <div class="clearB paddingB5px">
                </div>
                <input id="yr5" type="radio" name="bankate1$product" value="yr5" /><label for="yr5"> 5yr CD</label>
                <div class="clearB paddingB5px">
                </div>
                
            </td>
            <td>
                <input id="mo6" type="radio" name="bankate1$product" value="mo6" /><label for="mo6"> 6 mo CD</label>
                <div class="clearB paddingB5px">
                </div>
                <input id="yr1" type="radio" name="bankate1$product" value="yr1" checked="checked" /><label for="yr1"> 1yr CD</label>
                <div class="clearB paddingB5px">
                </div>
                
            </td>
            <td>
                <input id="yr1Jumbo" type="radio" name="bankate1$product" value="yr1Jumbo" /><label for="yr1Jumbo"> 1yr Jumbo CD</label>
                <div class="clearB paddingB5px">
                </div>
                <input id="yr1JumboIRA" type="radio" name="bankate1$product" value="yr1JumboIRA" /><label for="yr1JumboIRA"> 1yr Jumbo CD IRA</label>
                <div class="clearB paddingB5px">
                </div>
                
				<div class="clearB paddingB5px">
                </div>
				<a id="search" class="blue-button floatR" href="javascript:__doPostBack(&#39;bankate1$search&#39;,&#39;&#39;)">
				    <span>Search</span>
				</a>
            </td>
        </tr>
    </table>
    
    <div>
        
    </div>
    <div>
        
    </div>
</div>
<script type="text/javascript">
    function focusZip() {
        document.getElementById('zipcode').focus();
    }
    function focusLocal() {
        if (document.getElementById('zipcode').value) {
            document.getElementById('national').checked = false;
            document.getElementById('local').checked = true;
        }
    }
</script>
                </form>
            </div>
            <small class="tar">Data Provided by Bankrate.com</small>

            <div class="divider"></div>

            <div class="sidebar__ad--300x250 sidebar--section" style="height:250px">
                <script type="text/javascript">makeAd('8','300x250','btf','home','','', true);</script>
            </div>
      
            <div class="divider"></div>
      
            <div class="sidebar__market-musings">
                		<!-- START includes/homefeaturedauthor.inc -->

                <div class="sidebar__market-musings--author">
                    <h3>Market Musings</h3>
                    <a href="http://www.nasdaq.com/author/martin-tillier">
                        <img width="75" height="75" alt="Martin Tillier" src="http://www.nasdaq.com/images/martin-tillier-75px.jpg" />
                    </a>
                    <p>
                        Martin Tiller's new must-read column on the markets<br /> 
                        <b>Enlightening. Entertaining. Every day. Only at NASDAQ.com.</b>
                    </p>
                </div>
                <ul class="sidebar__market-musings--links">
                    <li>
                        <a href="http://www.nasdaq.com/article/reaction-to-yellens-words-bodes-well-for-the-year-cm330989">Reaction To Yellen's Words Bodes Well For The Year</a>
                       <small>02/28/2014, 9:53 AM</small>
                    </li>
                    <li>
                        <a href="http://www.nasdaq.com/article/where-google-goes-baidu-bidu-follows-very-successfully-cm330707">Where Google Goes, Baidu (BIDU) Follows (Very Successfully)</a>
                         <small>2/27/2014, 1:21 PM</small>
                    </li>

                    <li>
                        <a href="http://www.nasdaq.com/article/why-target-tgt-is-still-a-buy-cm330074">Why Target (TGT) Is Still a Buy</a>
                       <small>02/25/2014, 10:16 AM</small>
                    </li>
                    <li>
                        <a href="http://www.nasdaq.com/article/micron-technologies-mu-200-up-but-still-cheap-cm329653">Micron Technologies (MU): 200% Up, But Still Cheap!</a>
                        <small>02/22/2014, 10:45 AM</small>
                    </li>
                    <li>
                        <a href="http://www.nasdaq.com/article/more-good-news-for-comcast-cmcsa-cm328999">More Good News for Comcast (CMCSA)</a>
                       <small>02/24/2014, 10:05 AM</small>
                    </li>
                </ul>
                <div class="marginT5px"></div>
                <a href="http://www.nasdaq.com/author/martin-tillier" class="blue-button floatR">
                    See Column
                </a>
                <div class="clearB"></div>

		<!-- END includes/homefeaturedauthor.inc -->
            </div>

            
            <div class="divider"></div>

            <div class="sidebar__ceo-signature">
                <a href="http://www.nasdaq.com/author/ceo-signature-series">
                    <img src="http://www.nasdaq.com/images/ceo-signature-series.jpg" width="300" height="150" alt="" />
                </a>
                <ul class="sidebar__ceo-signature--links">
                    <li>
                        <a href="http://www.nasdaq.com/article/pattern-energy-group-inc-pegi-interview-with-michael-garland-president-and-ceo-cm313510">Pattern Energy Group Inc. (PEGI)</a>
                        <small>Michael Garland, President and CEO - Interview</small>
                    </li>
                    <li>
                        <a href="http://www.nasdaq.com/article/lgi-homes-inc-lgih-interview-with-eric-lipar-the-chairman-and-ceo-cm309469">LGI Homes, Inc. (LGIH)</a>
                        <small>Eric Lipar the Chairman and CEO - Interview</small>
                    </li>
                    <li>
                        <a href="http://www.nasdaq.com/article/houghton-mifflin-harcourt-hmhc-interview-with-linda-k-zecher-cm306032">Houghton Mifflin Harcourt (HMHC)</a>
                        <small>Interview with Linda K. Zecher</small>
                    </li>
                </ul>
                <div class="marginT5px"></div>
                <a href="http://www.nasdaq.com/investorscenter/ceo-interviews-signature-series.aspx" class="blue-button floatR">
                    View All
                </a>
                <div class="clearB"></div>
            </div>

     <!--       <div class="divider"></div>

            <div class="sidebar__sponsored">
	            <h3>Sponsored Links</h3>
	            <ul class="sidebar__sponsored--links">
		            <li><a href="javascript:void(0)">Planet vs. Profit: Doing Well by Doing Good</a></li>
		            <li><a href="javascript:void(0)">Dividend Stocks are Out of Favor and Therefore Should be Considered</a></li>
	            </ul>
            </div>-->

            <div class="divider"></div>
            
            <div class="sidebar--section">
                <script type="text/javascript">makeAd('10','285x100','btf','home','','');</script>
            </div>
        </div>
    </div><!--//site__content-->
</div><!--//wrapper-->

<!--begin fixedfooter -->
<style type="text/css">
    .lightgreen-button:link, .lightgreen-button:visited,
    .red-button:link, .red-button:visited {
	color: #ffffff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	display: inline-block;
	cursor: pointer;
	font: 13px/100% Arial, Helvetica, sans-serif;
	font-weight: bold;
	padding: 5px; 
	*padding: 5px;
	position: relative;
	transition: .2s;
	-webkit-transition: .2s;
}
.lightgreen-button:link, .lightgreen-button:visited {
	background: #66BC29;
}
.red-button:link, .red-button:visited{
	background: #D6492A;
}
.lightgreen-button:hover, .lightgreen-button:active,
a.red-button:hover, a.red-button:active { 
	text-decoration: none; 
	transition: .2s;
	-webkit-transition: .2s;
    filter: alpha(opacity=70);
    -moz-opacity: 0.7;
    -khtml-opacity: 0.7;
    opacity: 0.7;
}
textarea {
    padding: 2px 2px 2px 4px;
    border: 1px solid #7fd3ee;
}
</style>
<footer class="site__footer">
        <div class="site__footer--primary">
            <div class="wrapper">
                <a href="http://www.nasdaq.com/" class="logo">
                    <img src="http://www.nasdaq.com/images/nasdaq_logo_2014.png" width="150" />
                </a>
                <div class="floatR">
                    <a href="https://www.facebook.com/NASDAQ" class="icon icon-facebook">
                        <span></span>
                    </a>
                    <a href="https://twitter.com/nasdaq" class="icon icon-twitter">
                        <span></span>
                    </a>
                    <a href="https://plus.google.com/+nasdaq" class="icon icon-google-plus">
                        <span></span>
                    </a>
                </div>
            </div>
        </div>
        <div class="site__footer--secondary">
            <div class="wrapper">
                <nav class="site__footer__nav">
                    <ul>
                        <li><a href="http://www.nasdaq.com/">NASDAQ.com</a></li>
                        <li><a href="http://www.nasdaq.com/quotes/company-news.aspx">Company News</a></li>
                        <li><a href="http://www.nasdaq.com/services/annual-reports.aspx">Annual Report</a></li>
                        <li><a href="http://www.nasdaq.com/help/contact-information.aspx">Contact</a></li>
                        <li><a href="http://www.nasdaq.com/help/nasdaq-advertising.aspx">Advertise on Nasdaq.com</a></li>
                    </ul>
                    <ul>
                        <li><a href="http://www.nasdaqomx.com/">NASDAQ OMX</a></li>
                        <li><a href="http://www.nasdaqomx.com/aboutus">About NASDAQ OMX</a></li>
                        <li><a href="https://listingcenter.nasdaqomx.com/home.aspx">NASDAQ OMX Listing Center</a></li>
                        <li><a href="http://www.nasdaqomx.com/technology/">NASDAQ OMX Technology</a></li>
                        <li><a href="http://ir.nasdaqomx.com/index.cfm">NASDAQ OMX Investor Relations</a></li>
                        <li><a href="http://www.nasdaqomx.com/services/publicpolicyadvocacy/">Public Policy Advocacy</a></li>
                    </ul>
                    <ul class="lighter">
                        <li><a href="http://www.nasdaq.com/about/terms.aspx">Terms of Use</a></li>
                        <li><a href="http://www.nasdaq.com/sitespecific/privacy.aspx">Privacy Policy</a></li>
                        <li><a href="http://www.nasdaq.com/help/sitemap.aspx">Sitemap</a></li>
                        <li><a href="http://www.nasdaq.com/feedback/">General Feedback</a></li>
						<li>
							<!--*************************OpinionLab Begin*****************-->
							<script language="javascript" type="text/javascript" src="http://www.nasdaq.com/services/onlineopinionS3tS/oo_engine.js"></script>
							<script language="javascript" type="text/javascript">O_GoT('<img src="http://www.nasdaq.com/services/onlineopinionS3tS/sm_1E5395_oo.gif" border="0" title="Please give us your feedback" style="margin-right:5px;">Feedback');
							</script>
							<!--*************************OpinionLab End*****************-->
						</li>
                    </ul>
                </nav>
            </div>
        </div>
    </footer>
	<!--// end footer -->

	<!-- begin lightbox backdrop -->
	<table class="backdrop" id="backdrop">
		<tr>
			<td>
				<!-- begin lightboxness -->
				<div class="lightbox edit-stocks" id="edit-stocks" style="width:450px;height:270px;">
                    <div class="floatL">
					    <h2 class="TalignC marginT0px">Edit Favorites</h2>
					    <!-- text -->
						<p>Enter up to 25 symbols separated by commas or spaces in the text box below. These symbols will be available during your session for use on applicable pages.</p>
					    <!-- input box -->
						<div class="floatL">
							<textarea onkeypress="if(event.keyCode ==13){nasdaqIndexRow.myListGo()}else if(event.keyCode == 27){$('.close').click();}" id="myListInput" name="myListInput" cols="35" rows="3" class="fontS14px"></textarea>
						</div>
						<!-- right side controls -->
						<div class="floatL marginL10px">
							<a href="javascript:void(0)" class="lightgreen-button marginB5px TalignC" onclick="nasdaqIndexRow.myListGo();">Update</a>
							<br />
							<a href="javascript:void(0)" class="red-button" onclick="nasdaqIndexRow.clearMyList();">Clear List</a>				
						</div>
				    </div>
				</div>
				<!-- end lightboxness -->
				<!-- begin lightboxness -->
				<div class="lightbox stock-searches" id="stock-searches">
					<h2 class="marginT0px">Customize your NASDAQ.com experience</h2>

					<b>Background Color Selector</b>

					<br />
					<span>Select the background color of your choice:</span>
					<div class="clearB"></div>

					<div class="floatL marginTB10px padding10px borderRadius7px" style="background:#ACE0F4;width:450px;">

						<div class="floatL" style="width:175px">
							<div style="width:120px">
								<div class="floatL"><input type="radio" name="themepreference" value="blackg" onclick="updateSiteTheme(this.value)">&nbsp;Black</div>
								<div class="floatR" style="background-color:#001216;width:21px;*margin-top:3px;height:15px;"></div>
							</div>

							<div class="clearB"></div>

							<div class="marginT5px" style="width:120px">
								<div class="floatL"><input type="radio" name="themepreference" value="slateg" onclick="updateSiteTheme(this.value)">&nbsp;Slate Gray</div>
								<div class="floatR" style="background-color:#414345;width:21px;*margin-top:3px;height:15px;"></div>
							</div>
						</div>

						<div class="floatL">
							<div style="width:120px">
								<div class="floatL"><input type="radio" name="themepreference" value="lightg" onclick="updateSiteTheme(this.value)">&nbsp;Light Gray</div>
								<div class="floatR" style="background-color:#EAEBEC;width:21px;*margin-top:3px;height:15px;"></div>
							</div>

							<div class="clearB"></div>

							<div class="marginT5px" style="width:120px">
								<div class="floatL"><input type="radio" name="themepreference" value="grayb" onclick="updateSiteTheme(this.value)">&nbsp;Gray Blue</div>
								<div  class="floatR" style="background-color:#BECFD9;width:21px;*margin-top:3px;height:15px;"></div>
							</div>
						</div>

					</div>
					
					<div class="clearB"></div>

					<hr /><br />
					<b>Quote Search</b>
					<br />
					<span>Select a default target page for your quote search:</span>
						<div class="marginTB10px padding10px borderRadius7px" style="background:#ACE0F4;width:450px;height:100px;">

						<div class="floatL" style="width:175px">
							<input type="radio" name="quotepreference" value="realtime" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Real-Time<br />
							<input type="radio" name="quotepreference" value="afthours" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;After Hours<br />
							<input type="radio" name="quotepreference" value="premkt" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Pre-Market<br />
							<input type="radio" name="quotepreference" value="compnews" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;News
						</div>
						<div class="floatL">
							<input type="radio" name="quotepreference" value="flash" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Flash Quote<br />
							<input type="radio" name="quotepreference" value="summary" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Summary Quote<br />
							<input type="radio" name="quotepreference" value="dyncharts" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Interactive Charts<br/>
							<input type="radio" name="quotepreference" value="default" onclick="Nasdaq_Quotesearch.confirmUserPref(this.value)">&nbsp;Default Setting<br />
						</div>
					</div>
					
					<div class="clearB"></div>

					<span>
					    Please note that once you make your selection, it will apply to all future visits to NASDAQ.com. 
					    If, at any time, you are interested in reverting to our default settings, please select Default Setting above.
					    <br /><br />
					    If you have any questions or encounter any issues in changing your default settings, please email <a href="mailto:isfeedback@nasdaq.com?Subject=Default%20Settings%20Inquiry">isfeedback@nasdaq.com</a>.
					</span>
					<br />
				</div>
				<!-- end lightboxness -->
				<!-- begin lightboxness -->
				<div class="lightbox" id="confirm">
					<h4>Please confirm your selection:</h4>
					<p>
						You have selected to change your default setting for the Quote Search.  This will now be your default target page; 
						unless you change your configuration again, or you delete your 
						cookies.  <b>Are you sure you want to change your settings?</b>
					</p>
					<div class="marginRAuto marginLAuto" style="width:300px;height:50px;">
						<button class="floatL"  onclick="Nasdaq_Quotesearch.confirmHandler('defaultQuote', true)">YES</button>
						<button class="floatR"  onclick="Nasdaq_Quotesearch.confirmHandler('defaultQuote', false)">NO</button>	
					</div>						
				</div>
				<!-- end lightboxness -->
			</td>
		</tr>
	</table>
	



<script type="text/javascript">
    (function(){
    var site_msg = '<a id="registerlink" href="http://community.nasdaq.com" target="_top">Register</a> <span>or</span> <a id="loginlink" href="http://community.nasdaq.com/login.aspx" target="_top">Log In</a>';
    displayLoginStatus(false, null, null, site_msg);
    ndaqUser.onNASDAQUserNotLoggedIn();
    })();
</script>


<!-- Omniture code -->

<!--********************BEGIN  ../includes/omniture.inc***********************-->

<!-- SiteCatalyst code version: H.1.
Copyright 1997-2005 Omniture, Inc. More info available at http://www.omniture.com -->
<script language="JavaScript" type="text/javascript" src="http://www.nasdaq.com/includes/s_code.js?v=102510"></script>


<script type="text/javascript" language="JavaScript">

<!--
if(navigator.appVersion.indexOf('MSIE')>=0)document.write(unescape('%3C')+'\!-'+'-')
//--></script>

<noscript><img
src="http://nasdaq.122.2O7.net/b/ss/nasdaqprod/1/H.1--NS/0"
height="1" width="1" border="0" alt="" /></noscript><!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.1. -->
<!-- setSectionName() moved to js file: masthead_default.js -->


<!--*********************End  ../includes/omniture.inc*******************************-->

<script>
//<![CDATA[
setSectionName(propVar);
//]]>
</script>
<script type="text/javascript" src="http://www.nasdaq.com/includes/foresee/foresee-trigger.js"></script>
</body>
html>
eof

	describe 'scrape' do
		it 'return current nasdaq index' do
			NasdaqScraper::scrape(html).index.should eq 4277.30
			NasdaqScraper::scrape(html).change.should eq -30.82
		end
		it 'return nil if no nasdaq index in the string' do
      NasdaqScraper::scrape('some random text here').should eq nil
    end
    it 'should still work with positive change' do
    	str = 'nasdaqHomeIndexChart.storeIndexInfo("NASDAQ","4277.30","30.82","0.72","2,033,058,694","4284.15","4239.65");'
    	NasdaqScraper::scrape(str).change.should eq 30.82
    end
	end

	describe 'scrape_url' do
		it 'return nasdaq index if given nasdaq frontpage url' do
      response = Object.new

      def response.to_str
        'nasdaqHomeIndexChart.storeIndexInfo("NASDAQ","4277.30","-30.82","0.72","2,033,058,694","4284.15","4239.65");'
      end 

      RestClient
        .should_receive(:get)
        .at_least(:once)
        .with('http://www.nasdaq.com/')
        .and_return(response)

			NasdaqScraper::scrape_url('http://www.nasdaq.com/').index.should eq 4277.30
			NasdaqScraper::scrape_url('http://www.nasdaq.com/').change.should eq -30.82
		end
		it 'return nil if given random page' do
			NasdaqScraper::scrape_url('http://this.is.a.random.page.abc.xyz').should eq nil
    end
	end

end