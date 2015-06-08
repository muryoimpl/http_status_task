# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'http_status_task'

Gem::Specification.new do |spec|
  spec.name          = "http_status_task"
  spec.version       = HttpStatusTask::VERSION
  spec.authors       = ["muryoimpl"]
  spec.email         = ["muryoimpl@gmail.com"]
  spec.summary       = %q{This gem add rake tasks which print http status codes.}
  spec.description   = %q{This gem add rake tasks which print http status codes.}
  spec.homepage      = "https://github.com/muryoimpl/http_status_task"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"

  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "rack"
  spec.add_dependency "colorize"
end
