require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "roulette"
  gem.homepage = "http://github.com/Schnems/roulette"
  gem.license = "MIT"
  gem.summary = %Q{Pre-Sharding so simple you'll shoot yourself :p }
  gem.description = %Q{
   Super easy pre-sharding for your ruby NOSQL store. Presharding is used to naively scale your data-stores horizontally. 
  }
  gem.email = "richard.schneeman@gmail.com"
  gem.authors = ["Schneems"]
  gem.add_development_dependency "rspec"
end
Jeweler::RubygemsDotOrgTasks.new
