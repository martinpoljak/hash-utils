# encoding: utf-8
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
  gem.name = "hash-utils"
  gem.homepage = "http://github.com/martinkozak/hash-utils"
  gem.license = "MIT"
  gem.summary = 'Adds more than 90 useful and frequently rather fundamental methods which are missing in Ruby programming language, to Array, File, Hash, Module, Object, String and Symbol classes. It tries to be similar project to Ruby Facets on principle, but less complex, more practical, non-atomic and organized by better way.'
  gem.post_install_message = "\nHASH UTILS: Be warn, Hash#all? has been removed since version 0.15.0 because of\nconflict with built-in one with in fact equivalent functionallity. Please, check\nyour code if you can and switch to Ruby's one.\n\n"
  gem.email = "martinkozak@martinkozak.net"
  gem.authors = ["Martin Kozák"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "hash-utils #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
