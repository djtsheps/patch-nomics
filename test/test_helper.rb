# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "patch/nomics"
require "minitest/autorun"
require "webmock"
require "minitest-vcr"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/files/cassettes"
  c.hook_into :webmock
  c.filter_sensitive_data("<api_key>") { ENV["NOMICS_API_KEY"] }
end

MinitestVcr::Spec.configure!
