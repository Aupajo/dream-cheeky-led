# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dream-cheeky/led/version'

Gem::Specification.new do |spec|
  spec.name          = "dream-cheeky-led"
  spec.version       = DreamCheeky::LEDMessageBoard::VERSION
  spec.authors       = ["Pete Nicholls"]
  spec.email         = ["pete@metanation.com"]
  spec.summary       = %q{A Dream Cheeky LED Message Board driver in Ruby.}
  spec.description   = %q{Control the Dream Cheeky LED Message Board with ASCII art.}
  spec.homepage      = "https://github.com/aupajo/dream-cheeky-led"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'

  spec.add_dependency "libusb"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
