#!/usr/bin/env ruby
# encoding: utf-8
# (c) 2011-2012 Martin Kozák (martinkozak@martinkozak.net)

require "spec_helper"

describe "String" do
    specify("#first") do
        "abcdefgh".first.should eq("a")
    end
    specify("#second") do
        "abcdefgh".second.should eq("b")
    end
    specify("#third") do
        "abcdefgh".third.should eq("c")
    end
    specify("#fourth") do
        "abcdefgh".fourth.should eq("d")
    end
    specify("#fifth") do
        "abcdefgh".fifth.should eq("e")
    end
    specify("#sixth") do
        "abcdefgh".sixth.should eq("f")
    end
    specify("#seventh") do
        "abcdefgh".seventh.should eq("g")
    end
    specify("#eighth") do
        "abcdefgh".eighth.should eq("h")
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
        "abc".last.should eq("c")
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
    specify("#map") do
        "012".map { |ch| (ch.to_i + 1).to_s }.should eq("123")
        "".map { |ch| (ch.to_i + 1).to_s }.should eq("")
    end
    specify("#map!") do
        t = "012"
        t.map! { |ch| (ch.to_i + 1).to_s }
        t.should eq("123")
        
        t = ""
        t.map! { |ch| (ch.to_i + 1).to_s }
        t.should eq("")
    end
    specify("#numeric?") do
        "123".numeric?.should be_true
        "123a".numeric?.should be_false
        "12a3".numeric?.should be_false
        "a123".numeric?.should be_false
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
    specify("#strtr") do
        "aa bb".strtr("aa" => "bb", "bb" => "aa").should eq("bb aa")
        "aa bb".strtr([["aa", "bb"], ["bb", "aa"]]).should eq("bb aa")
        "aa bb".strtr(["aa", "bb", "bb", "aa"], :flat).should eq("bb aa")
        "aa bb".strtr(:aa => "bb", :bb => "aa") { |s| s.to_sym }.should eq("bb aa")
    end
    specify("#strtr!") do
        t = "aa bb"
        t.strtr!("aa" => "bb", "bb" => "aa")
        t.should eq("bb aa")
        
        t = "aa bb"
        t.strtr!([["aa", "bb"], ["bb", "aa"]])
        t.should eq("bb aa")
        
        t = "aa bb"
        t.strtr!(["aa", "bb", "bb", "aa"], :flat)
        t.should eq("bb aa")
        
        t = "aa bb"
        t.strtr!(:aa => "bb", :bb => "aa") { |s| s.to_sym }
        t.should eq("bb aa")
    end
    specify("#swap_with") do
        foo = "abc"
        bar = "123"
        foo.swap_with(bar)
        
        foo.should eq("123") 
        bar.should eq("abc")
    end
    specify("#to_a") do
        "abc".to_a.should eq(["a", "b", "c"])
        "abc".to_a('X').should eq(["abc"])
        "aXbXc".to_a('X').should eq(["a", "b", "c"])
        "".to_a.should eq([ ])
        "".to_a('X').should eq([ ])
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
