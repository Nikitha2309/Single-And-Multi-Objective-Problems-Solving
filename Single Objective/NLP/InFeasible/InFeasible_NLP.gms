Variables
         x1      Decision Variable 1
         x2      Decision Variable 2
         x3      Decision Variable 3
         f       Objective Function;

Equations
         c1      Constraint 1
         c2      Constraint 2
         c3      Constraint 3
         c4      Constraint 4
         o       Objective Function definition;

c1..     x1 + x2 -x3 =g= 0;
c2..     x1 + x2 =e= 5;
c3..     x1 - 2*x2 =g= 0;
c4..     x1*x2 =l= 0;
o..      f =e= sqr(x1) - 2/x2 + exp(x3);

* Bounding x2, To avoid Zero Division Error in GAMS
x2.l = 1;

Model InFeasible_NLP /all/;

Solve InFeasible_NLP using NLP maximizing f;

display x1.l, x2.l, x3.l, f.l;