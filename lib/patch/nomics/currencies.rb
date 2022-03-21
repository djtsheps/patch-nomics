# frozen_string_literal: true

require_relative "base"

module Patch
  module Nomics
    module Currencies
      extend self
      include Nomics::Base

      def tickers(ids: nil, convert: "USD", per_page: 100)
        query_string = "ids=#{ids}&convert=#{convert}&per-page=#{per_page}"
        fetch_data(build_tickers_url(query_string))
      end

      private

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
