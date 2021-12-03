# peg_dimacs
[Apparently there's a format for SAT solvers called Dimacs](http://www.satcompetition.org/2009/format-benchmarks2009.html).  It's simple.  Let's parse it.

![image](https://user-images.githubusercontent.com/77482/144652453-0b28d4b6-254e-41e0-a8e7-80441dd0f99b.png)

<br/><br/>

## Sample

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
