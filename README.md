# Patch::Nomics

The Patch Nomics library provides convenient access to the Nomics API. It allows users to retrieve various cryptocurrencies given a set of tickers or a specific fiat. Users can also calculate the price of one cryptocurrency from another, in relation to their dollar value


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'patch-nomics'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install patch-nomics

## Usage

Add the following configuration to your `.env` file in the root of your project (see .env.example):

```shell
# Get your API_KEY from https://p.nomics.com/cryptocurrency-bitcoin-api
NOMICS_BASE_URL=https://api.nomics.com/v1/
NOMICS_API_KEY=YOUR_API_KEY_HERE
```

Retrieve a list of cryptocurrencies given set of tickers (symbols)

``` ruby
Patch::Nomics.get_cryptocurrencies(tickers: ['BTC', 'XRP', 'ETH'])


irb(main):011:0>  Patch::Nomics.get_cryptocurrencies(tickers: ['BTC', 'XRP', 'ETH'])
=>
{:success=>true,
 :results=>
  [{"id"=>"BTC",
    "currency"=>"BTC",
    "symbol"=>"BTC",
    "name"=>"Bitcoin",
    "logo_url"=>"https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
    "status"=>"active",
    "price"=>"41354.94983416",
    "price_date"=>"2022-03-21T00:00:00Z",
    "price_timestamp"=>"2022-03-21T11:10:00Z",
    "circulating_supply"=>"18989650",
    "max_supply"=>"21000000",
    "market_cap"=>"785316023118",
    "market_cap_dominance"=>"0.4067",
    "num_exchanges"=>"414",
    "num_pairs"=>"86268",
    "num_pairs_unmapped"=>"7421",
    "first_candle"=>"2011-08-18T00:00:00Z",
    "first_trade"=>"2011-08-18T00:00:00Z",
    "first_order_book"=>"2017-01-06T00:00:00Z",
    "rank"=>"1",
    "rank_delta"=>"0",
    "high"=>"67598.44107607",
    "high_timestamp"=>"2021-11-08T00:00:00Z",
    "1d"=>
     {"volume"=>"26745782465.60",
      "price_change"=>"-376.49103688",
      "price_change_pct"=>"-0.0090",
      "volume_change"=>"-6114715083.12",
      "volume_change_pct"=>"-0.1861",
      "market_cap_change"=>"-7110539315.55",
      "market_cap_change_pct"=>"-0.0090"},
    "7d"=>
     {"volume"=>"203566544240.36",
      "price_change"=>"1625.88730201",
      "price_change_pct"=>"0.0409",
      "volume_change"=>"-33651332821.77",
      "volume_change_pct"=>"-0.1419",
      "market_cap_change"=>"31136527494.21",
      "market_cap_change_pct"=>"0.0413"},
    "30d"=>
     {"volume"=>"1016577345919.25",
      "price_change"=>"1239.12770631",
      "price_change_pct"=>"0.0309",
      "volume_change"=>"34770076666.95",
      "volume_change_pct"=>"0.0354",
      "market_cap_change"=>"24614009456.37",
      "market_cap_change_pct"=>"0.0324"},
    "365d"=>
     {"volume"=>"19620293491009.88",
      "price_change"=>"-15865.08643236",
      "price_change_pct"=>"-0.2773",
      "volume_change"=>"5107564549291.11",
      "volume_change_pct"=>"0.3519",
      "market_cap_change"=>"-282409453074.68",
      "market_cap_change_pct"=>"-0.2645"},
    "ytd"=>
     {"volume"=>"2585920527406.61",
      "price_change"=>"-6002.04981227",
      "price_change_pct"=>"-0.1267",
      "volume_change"=>"-893306097672.32",
      "volume_change_pct"=>"-0.2568",
      "market_cap_change"=>"-110498122094.48",
      "market_cap_change_pct"=>"-0.1233"}},
   {"id"=>"ETH",
    "currency"=>"ETH",
    "symbol"=>"ETH",
    "name"=>"Ethereum",
    "logo_url"=>"https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/eth.svg",
    "status"=>"active",
    "platform_currency"=>"ETH",
    "price"=>"2914.13015902",
    "price_date"=>"2022-03-21T00:00:00Z",
    "price_timestamp"=>"2022-03-21T11:10:00Z",
    "circulating_supply"=>"120049954",
    "market_cap"=>"349841190991",
    "market_cap_dominance"=>"0.1812",
    "num_exchanges"=>"458",
    "num_pairs"=>"81727",
    "num_pairs_unmapped"=>"61643",
    "first_candle"=>"2015-08-07T00:00:00Z",
    "first_trade"=>"2015-08-07T00:00:00Z",
    "first_order_book"=>"2018-08-29T00:00:00Z",
    "rank"=>"2",
    "rank_delta"=>"0",
    "high"=>"4811.65907276",
    "high_timestamp"=>"2021-11-08T00:00:00Z",
    "1d"=>
     {"volume"=>"17902149475.89",
      "price_change"=>"18.60305685",
      "price_change_pct"=>"0.0064",
      "volume_change"=>"2128364838.54",
      "volume_change_pct"=>"0.1349",
      "market_cap_change"=>"2272195351.07",
      "market_cap_change_pct"=>"0.0065"},
    "7d"=>
     {"volume"=>"121409899127.12",
      "price_change"=>"320.94441996",
      "price_change_pct"=>"0.1238",
      "volume_change"=>"10121075934.00",
      "volume_change_pct"=>"0.0909",
      "market_cap_change"=>"38774239266.08",
      "market_cap_change_pct"=>"0.1246"},
    "30d"=>
     {"volume"=>"602556266019.97",
      "price_change"=>"147.46633904",
      "price_change_pct"=>"0.0533",
      "volume_change"=>"-97603427237.19",
      "volume_change_pct"=>"-0.1394",
      "market_cap_change"=>"18827740866.83",
      "market_cap_change_pct"=>"0.0569"},
    "365d"=>
     {"volume"=>"14758070538241.30",
      "price_change"=>"1133.92271010",
      "price_change_pct"=>"0.6370",
      "volume_change"=>"7255076275109.23",
      "volume_change_pct"=>"0.9670",
      "market_cap_change"=>"144868649622.36",
      "market_cap_change_pct"=>"0.7068"},
    "ytd"=>
     {"volume"=>"1694975219951.39",
      "price_change"=>"-918.55519883",
      "price_change_pct"=>"-0.2397",
      "volume_change"=>"-659917469755.30",
      "volume_change_pct"=>"-0.2802",
      "market_cap_change"=>"-106141926688.47",
      "market_cap_change_pct"=>"-0.2328"}},
   {"id"=>"XRP",
    "currency"=>"XRP",
    "symbol"=>"XRP",
    "name"=>"XRP",
    "logo_url"=>"https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/XRP.svg",
    "status"=>"active",
    "price"=>"0.81657411",
    "price_date"=>"2022-03-21T00:00:00Z",
    "price_timestamp"=>"2022-03-21T11:10:00Z",
    "circulating_supply"=>"48121609012",
    "max_supply"=>"100000000000",
    "market_cap"=>"39294860234",
    "market_cap_dominance"=>"0.0203",
    "num_exchanges"=>"277",
    "num_pairs"=>"2530",
    "num_pairs_unmapped"=>"111",
    "first_candle"=>"2013-05-09T00:00:00Z",
    "first_trade"=>"2013-05-09T00:00:00Z",
    "first_order_book"=>"2018-08-29T00:00:00Z",
    "rank"=>"6",
    "rank_delta"=>"0",
    "high"=>"2.75858321",
    "high_timestamp"=>"2018-01-07T00:00:00Z",
    "1d"=>
     {"volume"=>"1685203360.28",
      "price_change"=>"0.0067199633",
      "price_change_pct"=>"0.0083",
      "volume_change"=>"-21990620.66",
      "volume_change_pct"=>"-0.0129",
      "market_cap_change"=>"323375445.11",
      "market_cap_change_pct"=>"0.0083"},
    "7d"=>
     {"volume"=>"12232216258.65",
      "price_change"=>"0.041090160",
      "price_change_pct"=>"0.0530",
      "volume_change"=>"-5721235880.55",
      "volume_change_pct"=>"-0.3187",
      "market_cap_change"=>"2035875466.80",
      "market_cap_change_pct"=>"0.0546"},
    "30d"=>
     {"volume"=>"75280370106.08",
      "price_change"=>"-0.0061663636",
      "price_change_pct"=>"-0.0075",
      "volume_change"=>"-1421649932.49",
      "volume_change_pct"=>"-0.0185",
      "market_cap_change"=>"-154954220.35",
      "market_cap_change_pct"=>"-0.0039"},
    "365d"=>
     {"volume"=>"2467185398080.03",
      "price_change"=>"0.30058973",
      "price_change_pct"=>"0.5826",
      "volume_change"=>"896168927082.98",
      "volume_change_pct"=>"0.5704",
      "market_cap_change"=>"15643074141.97",
      "market_cap_change_pct"=>"0.6614"},
    "ytd"=>
     {"volume"=>"185486086080.61",
      "price_change"=>"-0.042718413",
      "price_change_pct"=>"-0.0497",
      "volume_change"=>"-89451502489.56",
      "volume_change_pct"=>"-0.3254",
      "market_cap_change"=>"-1552438800.10",
      "market_cap_change_pct"=>"-0.0380"}}]}
irb(main):012:0>
```

