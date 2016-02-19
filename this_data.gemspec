# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'this_data/version'

Gem::Specification.new do |spec|
  spec.name          = "this_data"
  spec.version       = ThisData::VERSION
  spec.authors       = ["ThisData Ltd", "Nick Malcolm"]
  spec.email         = ["support@thisdata.com", "nick@thisdata.com"]

  spec.summary       = %q{Ruby wrapper for ThisData's Login Intelligence API}
  spec.description   = %q{Ruby wrapper for ThisData's Login Intelligence API}
  spec.homepage      = "https://github.com/thisdata/thisdata-ruby"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_runtime_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8.4"
  spec.add_development_dependency "fakeweb", "~> 1.3"
  spec.add_development_dependency "mocha", "~> 1.1.0"


end
