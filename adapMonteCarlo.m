function [fMin2,xMin2]=adapMonteCarlo(funkcija,a1,b1)
%{
 Monte Carlo (random scearch) metodo realizacija
 1. sugeneruojame 100 atsitiktiniu tasku .[-10;10] arba[a,b]
 2. surandame, kuriame funkcija igyja didziausia (mziausia) reiksme
%a1=-10; % pradine sritis
%b1=10; % pradine sritis
paleidimas:PVZ.keisti CTRL+f visus zodzius pvs keitem sincos2--> ifunkcija
 cia progrmama copy kad pakeisti ribas a1=-10 ir b1=10;

 a1=-10;b1=10; funkcija=@sincos2; 
[fMin2,xMin2]=adapMonteCarlo(funkcija,a1,b1)

%}
m1=0;
m=0;
while (10>m)
m=m+1;
n=2; %n mates 
k1=50; % tasku vektoriu skaicius
x1=a1 + (b1-a1).* rand(k1,n);% cia generuoja vienmati vektoriu
f1=[];
for i=1:k1 % kad perduotu aiskai i sincos2 visus stulpelius
f1(i)=booth(x1(i,:)); % kreipimasis" funkcija" "greit pakeisti ctrl+f "turi buti 
end
[fMin1,indMin1]=min(f1);
[fMax1,indMax1]=max(f1);
xMin1=x1(indMin1,:);
%xMax1=x1(indMax1,:);
%fprintf('surastas min1=%6.4f, taske x1=(%6.4f,%6.4f)\n',fMin1,xMin1(1),xMin1(2)); % isves tik 1 ats
%fprintf('surastas max1=%6.4f, taske x=(%6.4f,%6.4f)\n',fMax1,xMax1(1),xMax1(2));

hold on; %stabdo
scatter(x1(:,1),x1(:,2),'b.') % pavaizduoja k1 bandymo tasku
scatter(xMin1(1),xMin1(2),'r*') %pavaizduoja xMin po k1 bandimo tasku
text(xMin1(1)+0.3,xMin1(2),num2str(fMin1));
rectangle('position',[-10.0,-10.0,20.0,20.0],...
    'linewidth',5,'linestyle','--') % pradine leistinoji sritis

% kiti bandymai atliekami sumazintoje srityje ( cia aplink jau taska kuri
% isrinkom turbut)

%{ 
cia paima visa programa
%}
a2=xMin1(1)-2; % pradine sritis
b2=xMin1(1)+2; % pradine sritis
a3=xMin1(2)-2;
b3=xMin1(2)+2;

if (a2<-10)
    b2=-6; %pastume
    a2=-10;
    
end 

if (b2>10) % nesutvarkytas ir nereike, sutvarkytas
    a2=6;
    b2=10;
end

if  (b3>10)
    a3=6;
    b3=10;
    
end

if(a3<-10)
    b3=a3+4-(a3+10); % formule kiek pakele logiska kad -6
a3=-10;
end;
    
%n=2; %n mates 
k2=50; % tasku vektoriu skaicius
x2(:,1)=a2 + (b2-a2).* rand(k2,1);% cia generuoja vienmati vektoriu
x2(:,2)=a3 + (b3-a3).* rand(k2,1);% n=1

f2=[];
for i=1:k2 % kad perduotu aiskai i funkcija visus stulpelius
    f2(i)=booth(x2(i,:)); % kreipimasis
end
[fMin2,indMin2]=min(f2);
[fMax2,indMax2]=max(f2);
xMin2=x2(indMin2,:);
%xMax2=x2(indMax2,:);
fprintf('surastas min2=%6.4f, taske x2=(%6.4f,%6.4f)\n',fMin2,xMin2(1),xMin2(2)); % isves tik 1 ats
%fprintf('surastas max2=%6.4f, taske x=(%6.4f,%6.4f)\n',fMax2,xMax2(1),xMax2(2));
 
scatter(x2(:,1),x2(:,2),'y.') % pavaizduoja k1 bandymo tasku
scatter(xMin2(1),xMin2(2),'g*') %pavaizduoja xMin po k1 bandimo tasku
%text(xMin1(1)+0.3,xMin1(2),num2str(fmin1));
rectangle('position',[a2,a3,4.0,4.0],...
    'linewidth',5,'linestyle','--') % pradine leistinoji sritis
%if []
m1=fMin2+m1
end
vid=m1/m

%graf2