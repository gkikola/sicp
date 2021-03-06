Selected SICP Exercise Solutions
================================

These are some of my solutions to the coding exercises in the
[Structure and Interpretation of Computer Programs, 2nd
Edition](https://mitpress.mit.edu/sites/default/files/sicp/index.html)
by Abelson, Sussman, and Sussman. This book, SICP (also called the
Wizard Book), is a classic text in computer science.


About
-----

This is not meant to be a complete solution guide, at least for the
time being. Only exercises that ask the reader to write some code are
included; exercises in mathematical proof as well as exercises asking
the reader to examine or run a given code listing are for the most
part omitted.

In writing these solutions, I avoid using special forms before the
point at which they are introduced in the book. This allows someone
who is reading through the book and learning Scheme for the first time
to follow my solutions without having to deal with unfamiliar
constructs.


Running
-------

Each source file can be executed using a Scheme interpreter. The
implementation that I am using is [GNU
Guile](https://www.gnu.org/software/guile/), but other implementations
should also work.

To load a scheme file in Guile one may use the `-l` option. For example,
```
guile -l "ch1/ex31.scm"
```
will run the code for Exercise 1.31. You can also load a file within
Guile using the `load` procedure:
```
(load "ch1/ex31.scm")
```
After loading a file, you can continue to execute Scheme statements at
the interactive prompt, making use of the procedures defined in the
loaded file.


Helpful Links
-------------

* [Structure and Interpretation of Computer Programs (Second Edition):
Full text](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html)
* [The SICP Web
Site](https://mitpress.mit.edu/sites/default/files/sicp/index.html)
* Some Scheme implementations:
  - [MIT/GNU Scheme](https://www.gnu.org/software/mit-scheme/)
  - [GNU Guile](https://www.gnu.org/software/guile/)
  - [Gambit](http://gambitscheme.org/)


Copyright and License
---------------------

All original code is copyright &copy; 2019 Greg Kikola.

Unless otherwise stated within the file, the code in this repository
is licensed under the [Apache License
2.0](http://www.apache.org/licenses/LICENSE-2.0). See the file
[LICENSE.txt](LICENSE.txt) for full details.
