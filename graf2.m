%x=[-10:0.2:10]; % padaryti kad breztu 2mati f-ja.:surf, mesh komandos
% nuo -10 iki 10 kinta 0.2
%plot(x,sincos2(x));% tures buti:surf, mesh komandos

[x,y] =meshgrid(-10:0.2:10);
f=sin(x)+cos(y);
surf(x,y,f)