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

* `some?` –  returns `true` if *some* element follows condition in block,
* `some_pairs?`
* `all?` –  returns `true` if *all* element follows condition in block,
* `all_pairs?`

For example:

    foo = [:alfa, :beta, 5, :gama]
    foo.some? { |i| i.kind_of? Integer }    # returns true
    foo.all? { |i| i.kind_of? Symbol }      # returns false

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][7] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 [Martin Kozák][8]. See `LICENSE.txt` for
further details.

[1]: http://www.ruby-doc.org/core/classes/Array.html
[2]: http://www.ruby-doc.org/core/classes/Hash.html
[3]: http://www.ruby-doc.org/core/classes/Array.html#M000278
[4]: http://www.ruby-doc.org/core/classes/Array.html#M000279
[5]: http://www.ruby-doc.org/core/classes/Array.html#M000249
[6]: http://www.ruby-doc.org/core/classes/Symbol.html
[7]: http://github.com/martinkozak/hash-utils/issues
[8]: http://www.martinkozak.net/
