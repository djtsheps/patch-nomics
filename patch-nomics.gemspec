# frozen_string_literal: true

require_relative "lib/patch/nomics/version"

Gem::Specification.new do |spec|
  spec.name = "patch-nomics"
  spec.version = Patch::Nomics::VERSION
  spec.authors = ["Tshepiso Tsotetsi"]
  spec.email = ["djtsheps@gmail.com"]

  spec.summary = "The Patch Nomics library provides convenient access to the Nomics API."
  spec.description = "Library allows users to retrieve various cryptocurrencies given a set of tickers or a specific fiat. Users can also calculate the price of one cryptocurrency from another, in relation to their dollar value"
  spec.homepage = "https://github.com/djtsheps/patch-nomics"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "http"
  spec.add_dependency "dotenv"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
