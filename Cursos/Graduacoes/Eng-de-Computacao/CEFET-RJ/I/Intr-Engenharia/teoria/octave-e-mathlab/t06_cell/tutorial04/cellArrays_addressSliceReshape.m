% =====================================================
% CEFET-RJ Campus Petropolis
% Faculdade de Engenharia de Computa��o
% GCOM1001PE - Introdu��o � Engenharia - 2022/1
% Prof. Rafael Saraiva Campos
% =====================================================
% Tutorial 4 - Cell Arrays 
% Endere�amento, fatiamento (slicing) e reshaping
% =====================================================
clc; close all; clearvars;

C = {1984,'Van Hallen','Jump',8.5,[1 2;4 5];
     2000,'Halford','Ressurrection',10.0,[3 2;1 1];
     2000,'Dio','Fever Dreams',9.0,[4 4;2 2];
     1988,'Judas Priest','Ram It Down',9.0,[0 0;2 1]};
     
disp('retorna as c�lulas da 1a linha');
disp(C(1,:));
input('pressione qualquer tecla...'); disp(' ');

disp('retorna os valores das c�lulas da 1a linha'); 
C{1,:}
input('pressione qualquer tecla...'); disp(' ');

disp('retorna as c�lulas da 2a coluna');
disp(C(:,2));
input('pressione qualquer tecla...'); disp(' ');

disp('retorna os valores das c�lulas da 2a coluna');
C{:,2}
input('pressione qualquer tecla...'); disp(' ');

disp('Por exemplo, note que C(2,1) � uma c�lula...');
disp('iscell(C(2,1))=?');
iscell(C(2,1))
input('pressione qualquer tecla...'); disp(' ');

disp('Enquanto C{2,1} retorna o valor armazenado na c�lula C(2,1)...');
C{2,1}
input('pressione qualquer tecla...'); disp(' ');

disp('Mudando o formato (num. de linhas x num. de colunas) do cell array com a fun��o reshape...');
disp(reshape(C,10,2));