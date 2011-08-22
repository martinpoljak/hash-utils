# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hash-utils}
  s.version = "0.18.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Martin Kozák}]
  s.date = %q{2011-08-22}
  s.email = %q{martinkozak@martinkozak.net}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "CHANGES.txt",
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
    "lib/hash-utils/boolean.rb",
    "lib/hash-utils/file.rb",
    "lib/hash-utils/gem.rb",
    "lib/hash-utils/hash.rb",
    "lib/hash-utils/io.rb",
    "lib/hash-utils/module.rb",
    "lib/hash-utils/numeric.rb",
    "lib/hash-utils/object.rb",
    "lib/hash-utils/proc.rb",
    "lib/hash-utils/string.rb",
    "lib/hash-utils/stringio.rb",
    "lib/hash-utils/symbol.rb",
    "test"
  ]
  s.homepage = %q{http://github.com/martinkozak/hash-utils}
  s.licenses = [%q{MIT}]
  s.post_install_message = %q{
HASH UTILS: Some methods are optimized at Ruby 1.8.7 and 1.9 or higher, but this feature requires the 'ruby-version' gem.

}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{Adds more than 125 useful and frequently rather fundamental methods which are missing in Ruby programming language, to Array, File, Hash, Module, Object, String and Symbol classes. It tries to be similar project to Ruby Facets on principle, but less complex, more practical, non-atomic and organized by better way.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<riot>, [">= 0.12.3"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<riot>, [">= 0.12.3"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<riot>, [">= 0.12.3"])
  end
end

