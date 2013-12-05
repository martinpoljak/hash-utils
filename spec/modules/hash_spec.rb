#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Hash" do
    specify("#all_pairs?") do
        t = { :a => 1, :b => 2, :c => 3, :d => 4 }
        t.all_pairs? { |k, v| k.in? [:a, :b] or v > 2 }.should be_true
        t.all_pairs? { |k, v| v > 2 }.should be_false
        { }.all_pairs?.should be_true
    end
    specify("#asort") do
        h = { 3 => :c, 1 => :a,  2 => :b }
        h.asort.should eq({ 1 => :a, 2 => :b, 3 => :c })        
    end
    specify("#asort!") do
        h = { 3 => :c, 1 => :a,  2 => :b }
        h.asort!
        h.should eq({ 1 => :a, 2 => :b, 3 => :c })        
    end
    specify("#avg") do
        { :a => 1, :b => 2 }.avg.should eq(1.5)
    end 
    specify("#clean") do
        t = { :a => 1, :b => nil }
        t = t.clean(1)
        t.should eq({ :b => nil })
    end
    specify("#clean!") do
        t = { :a => 1, :b => nil }
        t.clean!(1)
        t.should eq({ :b => nil })
    end
    specify("::combine") do
        keys = [:a, :b, :c]
        values = [1, 2, 3]
        
        Hash::combine(keys, values).should eq({ :a => 1, :b => 2, :c => 3 })
        Hash::combine([ ], [ ]).should eq({ })
        Hash::combine([:a, :b], [ ]).should eq({ :a => nil, :b => nil })
        Hash::combine([ ], [1, 2]).should eq({ })
    end
    specify("#compact") do
        t = { :a => 1, :b => nil }
        t = t.compact
        t.should eq({ :a => 1 })
    end
    specify("#compact!") do
        t = { :a => 1, :b => nil }
        t.compact!
        t.should eq({ :a => 1 })
    end
    specify("::create") do
        proc = Proc::new { |dict, key| dict[key] = "" }
        t1 = Hash::create(:default)
        t2 = Hash::define(&proc)
        
        t1.default.should eq(:default)
        t2.default_proc.should eq(proc)
    end
    specify("::define") do
        proc = Proc::new { |dict, key| dict[key] = "" }
        t1 = Hash::define({:a => :b}, :default)
        t2 = Hash::define({:a => :b}, &proc)
        
        t1.should eq(:a => :b)
        t1.default.should eq(:default)
        t2.default_proc.should eq(proc)
    end
    specify("#first_key") do
        {:a => :b}.first_key.should eq(:a)
        { }.first_key.should be_nil
    end
    specify("#first_value") do
        {:a => :b}.first_value.should eq(:b)
        { }.first_key.should be_nil
    end
    specify("#flip") do
        t = { :a => 1, :b => 2, :c => 2 }
        result = t.flip
        (result == { 1 => :a, 2 => :c } or result == { 1 => :a, 2 => :b }).should be_true
    end
    specify("#flip!") do
        t = { :a => 1, :b => 2, :c => 2 }
        t.flip!
        (t == { 1 => :a, 2 => :c } or t == { 1 => :a, 2 => :b }).should be_true
    end
    specify("#get_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.get_pairs(:a, :c, :d) { |i| result << i }
        result.should eq([[:a, 1], [:c, 3]])
    end
    specify("#get_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_items(:a, :c, :d).should eq({ :a => 1, :c => 3 })
    end
    specify("#get_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_values(:a, :c, :d).should eq([1, 3])
    end
    specify("#get_values") do
        { :a => 1, :b => 2, :c => 3 }.hash?.should be_true
    end
    specify("#has_all?") do
        { :a => 1, :b => 2, :c => 3 }.has_all?([:b, :c]).should be_true
        { :a => 1, :b => 2, :c => 3 }.has_all?([:b, :d]).should be_false
    end
    specify("#has_some?") do
        { :a => 1, :b => 2, :c => 3 }.has_some?([:b, :c]).should be_true
        { :a => 1, :b => 2, :c => 3 }.has_some?([:b, :d]).should be_true
        { :a => 1, :b => 2, :c => 3 }.has_some?([:d, :e]).should be_false
    end
    specify("#map_values") do
        { :a => 1, :b => 2 }.map_values { |i| i + 1 }.should eq({ :a => 2, :b => 3 })
    end
    specify("#map_values!") do
        t = { :a => 1, :b => 2 }
        t.map_values! { |i| i + 1 } 
        t.should eq({ :a => 2, :b => 3 })
    end
    specify("#keys_to_sym") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym.should eq({:a => "b", 2 => "c", :d => "e"})
    end
    specify("#keys_to_sym!") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym! 
        h.should eq({:a => "b", 2 => "c", :d => "e"})
    end
    specify("#ksort") do
        h = { 3 => :b, 1 => :a,  2 => :c }
        h.ksort.should eq({ 1 => :a, 2 => :c, 3 => :b })        
    end
    specify("#ksort!") do
        h = { 3 => :b, 1 => :a,  2 => :c }
        h.ksort!
        h.should eq({ 1 => :a, 2 => :c, 3 => :b })        
    end
    specify("#map_keys!") do
        h = {"a" => 1, "b" => 2}
        h.map_keys! do |k|
            k.to_sym
        end
        
        h.should eq({:a => 1, :b => 2})
    end
    specify("#recreate!") do
        h = Hash::create(:default, {:a => 1, :b => 2})
        h.recreate!
        h.should eq({ })
        h.default.should eq(:default)
        
        proc = Proc::new {  }
        h = Hash::create(nil, {:a => 1, :b => 2}, &proc)
        h.recreate!
        h.default_proc.should eq(proc)
    end
    specify("#remove!") do
        h = {:a => 1, :b => 2, :c => 3, :d => 4}
        h.remove! { |k, v| k == :c or v > 2 }.should eq({:c => 3, :d => 4})
        h.should eq({:a => 1, :b => 2})
    end
    specify("#reverse") do
        h = {:a => 1, :b => 2, :c => 3}
        h.reverse.should eq({:c => 3, :b => 2, :a => 1})
        { }.reverse.should eq({ })
    end
    specify("#reverse!") do
        h = {:a => 1, :b => 2, :c => 3}
        h.reverse!
        h.should eq({:c => 3, :b => 2, :a => 1})
        
        h = { }
        h.reverse!
        h.should eq({ })
    end
    specify("#some?") do
        h = {:a => 1, :b => 2, :c => 3}
        h.some? { |v| v > 1 }.should be_true
        h.some? { |v| v < 0 }.should be_false
        { }.some? { |v| b < 0 }.should be_false
    end
    specify("#some_pairs?") do
        h = {:a => 1, :b => 2, :c => 3}
        h.some_pairs? { |k, v| v > 1 }.should be_true
        h.some_pairs? { |k, v| k == :a }.should be_true
        h.some_pairs? { |k, v| k == :d }.should be_false
        h.some_pairs? { |k, v| v > 4 }.should be_false
        { }.some_pairs? { |k, v| b < 0 }.should be_false
    end
    specify("#sort!") do
        h = { 3 => :b, 1 => :a,  2 => :c }
        h.sort!
        h.should eq({ 1 => :a, 2 => :c, 3 => :b })
    end
    specify("#sum") do
        { :a => 1, :b => 2 }.sum.should eq(3)
        { :a => "a", :b => "b" }.sum.should eq("ab")
        {  }.sum.should be_nil
    end
    specify("#take_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.take_pairs(:a, :c, :d) { |i| result << i }
        result.should eq([[:a, 1], [:c, 3], [:d, nil]])
    end
    specify("#take_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_items(:a, :c, :d).should eq({ :a => 1, :c => 3, :d => nil })
    end
    specify("#take_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_values(:a, :c, :d).should eq([1, 3, nil])
    end
    
end
