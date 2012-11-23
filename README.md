Hash Utils
==========

**hash-utils** gem adds more than 147 useful and frequently rather 
fundamental methods which are missing in Ruby programming language, 
to several core classes. It tries to be similar project to 
[Ruby Facets][1] on principle, but less complex, more practical, 
non-atomic and organized by better way.

- `Array` &ndash; 27 methods,
- `FalseClass` &ndash; 3 methods,
- `File` &ndash; 2 methods,
- `Gem` &ndash; 2 methods,
- `Hash` &ndash; 42 methods,
- `IO` &ndash; 1 method,
- `Module` &ndash; 1 method,
- `NilClass` &ndash; 1 method,
- `Numeric` &ndash; 5 method,
- `Object` &ndash; 15 methods,
- `Proc` &ndash; 1 method,
- `String` &ndash; 37 methods,
- `StringIO` &ndash; 1 method,
- `Symbol` &ndash; 8 methods,
- `TrueClass` &ndash; 3 methods.

For full reference and methods lists, see **[documentation][3]**.

[![Build Status](https://secure.travis-ci.org/martinkozak/hash-utils.png)](http://travis-ci.org/martinkozak/hash-utils)

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

Copyright &copy; 2011 &ndash; 2012 [Martin Kozák][10]. See `LICENSE.txt` for
further details.

[1]: http://rubyworks.github.com/facets/
[2]: http://github.com/martinkozak/ruby-version
[3]: http://rubydoc.info/gems/hash-utils
[9]: http://github.com/martinkozak/hash-utils/issues
[10]: http://www.martinkozak.net/
