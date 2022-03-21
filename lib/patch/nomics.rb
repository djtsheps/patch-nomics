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
      Patch::Nomics::Currencies.new.get_cryptocurrencies(tickers: tickers)
    end

    def self.get_cryptocurrencies_with_specific_values(tickers:, values:)
      Patch::Nomics::Currencies.new.get_cryptocurrencies_with_specific_values(tickers: tickers, values: values)
    end

    def self.get_cryptocurrency_in_specific_fiat(ticker:, fiat:)
      Patch::Nomics::Currencies.new.get_cryptocurrency_in_specific_fiat(ticker: ticker, fiat: fiat)
    end

    def self.calculate_cryptocurrency_price(from_ticker:, to_ticker:)
      Patch::Nomics::Currencies.new.calculate_cryptocurrency_price(from_ticker: from_ticker, to_ticker: to_ticker)
    end
  end
end
