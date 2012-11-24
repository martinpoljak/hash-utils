#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Numeric" do
    specify("#compare") do
        5.compare(1).should eq(1) 
        5.compare(5).should eq(0) 
        5.compare(7).should eq(-1)
    end
    specify("#negative?") do
        5.negative?.should be_false
        -2.negative?.should be_true
    end
    specify("#negative!") do
        5.negative!.should eq(-5) 
        -5.negative!.should eq(-5)
    end
    specify("#number?") do
        5.number?.should be_true
    end
    specify("#positive?") do
        5.positive?.should be_true
        -2.positive?.should be_false
    end
    specify("#positive!") do
        5.positive!.should eq(5) 
        -5.positive!.should eq(5)
    end
end
