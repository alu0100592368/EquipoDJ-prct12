# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrixlpp/version'

Gem::Specification.new do |spec|
  spec.name          = "matrixlpp"
  spec.version       = Matrixlpp::VERSION
  spec.authors       = ["Javier Mena Mena", "Diego Williams Aguilar Montaño"]
  spec.email         = ["alu0100454741@ull.edu.es","alu0100592368@ull.edu.es"]
  spec.description   = %q{Esta es una clase Matrix}
  spec.summary       = %q{Contiene todo lo necesario para definir una clase matrix}
  spec.homepage      = "https://github.com/alu0100454741/EquipoDJ-prct11"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
