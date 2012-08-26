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
require 'jeweler2'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "hash-utils"
  gem.homepage = "http://github.com/martinkozak/hash-utils"
  gem.license = "MIT"
  gem.summary = 'Adds more than 135 useful and frequently rather fundamental methods which are missing in Ruby programming language, to Array, File, Hash, Module, Object, String and Symbol classes. It tries to be similar project to Ruby Facets on principle, but less complex, more practical, non-atomic and organized by better way. Thanks to defensive and careful patching it should be compatible with all other libraries.'
  #gem.post_install_message = "\nHASH UTILS: The 2.0 version avoids the method overwriting conflicts by not performing overwriting of already implemented methods. By this way, it can damage your existing applications based on older versions although it's very improbable. \n\n"
  gem.email = "martinkozak@martinkozak.net"
  gem.authors = ["Martin Kozák"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new
