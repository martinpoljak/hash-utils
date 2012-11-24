#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "IO" do
    specify("#io?") do
        io = File::open("./~test", "w")
        result = io.io?
        io.close()
        result.should be_true
    end
    after(:all) do 
        File.unlink("./~test")
    end    
end
