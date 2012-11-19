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
        [1, 2, 3, 4, 5, 6, 7, 8].second.should == 2
    end
    specify("#third") do
        [1, 2, 3, 4, 5, 6, 7, 8].third.should == 3
    end
    specify("#fourth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fourth.should == 4
    end
    specify("#fifth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fifth.should == 5
    end
    specify("#sixth") do
        [1, 2, 3, 4, 5, 6, 7, 8].sixth.should == 6
    end
    specify("#seventh") do
        [1, 2, 3, 4, 5, 6, 7, 8].seventh.should == 7
    end
    specify("#eighth") do
        [1, 2, 3, 4, 5, 6, 7, 8].eighth.should == 8
    end
    specify("#array?") do
        [1, 2, 3].array?.should == true
    end
    specify("#avg") do
        [1, 2, 3].avg.should == 2
    end
    specify("#clean") do
        t = [1, nil]
        t = t.clean(1)
        t.should == [nil]
    end
    specify("#clean!") do
        t = [1, nil]
        t.clean!(1)
        t.should == [nil]
    end
    specify("#sum") do
        [1, 2, 3].sum.should == 6
    end
    specify("#to_set") do
        [1, 2, 3].to_set.should == Set::new([1, 2, 3])
    end
end

## FALSECLASS

describe "FalseClass" do
    specify("#boolean?") do
        false.boolean?.should == true
    end
    specify("#convert") do
        false.convert(:a, :b).should == :b
    end
    specify("#false?") do
        false.false?.should == true
    end
    specify("#to_i") do
        false.to_i.should == 0
    end
    specify("#true?") do
        (not false.true?).should == true
    end
end

## FILE

describe "File" do
    specify("#touch") do 
        File.touch("./~test1")
        File.exists?("./~test1").should == true
    end
    specify("#write") do
        File.write("./~test2", "some string")
        File.read("./~test2").should == "some string"
    end
    
    after(:all) do 
        File.unlink("./~test1")
        File.unlink("./~test2")
    end
end

## HASH

describe "Hash" do
    specify("#avg") do
        { :a => 1, :b => 2 }.avg.should == 1.5
    end 
    specify("#clean") do
        t = { :a => 1, :b => nil }
        t = t.clean(1)
        t.should == { :b => nil }
    end
    specify("#clean!") do
        t = { :a => 1, :b => nil }
        t.clean!(1)
        t.should == { :b => nil }
    end
    specify("#compact") do
        t = { :a => 1, :b => nil }
        t = t.compact
        t.should == { :a => 1 }
    end
    specify("#compact!") do
        t = { :a => 1, :b => nil }
        t.compact!
        t.should == { :a => 1 }
    end
    specify("#flip") do
        t = { :a => 1, :b => 2, :c => 2 }
        result = t.flip
        result.should == { 1 => :a, 2 => :c }
    end
    specify("#flip!") do
        t = { :a => 1, :b => 2, :c => 2 }
        t.flip!
        t.should == { 1 => :a, 2 => :c }
    end
    specify("#get_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.get_pairs(:a, :c, :d) { |i| result << i }
        result.should == [[:a, 1], [:c, 3]]
    end
    specify("#get_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_items(:a, :c, :d).should == { :a => 1, :c => 3 }
    end
    specify("#get_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_values(:a, :c, :d).should == [1, 3]
    end
    specify("#get_values") do
        { :a => 1, :b => 2, :c => 3 }.hash?.should == true
    end
    specify("#map_values") do
        { :a => 1, :b => 2 }.map_values { |i| i + 1 }.should == { :a => 2, :b => 3 }
    end
    specify("#map_values!") do
        t = { :a => 1, :b => 2 }
        t.map_values! { |i| i + 1 } 
        t.should == { :a => 2, :b => 3 }
    end
    specify("#deep_merge") do
        h1 = {:a => {:b => :c, :d => :e}}
        h2 = {:a => {:d => :f, :h => :i}}
        h = h1.deep_merge(h2) 
        h.should == {:a => {:b => :c, :d => :f, :h => :i}}
        h1.should == {:a => {:b => :c, :d => :e}}
    end
    specify("#deep_merge!") do
        h = {:a => {:b => :c, :d => :e}}
        h.deep_merge!({:a => {:d => :f, :h => :i}})
        h.should == {:a => {:b => :c, :d => :f, :h => :i}}
    end
    specify("#keys_to_sym") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym.should == {:a => "b", 2 => "c", :d => "e"}
    end
    specify("#keys_to_sym!") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym! 
        h.should == {:a => "b", 2 => "c", :d => "e"}
    end
    specify("#sum") do
        { :a => 1, :b => 2 }.sum.should == 3
    end
    specify("#take_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.take_pairs(:a, :c, :d) { |i| result << i }
        result.should == [[:a, 1], [:c, 3], [:d, nil]]
    end
    specify("#take_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_items(:a, :c, :d).should == { :a => 1, :c => 3, :d => nil }
    end
    specify("#take_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_values(:a, :c, :d).should == [1, 3, nil]
    end
    
end

## IO

describe "IO" do
    specify("#io?") do
        io = File::open("./~test", "w")
        result = io.io?
        io.close()
        result.should == true
    end
    after(:all) do 
        File.unlink("./~test")
    end    
end

## MODULE

describe "Module" do
    specify("#get_module") do
        require "zlib"
        Kernel.get_module("Zlib::Inflate").should == Zlib::Inflate
    end
end

## NILCLASS

describe "NilClass" do
    specify("#to_boolean") do
        nil.to_boolean("xyz").should === false
    end
end

## NUMERIC

describe "Numeric" do
    specify("#compare") do
        5.compare(1).should == 1 
        5.compare(5).should == 0 
        5.compare(7).should == -1
    end
    specify("#negative?") do
        5.negative?.should_not == true
        -2.negative?.should == true
    end
    specify("#negative!") do
        5.negative!.should == -5 
        -5.negative!.should == -5
    end
    specify("#number?") do
        5.number?.should == true
    end
    specify("#positive?") do
        5.positive?.should == true
        -2.positive?.should_not == true
    end
    specify("#positive!") do
        5.positive!.should == 5 
        -5.positive!.should == 5
    end
end

## OBJECT

describe "Object" do
    specify("#**") do
        ("ab" ** 5).should == ["ab", "ab", "ab", "ab", "ab"]
    end
    specify("#array?") do
        "".array?.should_not == true 
        [].array?.should == true
    end
    specify("#boolean?") do
        true.boolean?.should == true
        false.boolean?.should == true 
        "".boolean?.should_not == true
    end
    specify("#enumerable?") do
        [].enumerable?.should == true 
        5.enumerable?.should_not == true
    end
    specify("#false?") do
        false.false?.should == true 
        "string".false?.should_not == true
    end
    specify("#hash?") do
        "".hash?.should_not == true 
        {}.hash?.should == true
    end
    specify("#in?") do
        (5.in? 1..7).should == true 
        (9.in? 1..7).should_not == true
    end
    specify("#instance_of_any?") do
        "".instance_of_any?([String, Symbol]).should == true
        "".instance_of_any?([Integer, Float]).should_not == true
        "".instance_of_any?(String, Symbol).should == true
    end
    specify("#io?") do
        "".io?.should_not == true
    end
    specify("#kind_of_any?") do
        "".kind_of_any?([String, Symbol]).should == true
        "".kind_of_any?([Integer, Float]).should_not == true
        "".kind_of_any?(String, Symbol).should == true
    end
    specify("#number?") do
        :abcd.number?.should_not == true 
        5.number?.should == true
    end
    specify("#proc?") do
        proc = Proc::new { }
        :abcd.proc?.should_not == true 
        proc.proc?.should == true
    end
    specify("#string?") do
        "".string?.should == true
        5.string?.should_not == true
    end
    specify("#symbol?") do
        :abcd.symbol?.should == true 
        5.symbol?.should_not == true
    end
    specify("#to_b") do
        nil.to_b.should === false
        "ab".to_b.should === true
    end
    specify("#to_sym") do
        "ab".to_sym.should === :ab
        12.to_sym.should == :"12"
    end
    specify("#true?") do
        true.true?.should == true
        "string".true?.should == false
    end
end

## STRING

describe "String" do
    specify("#first") do
        "abcdefgh".first.should == ?a
    end
    specify("#second") do
        "abcdefgh".second.should == ?b
    end
    specify("#third") do
        "abcdefgh".third.should == ?c
    end
    specify("#fourth") do
        "abcdefgh".fourth.should == ?d
    end
    specify("#fifth") do
        "abcdefgh".fifth.should == ?e
    end
    specify("#sixth") do
        "abcdefgh".sixth.should == ?f
    end
    specify("#seventh") do
        "abcdefgh".seventh.should == ?g
    end
    specify("#eighth") do
        "abcdefgh".eighth.should == ?h
    end
    specify("#cut!") do
        foo = "0123456789"
        foo.cut! 3..5
        foo.should == "345"
    end
    specify("#first_line") do
        res = true
        res &= "a\nb\nc\n".first_line == "a\n"
        res &= "a".first_line == "a"
        res.should == true
    end
    specify("#first_lines") do
        res = true
        res &= "a\nb".first_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".first_lines(4) == ["a\n", "b\n", "c\n"]
        res.should == true
    end
    specify("#interlace") do
        "abc".interlace("123").should == "a123b123c"
    end
    specify("#interlace!") do
        foo = "abc"
        foo.interlace! "123"
        foo.should == "a123b123c"
    end
    specify("#last") do
        "abc".last.should == ?c
    end
    specify("#last_line") do
        res = true
        res &= "a\nb\nc\n".last_line == ""
        res &= "a\nb\nc".last_line == "c"
        res &= "a".last_line == "a"
        res.should == true
    end
    specify("#last_lines") do
        res = true
        res &= "a\nb".last_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".last_lines(4) == ["a\n", "b\n", "c\n", ""]
        res.should == true
    end
    specify("#lcfirst") do
        str = "ABCD"
        str.lcfirst.should == "aBCD"
        str.should == "ABCD"
    end
    specify("#lcfirst!") do
        str = "ABCD"
        str.lcfirst!.should == "aBCD"
        str.should == "aBCD"
    end
    specify("#pop") do
        res = true
        str = "abcd"
        res &= str.pop == "d"
        res &= str == "abc"
        str = "abcd"
        res &= str.pop(2) == "cd"
        res &= str == "ab"
        res.should == true
    end
    specify("#pop_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.pop_line == "d"
        res &= str = "a\nb\nc\n"
        res.should == true
    end
    specify("#pop_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.pop_lines(2) == ["d\n", ""]
        res &= str = "a\nb\nc\n"
        res.should == true
    end
    specify("#push_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_line("1") == "a\nb\nc\nd\n1"
        res &= str == "a\nb\nc\nd\n1"
        res.should == true
    end
    specify("#push_lines") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_lines("1", "2") == "a\nb\nc\nd\n1\n2"
        res &= str == "a\nb\nc\nd\n1\n2"
        res.should == true
    end
    specify("#random") do
        str1 = String::random(30)
        str2 = String::random(30)
        (str1 != str2).should == true
    end
    specify("#shift") do
        res = true
        str = "abcd"
        res &= str.shift == "a"
        res &= str == "bcd"
        str = "abcd"
        res &= str.shift(2) == "ab"
        res &= str == "cd"
        res.should == true
    end
    specify("#shift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_line == "a\n"
        res &= str = "b\nc\nd\n"
        res.should == true
    end
    specify("#shift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_lines(2) == ["a\n", "b\n"]
        res &= str = "c\nd\n"
        res.should == true
    end
    specify("#string?") do
        "abcd".string?.should == true
    end
    specify("#swap_with") do
        foo = "abc"
        bar = "123"
        foo.swap_with(bar)
        
        foo.should == "123" 
        bar.should == "abc"
    end
    specify("#to_boolean") do
        "alfa".to_boolean("alfa").should == true
    end
    specify("#ucfirst") do
        str = "abcd"
        str.ucfirst.should == "Abcd"
        str.should == "abcd"
    end
    specify("#ucfirst!") do
        str = "abcd"
        str.ucfirst!.should == "Abcd"
        str.should == "Abcd"
    end
    specify("#unshift") do
        res = true
        str = "abcd"
        res &= str.unshift("123") == "123abcd"
        res &= str == "123abcd"        
        res.should == true
    end
    specify("#unshift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_line("1") == "1\na\nb\nc\nd\n"
        res &= str == "1\na\nb\nc\nd\n"
        res.should == true
    end
    specify("#unshift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_lines("1", "2") == "1\n2\na\nb\nc\nd\n"
        res &= str == "1\n2\na\nb\nc\nd\n"
        res.should == true
    end

end

## STRINGIO

describe "StringIO" do
    specify("#io?") do
        StringIO::new.io?.should == true
    end
end

## SYMBOL

describe "Symbol" do
    specify("#*") do
        (:a * 5).should == :aaaaa
    end
    specify("#+") do
        (:a + :b).should == :ab
    end
    specify("#[]") do
        :abcde[0...3].should == "abc"
    end
    specify("#append") do
        :abcd.append("efg").should == :abcdefg
    end
    specify("#end_with?") do
        :abcde.end_with?("ghi", "cde").should == true
    end
    specify("#prepend") do
        :abcd.prepend("012").should == :"012abcd"
    end
    specify("#split") do
        :ab_cd_ef.split("_", 2).should == [:ab, :cd_ef]
    end
    specify("#start_with?") do
        :abcde.start_with?("ghi", "abc").should == true
    end
    specify("#strip") do
        :"  a  ".strip.should == :a
    end
end

## TRUECLASS

describe "TrueClass" do
    specify("#boolean?") do
        true.boolean?.should == true
    end
    specify("#convert") do
        true.convert(:a, :b).should == :a
    end
    specify("#false?") do
        true.false?.should_not == true
    end
    specify("#to_i") do
        true.to_i.should == 1
    end
    specify("#true?") do
        true.true?.should == true
    end
end

