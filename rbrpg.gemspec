# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbrpg/version'

Gem::Specification.new do |spec|
  spec.name          = "rbrpg"
  spec.version       = Rbrpg::VERSION
  spec.authors       = ["Jason Ayre"]
  spec.email         = ["jasonayre@gmail.com"]

  spec.summary       = "Write a short summart, because Rubygems requiers one."
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "https://github.com/jasonayre/rpg_codetest"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colored"
  spec.add_dependency "highline"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
