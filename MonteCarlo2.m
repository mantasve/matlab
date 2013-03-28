% Monte Carlo (random scearch) metodo realizacija
% 1. sugeneruojame 100 atsitiktiniu tasku .[-10;10] arba[a,b]
% 2. surandame, kuriame funkcija igyja didziausia (mziausia) reiksme
a=-10;
b=10;
n=2; %n mates 
k=100; % tasku vektoriu skaicius
x=a + (b-a).* rand(k,n);% cia generuoja vienmati vektoriu
for i=1:k % kad perduotu aiskai i sincos2 visus stulpelius
f(i)=sincos2(x(i,:)); % kreipimasis
end
[fmin,indmin]=min(f);
[fmax,indmax]=max(f);
xmin=x(indmin,:);
xmax=x(indmax,:);
fprintf('surastas min=%6.4f, taske x=(%6.4f,%6.4f)\n',fmin,xmin(1),xmin(2)); % isves tik 1 ats
fprintf('surastas max=%6.4f, taske x=(%6.4f,%6.4f)\n',fmax,xmax(1),xmax(2));
graf2