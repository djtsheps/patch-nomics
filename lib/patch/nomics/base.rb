# frozen_string_literal: true

module Patch
  module Nomics
    class Base
      private

      def base_url
        ENV["NOMICS_BASE_URL"]
      end

      def api_key_query_string
        "&key=#{ENV["NOMICS_API_KEY"]}"
      end

      def fetch_data(url)
        response = HTTP.get(url)
        if response.code == 200
          OpenStruct.new(success: true, results: JSON.parse(response.body.to_s))
        else
          OpenStruct.new(success: false, error: response.body.to_s)
        end
      rescue StandardError => e
        OpenStruct.new(success: false, error: e.to_s)
      end
    end
  end
end
