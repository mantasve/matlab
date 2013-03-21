% Monte Carlo (random scearch) metodo realizacija
% 1. sugeneruojame 100 atsitiktiniu tasku .[-10;10] arba[a,b]
% 2. surandame, kuriame funkcija igyja didziausia (mziausia) reiksme
a=-10;
b=10;
x=a + (b-a).* rand(100,1);
f=sincos(x);
[fmin,indmin]=min(f);
[fmax,indmax]=max(f);
xmin=x(indmin);
xmax=x(indmax);
fprintf('surastas min=%6.4f, taske %6.4f\n',fmin,xmin);
fprintf('surastas max=%6.4f, taske %6.4f\n',fmax,xmax);
graf