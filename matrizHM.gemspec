# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrizHM/version'

Gem::Specification.new do |spec|
  spec.name          = "matrizHM"
  spec.version       = MatrizHM::VERSION
  spec.authors       = ["Diego Williams Aguilar Montaño","Javier Mena Mena"]
  spec.email         = ["alu0100592368@ull.edu.es","alu0100454741@ull.edu.es"]
  spec.description   = %q{Construcción de una gema ruby para la creación de matrices dispersas y densas,que heredan de la clase base Matriz hecha en prácticas anteriores}
  spec.summary       = %q{Se trata de contruir otra estructura para las matrices dispersas y realizar la operatoria necesaria para realizar los mismos algoritmos que las matrices densas}
  spec.homepage      = "https://github.com/alu0100454741/EquipoDJ-prct12"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "rdoc"
end
