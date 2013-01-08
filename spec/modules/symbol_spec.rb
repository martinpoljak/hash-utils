#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Symbol" do
    specify("#<=>") do
        (:aa <=> :aa).should eq(0)
        (:aa <=> :bb).should eq(-1)
        (:bb <=> :aa).should eq(1)
    end
    specify("#*") do
        (:a * 5).should eq(:aaaaa)
    end
    specify("#+") do
        (:a + :b).should eq(:ab)
    end
    specify("#[]") do
        :abcde[0...3].should eq("abc")
    end
    specify("#append") do
        :abcd.append("efg").should eq(:abcdefg)
    end
    specify("#end_with?") do
        :abcde.end_with?("ghi", "cde").should be_true
        :abcde.end_with?(:ghi, :cde).should be_true
        :abcde.end_with?("ghi").should be_false
        :abcde.end_with?(:ghi).should be_false
    end
    specify("#prepend") do
        :abcd.prepend("012").should eq(:"012abcd")
    end
    specify("#split") do
        :ab_cd_ef.split("_", 2).should eq([:ab, :cd_ef])
    end
    specify("#start_with?") do
        :abcde.start_with?("ghi", "abc").should be_true
        :abcde.start_with?(:ghi, :abc).should be_true
        :abcde.start_with?("ghi").should be_false
        :abcde.start_with?(:ghi).should be_false
    end
    specify("#strip") do
        :"  a  ".strip.should eq(:a)
    end
end
