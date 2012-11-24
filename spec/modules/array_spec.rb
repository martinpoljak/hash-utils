#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "Array" do
    specify("#second") do
        [1, 2, 3, 4, 5, 6, 7, 8].second.should eq(2)
    end
    specify("#third") do
        [1, 2, 3, 4, 5, 6, 7, 8].third.should eq(3)
    end
    specify("#fourth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fourth.should eq(4)
    end
    specify("#fifth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fifth.should eq(5) 
    end
    specify("#sixth") do
        [1, 2, 3, 4, 5, 6, 7, 8].sixth.should eq(6)
    end
    specify("#seventh") do
        [1, 2, 3, 4, 5, 6, 7, 8].seventh.should eq(7)
    end
    specify("#eighth") do
        [1, 2, 3, 4, 5, 6, 7, 8].eighth.should eq(8)
    end
    specify("#array?") do
        [1, 2, 3].array?.should be_true
    end
    specify("#avg") do
        [1, 2, 3].avg.should eq(2)
    end
    specify("#clean") do
        t = [1, nil]
        t = t.clean(1)
        t.should eq([nil])
    end
    specify("#clean!") do
        t = [1, nil]
        t.clean!(1)
        t.should eq([nil])
    end
    specify("#complete_to") do
        [1, 2, 3].complete_to(5, :a).should eq([1, 2, 3, :a, :a])
        [1, 2, 3, 4, 5].complete_to(3).should eq([1, 2, 3])
    end
    specify("#complete_to!") do
        t = [1, 2, 3]
        t.complete_to! 5, :a
        t.should eq([1, 2, 3, :a, :a])
        
        t = [1, 2, 3, 4, 5]
        t.complete_to! 3
        t.should eq([1, 2, 3 ])
    end
    specify("#cut") do
        [1, 2, 3, 4].cut(2).should eq([1, 2])
        [1, 2, 3, 4].cut(4).should eq([])
        [1, 2, 3, 4].cut(6).should eq([])
    end
    specify("#cut!") do
        t = [1, 2, 3, 4]
        t.cut! 2
        t.should eq([1, 2])
        
        t = [1, 2, 3, 4]
        t.cut! 4
        t.should eq([])
        
        t = [1, 2, 3, 4]
        t.cut! 6
        t.should eq([])
    end
    specify("#drop!") do
        t = [1, 2, 3, 4, 5]
        t.drop! 2
        t.should eq([3, 4, 5])

        t = [1, 2, 3, 4, 5]
        t.drop! 0
        t.should eq([1, 2, 3, 4, 5])
        
        t = [1, 2, 3, 4, 5]
        expect { t.drop! -2 }.to raise_error(ArgumentError, 'attempt to drop negative size')
    end
    specify("#expand_by") do
        [1, 2, 3].expand_by(:a, :b).should eq([1, :a, :b, 2, :a, :b, 3, :a, :b])
        [1, 2, 3].expand_by([:a, :b]).should eq([1, [:a, :b], 2, [:a, :b], 3, [:a, :b]])
        [].expand_by([:a, :b]).should eq([ ])
    end
    specify("#expand_by!") do
        t = [1, 2, 3]
        t.expand_by! :a, :b
        t.should eq([1, :a, :b, 2, :a, :b, 3, :a, :b])
        
        t = [1, 2, 3]
        t.expand_by! [:a, :b]
        t.should eq([1, [:a, :b], 2, [:a, :b], 3, [:a, :b]])
        
        t = []
        t.expand_by! [:a, :b]
        t.should eq([ ])
    end
    specify("#interlace") do
        [1, 2, 3].interlace(:a, :b).should eq([1, :a, :b, 2, :a, :b, 3])
    end
    specify("#interlace!") do
        t = [1, 2, 3]
        t.interlace! :a, :b
        t.should eq([1, :a, :b, 2, :a, :b, 3])
    end
    specify("#merge!") do
        t = [1, 2, 3]
        t.merge!([:a, :b])
        t.should eq([1, 2, 3, :a, :b])
    end
    specify("#remove!") do
        t = [1, 2, 3, 4]
        t.remove! { |i| i >= 3 }
        t.should eq([1, 2])

        t = [1, 2, 3, 4]
        t.remove! { false }
        t.should eq([1, 2, 3, 4])

        t = [1, 2, 3, 4]
        t.remove! { true }
        t.should eq([ ])        
    end
    specify("#shrink_to") do
        [1, 2, 3, 4, 5].shrink_to(3).should eq([1, 2, 3])
        [1, 2, 3, 4, 5].shrink_to(6).should eq([1, 2, 3, 4, 5])
        [1, 2, 3, 4, 5].shrink_to(0).should eq([])
        expect { [1, 2, 3, 4, 5].shrink_to(-3) }.to raise_error(ArgumentError, "negative argument")
    end
    specify("#shrink_to!") do
        t = [1, 2, 3, 4, 5]
        t.shrink_to! 3
        t.should eq([1, 2, 3])
        
        t = [1, 2, 3, 4, 5]
        t.shrink_to! 6
        t.should eq([1, 2, 3, 4, 5])
        
        t = [1, 2, 3, 4, 5]
        expect { t.shrink_to! -3 }.to raise_error(ArgumentError, "negative argument")
        
        t = [1, 2, 3, 4, 5]
        t.shrink_to! 0
        t.should eq([])
    end
    specify("#sum") do
        [1, 2, 3].sum.should eq(6)
    end
    specify("#to_h") do
        [[:a, :b], [:b, :a]].to_h.should eq({:a => :b, :b => :a})
        [:a, :b, :b, :a].to_h(:flat).should eq({:a => :b, :b => :a})
    end
    specify("#to_set") do
        [1, 2, 3].to_set.should eq(Set::new([1, 2, 3]))
    end
    specify("#zip!") do
        t = [1, 2, 3]
        t.zip!
        t.should eq([1, 2, 3].zip)
        
        t = [1, 2, 3]
        t.zip!([:a, :b], [:c], [:d, :e, :f])
        t.should eq([1, 2, 3].zip([:a, :b], [:c], [:d, :e, :f]))
        
        t = [1, 2, 3]
        t.zip!([:a, :b], [:d, :e, :f], [:c])
        t.should eq([1, 2, 3].zip([:a, :b], [:d, :e, :f], [:c]))
    end
end
