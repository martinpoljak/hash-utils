Hash Utils
==========

**Hash Utils** adds some utility methods well known from [Array][1]
class to [Hash][2] class. Extends them with following methods:

* [`#compact`][3] – rejects elements with `nil` values,
* [`#compact!`][4]
* `#map_pairs` – works as [Array#map][5], but for *whole pair*,
* `#map_pairs!`
* `#map_keys` – works as [Array#map][5], but for *keys only*,
* `#map_keys!`
* `#keys_to_sym` – converts all keys to [Symbols][6],
* `#keys_to_sym!`

All methods with `!` emulates work *in place*, but in fact they 
replace old hash with new one. An example of use: 

    foo = {"a" => 1, "b" => 2}
    foo.map_keys! { |k| k.to_sym }
    
    # result will be
    #   {:a => 1, :b => 2}
    
This is the same as `#keys_to_sym!` for example. And also introduces
some methods known from Python to both [Array][1] and [Hash][2] class:

* `some?` – returns `true` if *some* element follows condition in block,
* `some_pairs?`
* `all?` – returns `true` if *all* element follows condition in block,
* `all_pairs?`

For example:

    foo = [:alfa, :beta, 5, :gama]
    foo.some? { |i| i.kind_of? Numeric }    # returns true
    foo.all? { |i| i.kind_of? Symbol }      # returns false
    
And finally introduces one method to [Numeric][7], [Symbol][6] and 
[String][8]:

* `in?` – returns `true` if value is in some Object which support 
`include?` method

For example:
    
    foo = [1, 2, 3, 5, 8]
    5.in? foo       # returns true
    5.in? 3..6      # returns true
    
As you can see, it's syntactic sugar, of sure, but useful in some cases.

### Modularization

If you don't want to include whole library, you can include extensions 
to appropriate type only by including the:

    require "hash-utils/<lowercase-data-type-name>"

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][9] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 [Martin Kozák][10]. See `LICENSE.txt` for
further details.

[1]: http://www.ruby-doc.org/core/classes/Array.html
[2]: http://www.ruby-doc.org/core/classes/Hash.html
[3]: http://www.ruby-doc.org/core/classes/Array.html#M000278
[4]: http://www.ruby-doc.org/core/classes/Array.html#M000279
[5]: http://www.ruby-doc.org/core/classes/Array.html#M000249
[6]: http://www.ruby-doc.org/core/classes/Symbol.html
[7]: http://www.ruby-doc.org/core/classes/Numeric.html
[8]: http://www.ruby-doc.org/core/classes/String.html
[9]: http://github.com/martinkozak/hash-utils/issues
[10]: http://www.martinkozak.net/
