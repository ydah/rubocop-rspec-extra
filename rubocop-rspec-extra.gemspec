# frozen_string_literal: true

require_relative "lib/rubocop/rspec/extra/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-rspec-extra"
  spec.version = Rubocop::RSpec::Extra::VERSION
  spec.authors = ["Yudai Takada"]
  spec.email = ["t.yudai92@gmail.com"]

  spec.summary = "A RuboCop extension focused on enforcing RSpec."
  spec.description = <<~DESCRIPTION
    A RuboCop extension focused on enforcing RSpec.
    A place where no one is officially employed, but where useful cops can gather.
  DESCRIPTION
  spec.homepage = "https://github.com/ydah/rubocop-rspec-extra"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["default_lint_roller_plugin"] = "RuboCop::RSpec::Extra::Plugin"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "lint_roller", "~> 1.1"
  spec.add_dependency "rubocop", ">= 1.72.1", "< 2.0"
  spec.metadata["rubygems_mfa_required"] = "true"
end
