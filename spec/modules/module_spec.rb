#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Module" do
    specify("#get_module") do
        require "zlib"
        Kernel.get_module("Zlib::Inflate").should eq(Zlib::Inflate)
    end
end
