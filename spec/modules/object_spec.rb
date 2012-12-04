#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Object" do
    specify("#**") do
        ("ab" ** 5).should eq(["ab", "ab", "ab", "ab", "ab"])
    end
    specify("#array?") do
        "".array?.should be_false
        [].array?.should be_true
    end
    specify("#boolean?") do
        true.boolean?.should be_true
        false.boolean?.should be_true 
        "".boolean?.should be_false
    end
    specify("#enumerable?") do
        [].enumerable?.should be_true 
        5.enumerable?.should be_false
    end
    specify("#false?") do
        false.false?.should be_true 
        "string".false?.should be_false
    end
    specify("#hash?") do
        "".hash?.should be_false 
        {}.hash?.should be_true
    end
    specify("#in?") do
        (5.in? 1..7).should be_true 
        (9.in? 1..7).should be_false
    end
    specify("#instance_of_any?") do
        "".instance_of_any?([String, Symbol]).should be_true
        "".instance_of_any?([Integer, Float]).should be_false
        "".instance_of_any?(String, Symbol).should be_true
    end
    specify("#io?") do
        "".io?.should_not == true
    end
    specify("#kind_of_any?") do
        "".kind_of_any?([String, Symbol]).should be_true
        "".kind_of_any?([Integer, Float]).should be_false
        "".kind_of_any?(String, Symbol).should be_true
    end
    specify("#number?") do
        :abcd.number?.should be_false
        5.number?.should be_true
    end
    specify("#proc?") do
        proc = Proc::new { }
        :abcd.proc?.should be_false 
        proc.proc?.should be_true
    end
    specify("#string?") do
        "".string?.should be_true
        5.string?.should be_false
    end
    specify("#symbol?") do
        :abcd.symbol?.should be_true 
        5.symbol?.should be_false
    end
    specify("#to_b") do
        nil.to_b.should be_false
        "ab".to_b.should be_true
    end
    specify("#to_symbol") do
        "ab".to_symbol.should eq(:ab)
        12.to_symbol.should eq(:"12")
    end
    specify("#true?") do
        true.true?.should be_true
        "string".true?.should be_false
    end
end
