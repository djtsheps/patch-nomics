# frozen_string_literal: true

module Patch
  module Nomics
    module Base
      extend self

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
          { success: true, results: JSON.parse(response.body.to_s) }
        else
          { success: false, error:  response.body.to_s }
        end
      rescue StandardError => e
        { success: false, error: e.to_s }
      end
    end
  end
end
