Hash Utils
==========

**Hash Utils** adds a lot of useful fundamental utility methods which 
are missing in Ruby, both to [Array][1] and [Hash][2] classes and 
introduces some useful methods and syntactic sugar to [Numeric][7], 
[Symbol][6] and [String][8] classes too.

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

[1]: http://www.ruby-doc.org/core/classes/Array.html
[2]: http://www.ruby-doc.org/core/classes/Hash.html
[3]: http://rubydoc.info/gems/hash-utils
[6]: http://www.ruby-doc.org/core/classes/Symbol.html
[7]: http://www.ruby-doc.org/core/classes/Numeric.html
[8]: http://www.ruby-doc.org/core/classes/String.html
[9]: http://github.com/martinkozak/hash-utils/issues
[10]: http://www.martinkozak.net/
