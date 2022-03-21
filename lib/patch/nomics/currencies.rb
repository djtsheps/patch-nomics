# frozen_string_literal: true

require_relative "base"
require "ostruct"

module Patch
  module Nomics
    class Currencies < Nomics::Base
      def get_cryptocurrencies(tickers:)
        tickers(ids: tickers.join(","))
      end

      def get_cryptocurrencies_with_specific_values(tickers:, values:)
        response = tickers(ids: tickers.join(","))
        return response unless response.success

        response.results.map! { _1.slice(*values) }
        response
      end

      def get_cryptocurrency_in_specific_fiat(ticker:, fiat:)
        response = tickers(ids: ticker, convert: fiat)
        return response unless response.success

        response.results = response.results.first || {}
        response
      end

      def calculate_cryptocurrency_price(from_ticker:, to_ticker:)
        response = tickers(ids: [from_ticker, to_ticker].join(","), convert: "USD")
        return response unless response.success

        price_relation = cryptocurrency_price_relation(from_ticker, to_ticker, response)
        response.results = { "price" => "1#{to_ticker} == #{from_ticker}#{price_relation}" }
        response
      end

      private

      def cryptocurrency_price_relation(from_ticker, to_ticker, response)
        from_ticker_data = response.results.find { _1["currency"] == from_ticker }
        to_ticker_data = response.results.find { _1["currency"] == to_ticker }

        to_ticker_data["price"].to_f / from_ticker_data["price"].to_f
      end

      def tickers(ids: nil, convert: "USD", per_page: 100)
        query_string = "ids=#{ids}&convert=#{convert}&per-page=#{per_page}"
        fetch_data(build_tickers_url(query_string))
      end

      def build_tickers_url(url_query_string)
        [
          base_url,
          "currencies/ticker?",
          url_query_string,
          api_key_query_string
        ].join
      end
    end
  end
end
