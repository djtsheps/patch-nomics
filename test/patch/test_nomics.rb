# frozen_string_literal: true

require "test_helper"

class Patch::TestNomics < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Patch::Nomics::VERSION
  end

  def test_get_cryptocurrencies_retrieves_a_list_of_cryptocurrencies_given_set_of_tickers
    VCR.use_cassette("test_get_cryptocurrencies_retrieves_a_list_of_cryptocurrencies_given_set_of_tickers") do
      response = Patch::Nomics.get_cryptocurrencies(tickers: %w[BTC XRP ETH])
      assert_equal response.results, JSON.parse(File.read("test/fixtures/files/btc_xrp_eth_tickers.json"))
      assert response.success
    end
  end

  def test_get_cryptocurrencies_with_specific_values
    VCR.use_cassette("test_get_cryptocurrencies_with_specific_values") do
      response = Patch::Nomics.get_cryptocurrencies_with_specific_values(tickers: %w[ETH BTC], values: %w[id name])
      assert_equal(response.results, [{ "id" => "BTC", "name" => "Bitcoin" }, { "id" => "ETH", "name" => "Ethereum" }])
      assert response.success
    end
  end

  def test_get_cryptocurrencies_with_specific_values_returns_empty_results_with_invalid_tickers
    VCR.use_cassette("test_get_cryptocurrencies_with_specific_values_returns_empty_results_with_invalid_tickers") do
      response = Patch::Nomics.get_cryptocurrencies_with_specific_values(tickers: %w[AAETH BBBTC], values: %w[id name])
      assert_equal(response.results, [])
      assert response.success
    end
  end

  def test_get_cryptocurrency_in_specific_fiat_retrieves_a_specific_cryptocurrency_to_specific_fiat
    VCR.use_cassette("test_get_cryptocurrency_in_specific_fiat_retrieves_a_specific_cryptocurrency_to_specific_fiat") do
      response = Patch::Nomics.get_cryptocurrency_in_specific_fiat(ticker: "BTC", fiat: "ZAR")
      assert_equal response.results, JSON.parse(File.read("test/fixtures/files/btc_ticker.json"))
      assert response.success
    end
  end

  def test_get_cryptocurrency_in_specific_fiat_returns_a_zero_price_with_an_invalid_fiat
    VCR.use_cassette("test_get_cryptocurrency_in_specific_fiat_returns_a_zero_price_with_an_invalid_fiat") do
      response = Patch::Nomics.get_cryptocurrency_in_specific_fiat(ticker: "BNB", fiat: "InvalidFiat")
      assert_equal response.results['price'], '0.00000000'
      assert response.success
    end
  end

  def test_get_cryptocurrency_in_specific_fiat_returns_an_empty_object_given_an_invalid_ticker
    VCR.use_cassette("test_get_cryptocurrency_in_specific_fiat_returns_an_empty_object_given_an_invalid_ticker") do
      response = Patch::Nomics.get_cryptocurrency_in_specific_fiat(ticker: "InValidTicker", fiat: "USD")
      assert_equal response.results, {}
      assert response.success
    end
  end

  def test_calculate_cryptocurrency_price_calculates_the_price_of_one_cryptocurrency_from_another
    VCR.use_cassette("test_calculate_cryptocurrency_price_calculates_the_price_of_one_cryptocurrency_from_another") do
      response = Patch::Nomics.calculate_cryptocurrency_price(from_ticker: "BTC", to_ticker: "ETH")
      assert_equal(response.results, { "price" => "1ETH == BTC0.07065948742085743" })
      assert response.success
    end
  end
end
