#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "StringIO" do
    specify("#io?") do
        StringIO::new.io?.should be_true
    end
end
