#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "NilClass" do
    specify("#to_boolean") do
        nil.to_boolean("xyz").should be_false
    end
end
