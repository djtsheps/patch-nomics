# frozen_string_literal: true

require_relative "nomics/version"
require_relative "nomics/currencies"

module Patch
  module Nomics
    require "http"
    require "dotenv"

    Dotenv.load

    class Error < StandardError; end

    def self.get_cryptocurrencies(tickers:)
      Patch::Nomics::Currencies.tickers(ids: tickers.join(","))
    end

    def self.get_cryptocurrencies_with_specific_values(tickers:, values:)
      tickers_data = Patch::Nomics::Currencies.tickers(ids: tickers.join(","))
      return tickers_data unless tickers_data[:success]

      tickers_data[:results].map! { _1.slice(*values) }
      tickers_data
    end

    def self.get_cryptocurrency_in_specific_fiat(ticker:, fiat:)
      tickers_data = Patch::Nomics::Currencies.tickers(ids: ticker, convert: fiat)
      return tickers_data unless tickers_data[:success]

      tickers_data[:results] = tickers_data[:results].first || {}
      tickers_data
    end

    def self.calculate_cryptocurrency_price(from_ticker:, to_ticker:)
      tickers_data = Patch::Nomics::Currencies.tickers(ids: [from_ticker, to_ticker].join(","), convert: "USD")
      return tickers_data unless tickers_data[:success]

      from_ticker_data = tickers_data[:results].find { _1["currency"] == from_ticker }
      to_ticker_data = tickers_data[:results].find { _1["currency"] == to_ticker }

      relation_to_the_dollar = to_ticker_data["price"].to_f / from_ticker_data["price"].to_f

      tickers_data[:results] =
        { "price" => "1#{to_ticker_data["currency"]} == #{from_ticker_data["currency"]}#{relation_to_the_dollar}" }
      tickers_data
    end
  end
end
