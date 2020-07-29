
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prop_check/version"

Gem::Specification.new do |spec|
  spec.name          = "prop_check"
  spec.version       = PropCheck::VERSION
  spec.authors       = ["Qqwy/Wiebe-Marten Wijnja"]
  spec.email         = ["w-m@wmcode.nl"]

  spec.summary       = %q{PropCheck allows you to do property-based testing, including shrinking.}
  spec.description   = %q{PropCheck allows you to do property-based testing, including shrinking. (akin to Haskell's QuickCheck, Erlang's PropEr, Elixir's StreamData). This means that your test are run many times with different, autogenerated inputs, and as soon as a failing case is found, this input is simplified, in the end giving you back the simplest input that made the test fail.}
  spec.homepage      = "https://github.com/Qqwy/ruby-prop_check/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Qqwy/ruby-prop_check/"
    spec.metadata["changelog_uri"] = "https://github.com/Qqwy/ruby-prop_check/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.5.1'

  spec.add_dependency 'awesome_print'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "doctest-rspec"
  spec.add_development_dependency "simplecov"
end
