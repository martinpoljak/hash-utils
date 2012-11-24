#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "FalseClass" do
    specify("#boolean?") do
        false.boolean?.should be_true
    end
    specify("#convert") do
        false.convert(:a, :b).should eq(:b)
    end
    specify("#false?") do
        false.false?.should be_true
    end
    specify("#to_i") do
        false.to_i.should eq(0)
    end
    specify("#true?") do
        (not false.true?).should be_true
    end
end