Retrieve a list specific cryptocurrencies and specific values based on the ticker and any other dynamic params

``` ruby
Patch::Nomics.get_cryptocurrencies_with_specific_values(tickers: ['ETH', 'BTC'], values: ['id', 'name'])


irb(main):009:0> Patch::Nomics.get_cryptocurrencies_with_specific_values(tickers: ['ETH', 'BTC'], values: ['id', 'name'])
=> {:success=>true, :results=>[{"id"=>"BTC", "name"=>"Bitcoin"}, {"id"=>"ETH", "name"=>"Ethereum"}]}
irb(main):010:0>
```

Retrieve a specific cryptocurrency to specific fiat. Ie: BTC in ZAR or ETH in USD

``` ruby
Patch::Nomics.get_cryptocurrency_in_specific_fiat(ticker: 'BTC', fiat: 'ZAR')


irb(main):010:0>  Patch::Nomics.get_cryptocurrency_in_specific_fiat(ticker: 'BTC', fiat: 'ZAR')
=>
{:success=>true,
 :results=>
  {"id"=>"BTC",
   "currency"=>"BTC",
   "symbol"=>"BTC",
   "name"=>"Bitcoin",
   "logo_url"=>"https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
   "status"=>"active",
   "price"=>"618956.88820037",
   "price_date"=>"2022-03-21T00:00:00Z",
   "price_timestamp"=>"2022-03-21T11:08:00Z",
   "circulating_supply"=>"18989650",
   "max_supply"=>"21000000",
   "market_cap"=>"11753774672014",
   "market_cap_dominance"=>"0.4066",
   "num_exchanges"=>"414",
   "num_pairs"=>"86268",
   "num_pairs_unmapped"=>"7421",
   "first_candle"=>"2011-08-18T00:00:00Z",
   "first_trade"=>"2011-08-18T00:00:00Z",
   "first_order_book"=>"2017-01-06T00:00:00Z",
   "rank"=>"1",
   "rank_delta"=>"0",
   "high"=>"1020623.57085207",
   "high_timestamp"=>"2021-11-08T00:00:00Z",
   "1d"=>
    {"volume"=>"388064610185.45",
     "price_change"=>"-986.61823134",
     "price_change_pct"=>"-0.0016",
     "volume_change"=>"-100096723586.18",
     "volume_change_pct"=>"-0.2050",
     "market_cap_change"=>"-18157747548.75",
     "market_cap_change_pct"=>"-0.0015"},
   "7d"=>
    {"volume"=>"3050925434780.73",
     "price_change"=>"17937.21937655",
     "price_change_pct"=>"0.0298",
     "volume_change"=>"-539697174892.17",
     "volume_change_pct"=>"-0.1503",
     "market_cap_change"=>"344577429394.04",
     "market_cap_change_pct"=>"0.0302"},
   "30d"=>
    {"volume"=>"15431128276261.08",
     "price_change"=>"12545.66184657",
     "price_change_pct"=>"0.0207",
     "volume_change"=>"440554143883.82",
     "volume_change_pct"=>"0.0294",
     "market_cap_change"=>"254615075474.77",
     "market_cap_change_pct"=>"0.0221"},
   "365d"=>
    {"volume"=>"288741811471201.48",
     "price_change"=>"-240755.84629239",
     "price_change_pct"=>"-0.2800",
     "volume_change"=>"54747634653229.89",
     "volume_change_pct"=>"0.2340",
     "market_cap_change"=>"-4288458935631.59",
     "market_cap_change_pct"=>"-0.2673"},
   "ytd"=>
    {"volume"=>"39484290654749.31",
     "price_change"=>"-119457.60235649",
     "price_change_pct"=>"-0.1618",
     "volume_change"=>"-14833489275787.66",
     "volume_change_pct"=>"-0.2731",
     "market_cap_change"=>"-2214216345356.12",
     "market_cap_change_pct"=>"-0.1585"}}}
irb(main):011:0>
```

Calculate the price of one cryptocurrency from another, in relation to their dollar value

``` ruby
Patch::Nomics.calculate_cryptocurrency_price(from_ticker: 'BTC', to_ticker: 'ETH')

irb(main):006:0> Patch::Nomics.calculate_cryptocurrency_price(from_ticker: 'BTC', to_ticker: 'ETH')
=> {:success=>true, :results=>{"price"=>"1ETH == BTC0.07049427708369088"}}
irb(main):007:0>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/djtsheps/patch-nomics.
