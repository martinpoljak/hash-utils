#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

$:.push("./lib")
$:.unshift("./lib")

require "rspec"
require "stringio"

require "simplecov"
SimpleCov.start

require "hash-utils"

