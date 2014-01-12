require 'rspec/core/rake_task'
require "rdoc/task"

desc "Run specs"
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = './spec/**/*_spec.rb'
  end
end

task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task["spec"].execute
end

desc "Generate documentation"
Rake::RDocTask.new do |rd|
    rd.rdoc_dir = 'doc'
    rd.main = "README.md"
    rd.rdoc_files.include 'README.md', 'src/'
end