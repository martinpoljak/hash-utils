Hash Utils
==========

**hash-utils** adds more than 65 useful and frequently rather 
fundamental methods which are missing in Ruby programming language, 
to several core classes. It tries to be similar project to 
[Ruby Facets][1] on principle, but less complex, more practical, 
non-atomic and organized by better way.

- `Array` &ndash; 3 methods,
- `File` &ndash; 2 methods,
- `Hash` &ndash; 30 methods,
- `Object` &ndash; 3 methods,
- `String` &ndash; 23 methods,
- `Symbol` &ndash; 5 methods.

For full reference and methods lists, see **[documentation][3]**.

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

[1]: http://rubyworks.github.com/facets/
[3]: http://rubydoc.info/gems/hash-utils
[9]: http://github.com/martinkozak/hash-utils/issues
[10]: http://www.martinkozak.net/
