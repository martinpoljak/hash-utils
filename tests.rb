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
        [1, 2, 3, 4, 5, 6, 7, 8].second == 2
    end
    specify("#third") do
        [1, 2, 3, 4, 5, 6, 7, 8].third == 3
    end
    specify("#fourth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fourth == 4
    end
    specify("#fifth") do
        [1, 2, 3, 4, 5, 6, 7, 8].fifth == 5
    end
    specify("#sixth") do
        [1, 2, 3, 4, 5, 6, 7, 8].sixth == 6
    end
    specify("#seventh") do
        [1, 2, 3, 4, 5, 6, 7, 8].seventh == 7
    end
    specify("#eighth") do
        [1, 2, 3, 4, 5, 6, 7, 8].eighth == 8
    end
    specify("#array?") do
        [1, 2, 3].array?
    end
    specify("#avg") do
        [1, 2, 3].avg == 2
    end
    specify("#clean") do
        t = [1, nil]
        t = t.clean(1)
        t == [nil]
    end
    specify("#clean!") do
        t = [1, nil]
        t.clean!(1)
        t == [nil]
    end
    specify("#sum") do
        [1, 2, 3].sum == 6
    end
    specify("#to_set") do
        [1, 2, 3].to_set == Set::new([1, 2, 3])
    end
end

## FALSECLASS

describe "FalseClass" do
    specify("#boolean?") do
        false.boolean?
    end
    specify("#convert") do
        false.convert(:a, :b) == :b
    end
    specify("#false?") do
        false.false?
    end
    specify("#to_i") do
        false.to_i == 0
    end
    specify("#true?") do
        not false.true?
    end
end

## FILE

describe "File" do
    specify("#touch") do 
        File.touch("./~test1")
        File.exists? "./~test1"
    end
    specify("#write") do
        File.write("./~test2", "some string")
        File.read("./~test2") == "some string"
    end
    
    after(:all) do 
        File.unlink("./~test1")
        File.unlink("./~test2")
    end
end

## HASH

describe "Hash" do
    specify("#avg") do
        { :a => 1, :b => 2 }.avg == 1.5
    end 
    specify("#clean") do
        t = { :a => 1, :b => nil }
        t = t.clean(1)
        t == { :b => nil }
    end
    specify("#clean!") do
        t = { :a => 1, :b => nil }
        t.clean!(1)
        t == { :b => nil }
    end
    specify("#compact") do
        t = { :a => 1, :b => nil }
        t = t.compact
        t == { :a => 1 }
    end
    specify("#compact!") do
        t = { :a => 1, :b => nil }
        t.compact!
        t == { :a => 1 }
    end
    specify("#flip") do
        t = { :a => 1, :b => 2, :c => 2 }
        result = t.flip
        result == { 1 => :a, 2 => :c }
    end
    specify("#flip!") do
        t = { :a => 1, :b => 2, :c => 2 }
        t.flip!
        t == { 1 => :a, 2 => :c }
    end
    specify("#get_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.get_pairs(:a, :c, :d) { |i| result << i }
        result == [[:a, 1], [:c, 3]]
    end
    specify("#get_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_items(:a, :c, :d) == { :a => 1, :c => 3 }
    end
    specify("#get_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.get_values(:a, :c, :d) == [1, 3]
    end
    specify("#get_values") do
        { :a => 1, :b => 2, :c => 3 }.hash?
    end
    specify("#map_values") do
        { :a => 1, :b => 2 }.map_values { |i| i + 1 } == { :a => 2, :b => 3 }
    end
    specify("#map_values!") do
        t = { :a => 1, :b => 2 }
        t.map_values! { |i| i + 1 } 
        t == { :a => 2, :b => 3 }
    end
    specify("#deep_merge") do
        h1 = {:a => {:b => :c, :d => :e}}
        h2 = {:a => {:d => :f, :h => :i}}
        h = h1.deep_merge(h2) 
        (h == {:a => {:b => :c, :d => :f, :h => :i}}) and (h1 == {:a => {:b => :c, :d => :e}})
    end
    specify("#deep_merge!") do
        h = {:a => {:b => :c, :d => :e}}
        h.deep_merge!({:a => {:d => :f, :h => :i}})
        h == {:a => {:b => :c, :d => :f, :h => :i}}
    end
    specify("#keys_to_sym") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym == {:a => "b", 2 => "c", :d => "e"}
    end
    specify("#keys_to_sym!") do
        h = {"a" => "b", 2 => "c", "d" => "e"}
        h.keys_to_sym! 
        h == {:a => "b", 2 => "c", :d => "e"}
    end
    specify("#sum") do
        { :a => 1, :b => 2 }.sum == 3
    end
    specify("#take_pairs") do
        h = { :a => 1, :b => 2, :c => 3 }
        result = [ ]
        h.take_pairs(:a, :c, :d) { |i| result << i }
        result == [[:a, 1], [:c, 3], [:d, nil]]
    end
    specify("#take_items") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_items(:a, :c, :d) == { :a => 1, :c => 3, :d => nil }
    end
    specify("#take_values") do
        h = { :a => 1, :b => 2, :c => 3 }
        h.take_values(:a, :c, :d) == [1, 3, nil]
    end
    
end

## IO

describe "IO" do
    specify("#io?") do
        io = File::open("./~test", "w")
        result = io.io?
        io.close()
        result
    end
    after(:all) do 
        File.unlink("./~test")
    end    
end

## MODULE

describe "Module" do
    specify("#get_module") do
        require "zlib"
        Kernel.get_module("Zlib::Inflate") == Zlib::Inflate
    end
end

## NILCLASS

describe "NilClass" do
    specify("#to_boolean") do
        nil.to_boolean("xyz") === false
    end
end

## NUMERIC

describe "Numeric" do
    specify("#compare") do
        5.compare(1) == 1 and 5.compare(5) == 0 and 5.compare(7) == -1
    end
    specify("#negative?") do
        not 5.negative? and -2.negative?
    end
    specify("#negative!") do
        5.negative! == -5 and -5.negative! == -5
    end
    specify("#number?") do
        5.number?
    end
    specify("#positive?") do
        5.positive? and not -2.positive?
    end
    specify("#positive!") do
        5.positive! == 5 and -5.positive! ==  5
    end
end

## OBJECT

describe "Object" do
    specify("#**") do
        "ab" ** 5 == ["ab", "ab", "ab", "ab", "ab"]
    end
    specify("#array?") do
        not "".array? and [].array?
    end
    specify("#boolean?") do
        true.boolean? and false.boolean? and not "".boolean?
    end
    specify("#enumerable?") do
        [].enumerable? and not 5.enumerable?
    end
    specify("#false?") do
        (false.false? == true) and ("string".false? == false)
    end
    specify("#hash?") do
        not "".hash? and {}.hash?
    end
    specify("#in?") do
        5.in? 1..7 and not 9.in? 1..7
    end
    specify("#instance_of_any?") do
        "".instance_of_any? [String, Symbol] \
            and not "".instance_of_any? [Integer, Float] \
            and "".instance_of_any? String, Symbol
    end
    specify("#io?") do
        not "".io?
    end
    specify("#kind_of_any?") do
        "".kind_of_any? [String, Symbol] \
            and not "".kind_of_any? [Integer, Float] \
            and "".kind_of_any? String, Symbol
    end
    specify("#number?") do
        not :abcd.number? and 5.number?
    end
    specify("#proc?") do
        proc = Proc::new { }
        not :abcd.proc? and proc.proc?
    end
    specify("#string?") do
        "".string? and not 5.string?
    end
    specify("#symbol?") do
        :abcd.symbol? and not 5.symbol?
    end
    specify("#to_b") do
        (nil.to_b === false) and ("ab".to_b === true)
    end
    specify("#to_sym") do
        ("ab".to_sym === :ab) and (12.to_sym == :"12")
    end
    specify("#true?") do
        (true.true? == true) and ("string".true? == false)
    end
end

## STRING

describe "String" do
    specify("#first") do
        "abcdefgh".first == ?a
    end
    specify("#second") do
        "abcdefgh".second == ?b
    end
    specify("#third") do
        "abcdefgh".third == ?c
    end
    specify("#fourth") do
        "abcdefgh".fourth == ?d
    end
    specify("#fifth") do
        "abcdefgh".fifth == ?e
    end
    specify("#sixth") do
        "abcdefgh".sixth == ?f
    end
    specify("#seventh") do
        "abcdefgh".seventh == ?g
    end
    specify("#eighth") do
        "abcdefgh".eighth == ?h
    end
    specify("#cut!") do
        foo = "0123456789"
        foo.cut! 3..5
        foo == "345"
    end
    specify("#first_line") do
        res = true
        res &= "a\nb\nc\n".first_line == "a\n"
        res &= "a".first_line == "a"
    end
    specify("#first_lines") do
        res = true
        res &= "a\nb".first_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".first_lines(4) == ["a\n", "b\n", "c\n"]
    end
    specify("#interlace") do
        "abc".interlace("123") == "a123b123c"
    end
    specify("#interlace!") do
        foo = "abc"
        foo.interlace! "123"
        foo == "a123b123c"
    end
    specify("#last") do
        "abc".last == ?c
    end
    specify("#last_line") do
        res = true
        res &= "a\nb\nc\n".last_line == ""
        res &= "a\nb\nc".last_line == "c"
        res &= "a".last_line == "a"
    end
    specify("#last_lines") do
        res = true
        res &= "a\nb".last_lines(2) == ["a\n", "b"]
        res &= "a\nb\nc\n".last_lines(4) == ["a\n", "b\n", "c\n", ""]
    end
    specify("#lcfirst") do
        str = "ABCD"
        str.lcfirst == "aBCD" and str == "ABCD"
    end
    specify("#lcfirst!") do
        str = "ABCD"
        str.lcfirst! == "aBCD" and str == "aBCD"
    end
    specify("#pop") do
        res = true
        str = "abcd"
        res &= str.pop == "d"
        res &= str == "abc"
        str = "abcd"
        res &= str.pop(2) == "cd"
        res &= str == "ab"
    end
    specify("#pop_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.pop_line == "d"
        res &= str = "a\nb\nc\n"
    end
    specify("#pop_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.pop_lines(2) == ["d\n", ""]
        res &= str = "a\nb\nc\n"
    end
    specify("#push_line") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_line("1") == "a\nb\nc\nd\n1"
        res &= str == "a\nb\nc\nd\n1"
    end
    specify("#push_lines") do
        res = true
        str = "a\nb\nc\nd"
        res &= str.push_lines("1", "2") == "a\nb\nc\nd\n1\n2"
        res &= str == "a\nb\nc\nd\n1\n2"
    end
    specify("#random") do
        str1 = String::random(30)
        str2 = String::random(30)
        
        str1 != str2
    end
    specify("#shift") do
        res = true
        str = "abcd"
        res &= str.shift == "a"
        res &= str == "bcd"
        str = "abcd"
        res &= str.shift(2) == "ab"
        res &= str == "cd"
    end
    specify("#shift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_line == "a\n"
        res &= str = "b\nc\nd\n"
    end
    specify("#shift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.shift_lines(2) == ["a\n", "b\n"]
        res &= str = "c\nd\n"
    end
    specify("#string?") do
        "abcd".string?
    end
    specify("#swap_with") do
        foo = "abc"
        bar = "123"
        foo.swap_with(bar)
        foo = "123" and bar = "abc"
    end
    specify("#to_boolean") do
        "alfa".to_boolean("alfa") == true
    end
    specify("#ucfirst") do
        str = "abcd"
        str.ucfirst == "Abcd" and str == "abcd"
    end
    specify("#ucfirst!") do
        str = "abcd"
        str.ucfirst! == "Abcd" and str == "Abcd"
    end
    specify("#unshift") do
        res = true
        str = "abcd"
        res &= str.unshift("123") == "123abcd"
        res &= str == "123abcd"        
    end
    specify("#unshift_line") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_line("1") == "1\na\nb\nc\nd\n"
        res &= str == "1\na\nb\nc\nd\n"
    end
    specify("#unshift_lines") do
        res = true
        str = "a\nb\nc\nd\n"
        res &= str.unshift_lines("1", "2") == "1\n2\na\nb\nc\nd\n"
        res &= str == "1\n2\na\nb\nc\nd\n"
    end

end

## STRINGIO

describe "StringIO" do
    specify("#io?") do
        StringIO::new.io?
    end
end

## SYMBOL

describe "Symbol" do
    specify("#*") do
        :a * 5 == :aaaaa
    end
    specify("#+") do
        :a + :b == :ab
    end
    specify("#[]") do
        :abcde[0...3] == "abc"
    end
    specify("#append") do
        :abcd.append("efg") == :abcdefg
    end
    specify("#end_with?") do
        :abcde.end_with? "ghi", "cde"
    end
    specify("#prepend") do
        :abcd.prepend("012") == :"012abcd"
    end
    specify("#split") do
        :ab_cd_ef.split("_", 2) == [:ab, :cd_ef]
    end
    specify("#start_with?") do
        :abcde.start_with? "ghi", "abc"
    end
    specify("#strip") do
        :"  a  ".strip == :a
    end
end

## TRUECLASS

describe "TrueClass" do
    specify("#boolean?") do
        true.boolean?
    end
    specify("#convert") do
        true.convert(:a, :b) == :a
    end
    specify("#false?") do
        not true.false?
    end
    specify("#to_i") do
        true.to_i == 1
    end
    specify("#true?") do
        true.true?
    end
end

