# peg_dimacs
[There's a simple format for SAT solvers called Dimacs](http://www.satcompetition.org/2009/format-benchmarks2009.html).

This is a parser for that format.


<br/><br/>

## Format Sample

This is what the DIMACS format looks like:

```dimacs
c
c start with comments
c
c
p cnf 5 3
1 -5 4 0
-1 5 3 4 0
-3 -4 0
```



<br/><br/>

## Let's parse it

This library works in any Javascript environment which can parse strings.  The library is
provided as ES Module, as well as CommonJS.

Here's an example of using it in node.

```
$ node

Welcome to Node.js v17.2.0.
Type ".help" for more information.

> const data = `c
... c start with comments
... c
... c
... p cnf 5 3
... 1 -5 4 0
... -1 5 3 4 0
... -3 -4 0`;
undefined

> const dimacs = require('.');
undefined

> dimacs.parse(data);
{
  format: 'cnf',
  comment: '\nstart with comments\n\n',
  var_count: 5,
  clause_count: 5,
  claims: [ [ 1, -5, 4, 0 ], [ -1, 5, 3, 4, 0 ], [ -3, -4, 0 ] ]
}

>
```

If you'd like to use this library in the browser, you can use the ES Module version, or
otherwise, please bundle with a tool like [rollup](https://rollupjs.org/),
[webpack](https://webpack.js.org/), or [rome](https://rome.tools/).