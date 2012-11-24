#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "TrueClass" do
    specify("#boolean?") do
        true.boolean?.should be_true
    end
    specify("#convert") do
        true.convert(:a, :b).should eq(:a)
    end
    specify("#false?") do
        true.false?.should be_false
    end
    specify("#to_i") do
        true.to_i.should eq(1)
    end
    specify("#true?") do
        true.true?.should be_true
    end
end
