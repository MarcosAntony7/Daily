% =====================================================
% CEFET-RJ Campus Petropolis
% Faculdade de Engenharia de Computa��o
% GCOM1001PE - Introdu��o � Engenharia - 2022/1
% Prof. Rafael Saraiva Campos
% =====================================================
% Tutorial 1 - Vetores e Matrizes
% =====================================================

% "apaga" todas as vari�veis da mem�ria
clearvars;

% limpa a tela
clc;

% fecha todas as janelas gr�ficas
close all;

% declara dois vetores (V1 e V2)
% um vetor corresponde a uma matriz unidimensional
% ou seja, uma matriz linha ou matriz coluna
V1 = [1 2 3 4];
% o ponto e v�rgula entre os elementos indica a inser��o de uma linha
V2 = [1;0;5;9]; 

% o comando DISP exibe o conte�do na tela
disp(V1);
disp(V2);

input('pression qualquer tecla...'); disp(' ');

% o vetor V1 � uma matriz linha, isto �, ele tem apenas uma linha
% o vetor V2 � uma matriz coluna, isto �, ele tem apenas uma coluna
% para obter as dimens�es (n�mero de linhas e colunas), utilize o comando SIZE
% o comando SIZE retorna dois valores: 
% - n�mero de linhas do vetor ou matriz
% - n�mero de colunas do vetor ou matriz
disp('Dimensoes de V1'); disp(size(V1)); disp(' ');
disp('Dimensoes de V2'); disp(size(V2)); disp(' ');

input('pression qualquer tecla...'); disp(' ');

% o comando NORM retorna a norma do vetor
% a norma l1 � a soma dos elementos do vetor
% a norma l2 � o "comprimento" do vetor (raiz quadrada da soma dos 
% quadrados dos componentes do vetor)
disp('Norma l1 de V1'); disp(norm(V1,1));
disp('Norma l2 de V1'); disp(norm(V1,2));
disp(' ');
disp('Norma l1 de V2'); disp(norm(V2,1));
disp('Norma l2 de V2'); disp(norm(V2,2));
disp(' ');

input('pression qualquer tecla...'); disp(' ');

% agora declaramos uma matriz quadrada de ordem 3 (3x3)
A = [3 4 5;5 6 0; 1 2 0]

% agora declaramos uma matriz com 3 linhas e 2 colunas (3x2)
B = [3 1;3 4;9 8]

input('pression qualquer tecla...'); disp(' ');

% para que seja possivel efetuar o produto de duas matrizes
% o numero de colunas da primeira tem que ser igual ao numero de linhas da segunda
disp('A*B');
disp(A*B);

input('pression qualquer tecla...'); disp(' ');

% no produto de matrizes, realiza-se o produto escalar de cada linha 
% da primeira matriz com cada coluna da segunda matriz
% por exemplo, o produto escalar da primeira linha de A com a primeira 
% coluna de B fornece o primeiro elemento (linha 1, coluna 1) 
% do produto A*B
dot(A(1,:),B(:,1))

% para obter a matriz transposta, utilize o comando TRANSPOSE
disp('Transposta de A');
disp(transpose(A));
% ou simplesmente insira o s�mbolo ' ap�s o nome da matriz
disp(A');

input('pression qualquer tecla...'); disp(' ');

% para obter a matriz inversa, utilize o comando INV
disp('Inversa de A');
disp(inv(A));

input('pression qualquer tecla...'); disp(' ');

% para calcular o determinante de uma matriz quadrada
% utilize o comando DET
disp('Determinante de A'); disp(det(A));
input('pression qualquer tecla...'); disp(' ');

% observe que o determinante da inversa de A eh igual ao inverso do
% determinante de A
disp('det(inv(A))'); det(inv(A))
input('pression qualquer tecla...'); disp(' ');

% somente matrizes quadradas admitem uma matriz inversa
% o produto A*inv(A) retorna a matriz identidade de ordem n
% onde n � a ordem da matriz A
disp('A*inv(A)'); disp(inv(A));
% ou eleve a matriz � pot�ncia -1
disp(A^(-1));
input('pression qualquer tecla...'); disp(' ');

% a matriz identidade � uma matriz quadrada onde todos os
% elementos s�o nulos, excetuando os elementos da diagonal principal
% que s�o unit�rios; o comando EYE(N) retorna uma matriz identidade de 
% ordem "n" (ou seja, uma matriz n x n)
n=3; I=eye(n); disp(I);
input('pression qualquer tecla...'); disp(' ');

% exibe o traco da matriz A (soma dos elementos da diagonal principal)
disp('Tra�o de A'); disp(trace(A));
input('pression qualquer tecla...'); disp(' ');

% retorna os elementos da diagonal principal da matriz A
disp('Elementos da diagonal principal de A'); disp(diag(A)); 
input('pression qualquer tecla...'); disp(' ');

% note que o mesmo resultado fornecido pela fun��o TRACE(A) seria obtido 
% somando os elementos retornados pela funcao DIAG(A)
disp(sum(diag(A)));
input('pression qualquer tecla...'); disp(' ');

disp('soma dos valores de cada coluna de A');
% o segundo par�metro da fun��o SUM indica ao longo de qual dimens�o a soma
% ser� efetuada (1-linhas; 2-colunas)
disp(sum(A,1)); 
input('pression qualquer tecla...'); disp(' ');
 
disp('soma dos valores de cada linha de A');
disp(sum(A,2));
input('pression qualquer tecla...'); disp(' ');
 
disp('soma de todos os elementos de A');
disp(sum(sum(A))); 
input('pression qualquer tecla...'); disp(' ');
 
disp('matriz triangular superior obtida a partir da matriz A');
disp(triu(A) );
input('pression qualquer tecla...'); disp(' ');
 
disp('matriz triangular inferior obtida a partir da matriz A');
disp(tril(A));
input('pression qualquer tecla...'); disp(' ');

% cria uma matrix quadrada com numeros aleatorios
% o comando RAND(M,N) retorna uma matriz MxN de n�meros aleat�rios entre 0 e 1
% no exemplo fizemos n=3, ou seja, temos uma matriz quadrada de ordem 3
% qualquer valor natural n�o-nulo pode ser atribu�do a "n"
C = rand(n,n)


