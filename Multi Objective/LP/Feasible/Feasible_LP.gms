Variables
         x1      Decision Variable 1
         x2      Decision Variable 2
         x3      Decision Variable 3
         f1      Objective Function 1
         f2      Objective Function 2;

Equations
         c1      Constraint 1
         c2      Constraint 2
         c3      Constraint 3
         o1      Objective Function 1 definition
         o2      Objective Function 2 definition;

c1..     x1 + x2 + x3 =g= 0;
c2..     x1 + x2 =e= 5;
c3..     x1 - 2*x2 =g= 0;
o1..     f1 =e= 5*x1 - x2 + x3;
o2..     f2 =e= 10 - 2*x3;

Model Feasible_LP /all/;

Set counter / count1*count2 /;

Scalar E;

Parameter report(counter,*), ranges(*);

solve Feasible_LP using LP minimizing f1;
ranges('F1max') = f1.l;
ranges('F2min') = f2.l;

solve Feasible_LP using LP maximizing f2;
ranges('F2max') = f2.l;
ranges('F1min') = f1.l;


loop(counter,
   E = (ranges('F2max') - ranges('F2min'))*(ord(counter) - 1)/(card(counter) - 1) + ranges('F2min');
   f2.lo = E;
   solve Feasible_LP using LP minimizing f1;
   report(counter,'F1') = f1.l;
   report(counter,'F2') = f2.l;
   report(counter,'E')   = E;
);

display report;