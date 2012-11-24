#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "File" do
    specify("#touch") do 
        File.touch("./~test1")
        File.exists?("./~test1").should be_true
    end
    specify("#write") do
        File.write("./~test2", "some string")
        File.read("./~test2").should eq("some string")
    end
    
    after(:all) do 
        File.unlink("./~test1")
        File.unlink("./~test2")
    end
end

