#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

$:.push("./lib")
$:.unshift("./lib")

require "rspec"
require "stringio"

require "simplecov"
SimpleCov.start

require "hash-utils"


## ARRAY

# Filozofové mají Kanta rádi. Matematici mají Kanta také rádi, jen si 
# myslí, že většina z toho, co vymyslel, je blbost.
#
# doc. Jiří Souček

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

## FALSECLASS

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

## FILE

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

## HASH

describe "Hash" do
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
    specify("#flip") do
        t = { :a => 1, :b => 2, :c => 2 }
        result = t.flip
        result.should eq({ 1 => :a, 2 => :c })
    end
    specify("#flip!") do
        t = { :a => 1, :b => 2, :c => 2 }
        t.flip!
        t.should eq({ 1 => :a, 2 => :c })
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
    specify("#map_values") do
        { :a => 1, :b => 2 }.map_values { |i| i + 1 }.should eq({ :a => 2, :b => 3 })
    end
    specify("#map_values!") do
        t = { :a => 1, :b => 2 }
        t.map_values! { |i| i + 1 } 
        t.should eq({ :a => 2, :b => 3 })
    end
    specify("#deep_merge") do
        h1 = {:a => {:b => :c, :d => :e}}
        h2 = {:a => {:d => :f, :h => :i}}
        h = h1.deep_merge(h2) 
        h.should eq({:a => {:b => :c, :d => :f, :h => :i}})
        h1.should eq({:a => {:b => :c, :d => :e}})
    end
    specify("#deep_merge!") do
        h = {:a => {:b => :c, :d => :e}}
        h.deep_merge!({:a => {:d => :f, :h => :i}})
        h.should eq({:a => {:b => :c, :d => :f, :h => :i}})
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
    specify("#sum") do
        { :a => 1, :b => 2 }.sum.should eq(3)
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

## IO

describe "IO" do
    specify("#io?") do
        io = File::open("./~test", "w")
        result = io.io?
        io.close()
        result.should be_true
    end
    after(:all) do 
        File.unlink("./~test")
    end    
end

## MODULE

describe "Module" do
    specify("#get_module") do
        require "zlib"
        Kernel.get_module("Zlib::Inflate").should eq(Zlib::Inflate)
    end
end

## NILCLASS

describe "NilClass" do
    specify("#to_boolean") do
        nil.to_boolean("xyz").should be_false
    end
end

## NUMERIC

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

## OBJECT

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
    specify("#to_sym") do
        "ab".to_sym.should eq(:ab)
        12.to_sym.should eq(:"12")
    end
    specify("#true?") do
        true.true?.should be_true
        "string".true?.should be_false
    end
end

## STRING

