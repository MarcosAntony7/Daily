clearvars; clc;

% Quest�o 1
mensagem = 'eu_estudo_calculo_02';
n = length(mensagem);
A = n*eye(n);
S = trace(A)

% Quest�o 2
f=@(a,b)(sqrt(a^2+b^2)-5);
x=mod(1008,5);
y=floor(13/3);
F=f(x,y)

% Quest�o 3
SOMA = -5;
for i=1:2:10
  SOMA = SOMA + mod(i,2);
endfor
SOMA

% Quest�o 4
B = [1 2 0;4 5 6;7 8 9];
C = sum(sum(triu(B)))-trace(B)

% Quest�o 5
z1=3+2*j;
z2=4+3*j;
Z = imag(z1)*abs(z2)


