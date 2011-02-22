# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hash-utils}
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Kozák"]
  s.date = %q{2011-02-23}
  s.email = %q{martinkozak@martinkozak.net}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "TODO.txt",
    "VERSION",
    "hash-utils.gemspec",
    "lib/hash-utils.rb",
    "lib/hash-utils/array.rb",
    "lib/hash-utils/hash.rb",
    "lib/hash-utils/numeric.rb",
    "lib/hash-utils/object.rb",
    "lib/hash-utils/string.rb",
    "lib/hash-utils/symbol.rb",
    "test"
  ]
  s.homepage = %q{http://github.com/martinkozak/hash-utils}
  s.licenses = ["MIT"]
  s.post_install_message = %q{
HASH UTILS: Be warn, Hash#all? is deprecated since version 0.10.0 because of
conflict with built-in one with in fact equivalent functionallity. It will be
removed around version 0.13.0. Please, check your code if you can and switch
to Ruby's one.

}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Adds a lot of useful fundamental utility methods which are missing in Ruby, both to Array and Hash classes and introduces some useful methods and syntactic sugar to Object and String classes too.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
  end
end

