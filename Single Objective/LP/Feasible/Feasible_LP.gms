Variables
         x1      Decision Variable 1
         x2      Decision Variable 2
         x3      Decision Variable 3
         f       Objective Function;

Equations
         c1      Constraint 1
         c2      Constraint 2
         c3      Constraint 3
         o       Objective Function definition;

c1..     x1 + x2 + x3 =g= 0;
c2..     x1 + x2 =e= 5;
c3..     x1 - 2*x2 =g= 0;
o..      f =e= 5*x1 - x2 + x3;

Model Feasible_LP /all/;

Solve Feasible_LP using LP minimizing f;

display x1.l, x2.l, x3.l, f.l;