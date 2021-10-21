Variables
         x1      Decision Variable 1
         x2      Decision Variable 2
         x3      Decision Variable 3
         f       Objective Function;
         
Integer Variable
         x3      Decision Variable 3;
         
Nonnegative Variables
         x1      Decision Variable 1
         x2      Decision Variable 2;

Equations
         c1      Constraint 1
         c2      Constraint 2
         c3      Constraint 3
         c4      Constraint 4
         c5      Constraint 5
         o       Objective Function definition;

c1..     x1 + x2 + x3 =g= 0;
c2..     x1 + x2 =e= 5;
c3..     x1 - 2*x2 =g= 0;
c4..     x2 + x3 =e= -10;
c5..     x3 + x1 =e= 1;
o..      f =e= 5*x1 - x2 + x3;

* Bounding Decision Variables
x3.l = -10;
x3.up = 10;

Model InFeasible_MILP /all/;

Solve InFeasible_MILP using MIP minimizing f;

display x1.l, x2.l, x3.l, f.l;