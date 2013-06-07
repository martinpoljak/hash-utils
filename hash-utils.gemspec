# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hash-utils"
  s.version = "2.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Koz\u{e1}k"]
  s.date = "2013-06-07"
  s.email = "martinkozak@martinkozak.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
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
    "lib/hash-utils/nil.rb",
    "lib/hash-utils/numeric.rb",
    "lib/hash-utils/object.rb",
    "lib/hash-utils/proc.rb",
    "lib/hash-utils/string.rb",
    "lib/hash-utils/stringio.rb",
    "lib/hash-utils/symbol.rb",
    "spec/modules/array_spec.rb",
    "spec/modules/false_spec.rb",
    "spec/modules/file_spec.rb",
    "spec/modules/hash_spec.rb",
    "spec/modules/io_spec.rb",
    "spec/modules/module_spec.rb",
    "spec/modules/nil_spec.rb",
    "spec/modules/numeric_spec.rb",
    "spec/modules/object_spec.rb",
    "spec/modules/string_spec.rb",
    "spec/modules/stringio_spec.rb",
    "spec/modules/symbol_spec.rb",
    "spec/modules/true_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/martinkozak/hash-utils"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Adds more than 155 useful and frequently rather fundamental methods which are missing in Ruby programming language, to Array, File, Hash, Module, Object, String and Symbol classes. It tries to be similar project to Ruby Facets on principle, but less complex, more practical, non-atomic and organized by better way. Thanks to defensive and careful patching it should be compatible with all other libraries."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-version>, [">= 0.4.0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<ruby-version>, [">= 0.4.0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby-version>, [">= 0.4.0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