describe "String" do
    specify("#first") do
        "abcdefgh".first.should eq(?a)
    end
    specify("#second") do
        "abcdefgh".second.should eq(?b)
    end
    specify("#third") do
        "abcdefgh".third.should eq(?c)
    end
    specify("#fourth") do
        "abcdefgh".fourth.should eq(?d)
    end
    specify("#fifth") do
        "abcdefgh".fifth.should eq(?e)
    end
    specify("#sixth") do
        "abcdefgh".sixth.should eq(?f)
    end
    specify("#seventh") do
        "abcdefgh".seventh.should eq(?g)
    end
    specify("#eighth") do
        "abcdefgh".eighth.should eq(?h)
    end
    specify("#cut!") do
        foo = "0123456789"
        foo.cut! 3..5
        foo.should eq("345")
    end
    specify("#first_line") do
        res = true
        res &= "a\nb\nc\n".first_line == "a\n"
        res &= "a".first_line == "a"
        res.should be_true
    end
    specify("#first_lines") do
        res = true
        res &= "a\nb".first_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".first_lines(4) == ["a\n", "b\n", "c\n"]
        res.should be_true
    end
    specify("#interlace") do
        "abc".interlace("123").should eq("a123b123c")
    end
    specify("#interlace!") do
        foo = "abc"
        foo.interlace! "123"
        foo.should eq("a123b123c")
    end
    specify("#last") do
        "abc".last.should eq(?c)
    end
    specify("#last_line") do
        res = true
        res &= "a\nb\nc\n".last_line == ""
        res &= "a\nb\nc".last_line == "c"
        res &= "a".last_line == "a"
        res.should be_true
    end
    specify("#last_lines") do
        res = true
        res &= "a\nb".last_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".last_lines(4) == ["a\n", "b\n", "c\n", ""]
        res.should be_true
    end
    specify("#lcfirst") do
        str = "ABCD"
        str.lcfirst.should eq("aBCD")
        str.should eq("ABCD")
    end
    specify("#lcfirst!") do
        str = "ABCD"
        str.lcfirst!.should eq("aBCD")
        str.should eq("aBCD")
    end
    specify("#pop") do
        res = true
        str = "abcd"
        res &= str.pop == "d"
        res &= str == "abc"
        str = "abcd"
        res &= str.pop(2) == "cd"
        res &= str == "ab"
        res.should be_true
    end
    specify("#pop_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.pop_line == "d"
        res &= str = "a\nb\nc\n"
        res.should be_true
    end
    specify("#pop_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.pop_lines(2) == ["d\n", ""]
        res &= str = "a\nb\nc\n"
        res.should be_true
    end
    specify("#push_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_line("1") == "a\nb\nc\nd\n1"
        res &= str == "a\nb\nc\nd\n1"
        res.should be_true
    end
    specify("#push_lines") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_lines("1", "2") == "a\nb\nc\nd\n1\n2"
        res &= str == "a\nb\nc\nd\n1\n2"
        res.should be_true
    end
    specify("#random") do
        str1 = String::random(30)
        str2 = String::random(30)
        (str1 != str2).should be_true
    end
    specify("#shift") do
        res = true
        str = "abcd"
        res &= str.shift == "a"
        res &= str == "bcd"
        str = "abcd"
        res &= str.shift(2) == "ab"
        res &= str == "cd"
        res.should be_true
    end
    specify("#shift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_line == "a\n"
        res &= str = "b\nc\nd\n"
        res.should be_true
    end
    specify("#shift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_lines(2) == ["a\n", "b\n"]
        res &= str = "c\nd\n"
        res.should be_true
    end
    specify("#string?") do
        "abcd".string?.should be_true
    end
    specify("#swap_with") do
        foo = "abc"
        bar = "123"
        foo.swap_with(bar)
        
        foo.should eq("123") 
        bar.should eq("abc")
    end
    specify("#to_boolean") do
        "alfa".to_boolean("alfa").should be_true
    end
    specify("#ucfirst") do
        str = "abcd"
        str.ucfirst.should eq("Abcd")
        str.should eq("abcd")
    end
    specify("#ucfirst!") do
        str = "abcd"
        str.ucfirst!.should eq("Abcd")
        str.should eq("Abcd")
    end
    specify("#unshift") do
        res = true
        str = "abcd"
        res &= str.unshift("123") == "123abcd"
        res &= str == "123abcd"        
        res.should be_true
    end
    specify("#unshift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_line("1") == "1\na\nb\nc\nd\n"
        res &= str == "1\na\nb\nc\nd\n"
        res.should be_true
    end
    specify("#unshift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_lines("1", "2") == "1\n2\na\nb\nc\nd\n"
        res &= str == "1\n2\na\nb\nc\nd\n"
        res.should be_true
    end

end

## STRINGIO

describe "StringIO" do
    specify("#io?") do
        StringIO::new.io?.should be_true
    end
end

## SYMBOL

describe "Symbol" do
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
    end
    specify("#prepend") do
        :abcd.prepend("012").should eq(:"012abcd")
    end
    specify("#split") do
        :ab_cd_ef.split("_", 2).should eq([:ab, :cd_ef])
    end
    specify("#start_with?") do
        :abcde.start_with?("ghi", "abc").should be_true
    end
    specify("#strip") do
        :"  a  ".strip.should eq(:a)
    end
end

## TRUECLASS

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

