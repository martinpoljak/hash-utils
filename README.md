Hash Utils
==========

**hash Utils** adds some utility methods well known from [Array][1]
cl  ass to [Hash][2] class. Extends it with following methods:

* [#compact][3] -- rejects elements with `nil` values,
* [#compact!][4]
* #map_pairs -- works as [Array#map][5], but for whole pair,
* #map_pairs!
* #map_keys -- works as [Array#map][5], but for keys only,
* #map_keys!
* keys_to_sym -- converts all keys to [Symbols][6],
* keys_to_sym!

All methods with `!` emulates work *in place*, but in fact they will 
replace old hash with new one. An example of use: 

    foo = {"a" => 1, "b" => 2}
    foo.map_keys! { |k| k.to_sym }
    
    # result is 
    #   {:a => 1, :b => 2}
    
This one is #keys_to_sym! for example.

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

Copyright (c) 2011 [Martin Kozák][8]. See `LICENSE.txt` for
further details.

[1]: http://www.ruby-doc.org/core/classes/Array.html
[2]: http://www.ruby-doc.org/core/classes/Hash.html
[3]: http://www.ruby-doc.org/core/classes/Array.html#M000278
[4]: http://www.ruby-doc.org/core/classes/Array.html#M000279
[5]: http://www.ruby-doc.org/core/classes/Array.html#M000249
[6]: http://www.ruby-doc.org/core/classes/Symbol.html
[7]: http://github.com/martinkozak/hash-utils/issues
[8]: http://www.martinkozak.net/
