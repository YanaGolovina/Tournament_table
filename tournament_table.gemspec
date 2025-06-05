# frozen_string_literal: true

require_relative "lib/tournament_table/version"

Gem::Specification.new do |spec|
  spec.name = "tournament_table"
  spec.version = TournamentTable::VERSION
  spec.authors = ["Iana"]
  spec.email = ["yana.golovina.200222@mail.ru"]

  spec.summary = "A Ruby gem for creating and managing tournament tables"
  spec.description = "Tournament Table is a Ruby gem that helps organize tournaments by reading participant data from CSV or Excel files and creating balanced tournament pairs."
  spec.homepage = "https://github.com/Timoor/Tournament_table"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Timoor/Tournament_table"
  spec.metadata["changelog_uri"] = "https://github.com/Timoor/Tournament_table/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_dependency "rubyXL", "~> 3.4"  # For reading Excel files
  spec.add_dependency "csv", "~> 3.2"     # For reading CSV files
  
  # Development dependencies
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
