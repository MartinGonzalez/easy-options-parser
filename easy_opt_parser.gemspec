
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "easy_opt_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "easy_opt_parser"
  spec.version       = EasyOptParser::VERSION
  spec.authors       = ["Martin Gonzalez"]
  spec.email         = ["gonzalez.martin90@gmail.com"]

  spec.summary       = %q{Easy Opt Parser is a small simplification of the class OptParser. }
  spec.description   = %q{The objective of this gem is to make easier the way to create command line options for your command. This gem is using the basic of OptParser and can be expanded over time.}
  spec.homepage      = "https://gitlab.com/gonzalez.martin90/easy-option-parser"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   << 'test_arguments'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'minitest'
end
