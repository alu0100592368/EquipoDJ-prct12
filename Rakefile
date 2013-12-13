require "bundler/gem_tasks"
require 'rake/testtask' 
require 'rdoc/task'

$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

Rake::RDocTask.new do |rd|
    rd.main = "README.md"
    rd.rdoc_files.include("README.md", "lib/**/*.rb")
end

desc "Ejecucion del Dsl que hace la operacion de la suma"
task :dsl do
     sh "ruby lib/dsl_matriz.rb"
end