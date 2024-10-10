% =====================================================
% CEFET-RJ Campus Petropolis
% Faculdade de Engenharia de Computa��o
% GCOM1001PE - Introdu��o � Engenharia - 2022/1
% Prof. Rafael Saraiva Campos
% =====================================================
% Tutorial 10 - N�meros Complexos
% =====================================================
% real(z) - retorna a parte real
% imag(z) - retorna a parte imagin�ria
% abs(z) - retorna o m�dulo
% angle(z) - retorna o argumento(fase) em radianos
% cart2pol(a,b) - converte da forma cartesiana (z=a+i*b) para a polar (|z| e fase)
% pol2cart(fase,|z|) - converte da forma polar para a cartesiana
% =====================================================
clearvars; clc; close all;

% recebe parte real do numero complexo
a = input('Parte Real:');

% recebe parte imaginaria do numero complexo
b = input('Parte Imaginaria:');

% numero complexo na forma cartesiana
z = a + b*i;

% m�dulo do n�mero complexo
modulo = abs(z);

% argumento (fase) do n�mero complexo em radianos
theta = angle(z);

disp('---');
disp(strcat('Modulo: ',num2str(modulo)));
disp(strcat('Argumento(rad): ',num2str(theta)));
disp('---');

% o mesmo resultado seria obtido utilizando a funcao CART2POL
% que converte da forma cartesiana para a polar
disp(cart2pol(real(z),imag(z)));
disp('---');

% n�mero de ra�zes
n = floor(input('Ordem da radiciacao:'));
moduloRaiz = modulo^(1/n);
for i=1:n
    thetaRaiz(i) = theta/n + 2*(i-1)*pi()/n;
end;

disp('---');
disp(strcat('Modulo das raizes: ',num2str(moduloRaiz)));
disp(strcat('Argumentos das ra�zes(graus):'));
disp(rad2deg(thetaRaiz));
disp('---');

% plota os afixos (representacao no plano complexo) das ra�zes de z
ang=0:pi/50:2*pi; 
xp=moduloRaiz*cos(ang);
yp=moduloRaiz*sin(ang);
plot(xp,yp,'Color','k');

xlim([-2*moduloRaiz 2*moduloRaiz]);
ylim([-2*moduloRaiz 2*moduloRaiz]);
pbaspect([1 1 1]); grid on; hold on;

xcoord = moduloRaiz*cos(thetaRaiz);
ycoord = moduloRaiz*sin(thetaRaiz);
scatter(xcoord,ycoord,'k','fill');

for i=1:n-1
 line([xcoord(i) xcoord(i+1)],[ycoord(i) ycoord(i+1)]);
end;
 line([xcoord(n) xcoord(1)],[ycoord(n) ycoord(1)]);

    

