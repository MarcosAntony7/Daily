% =====================================================
% CEFET-RJ Campus Petropolis
% Faculdade de Engenharia de Computa��o
% GCOM1001PE - Introdu��o � Engenharia - 2022/1
% Prof. Rafael Saraiva Campos
% =====================================================
% Tutorial 8 - Manipula��o de arquivos - Parte B
% (fopen, fread, fclose, fseek, fwrite)
% =====================================================
clc; close all; clear;

%----------------------------------------------------
% Arquivo MNIST (manuscript digits)
% Pixels are organized row-wise. Pixel values are 0 to 255. 
%----------------------------------------------------
% [offset] [type]          [value]          [description] 
% 0000     32 bit integer  0x00000803(2051) magic number 
% 0004     32 bit integer  10000            number of images 
% 0008     32 bit integer  28               number of rows 
% 0012     32 bit integer  28               number of columns 
% 0016     unsigned byte   ??               pixel 
% 0017     unsigned byte   ??               pixel 
% ........ 
% xxxx     unsigned byte   ??               pixel
%----------------------------------------------------
% Arquivo MNIST_LABELS (r�tulos dos d�gitos)
% The labels values are 0 to 9.
%----------------------------------------------------
% [offset] [type]          [value]          [description] 
% 0000     32 bit integer  0x00000801(2049) magic number (MSB first) 
% 0004     32 bit integer  10000            number of labels (one per image)
% 0008     unsigned byte   ??               label 
% 0009     unsigned byte   ??               label 
% ........ 
% xxxx     unsigned byte   ??               label
%----------------------------------------------------

% cria os ponteiros para os dois arquivos
fid1 = fopen('MNIST.dat','r');
fid2 = fopen('MNIST_LABELS.dat','r');

% l� os primeiros 4 campos do arquivo MNIST 
header = fread(fid1,4,'int','b'); % big-endian (MSB)
N = header(2); % numero de imagens
m = header(3); % numero de linhas por imagem
n = header(4); % numero de colunas por imagem

% l� os primeiros 2 cmapos do arquivo MNIST_LABELS
header = fread(fid2,2,'int','b'); % big-endian (MSB)
M = header(2); % numero de r�tulos (um por imagem)

% pre-aloca mem�ria para a matriz que armazenar� as imagens
% matrix m x n x N (tr�s dimens�es), ou seja, h� N matrizes m x n "empilhadas"
% a terceira dimens�o corresponde ao �ndice da imagem (1 at� 20)
TEST = zeros(m,n,N);

% l� os pixels das imagens
% os primeiros (apos o cabecalho) m x n pixels comp�em a 1a imagem
% e assim sucessivamente
for i=1:N
     % a cada acesso, l� uma matriz m x n do arquivo
     % preenchendo-a coluna a coluna
     TEST(:,:,i)=fread(fid1,[m n],'uint8');
end;

% l� os r�tulos
TESTLABELS = fread(fid2,N,'uint8');

% exibe os caracteres manuscritos
for i=1:N
    subplot(5,4,i);
    imshow(TEST(:,:,i)');
end;    

% mostra r�tulos
rotulos = reshape(TESTLABELS(1:20),[4 5])'

% fecha os arquivos
fclose(fid1);
fclose(fid2);

% -------------------------------------

% agora vamos armazenar um vetor num arquivo bin�rio
V=[1.5 3.7 8.9 9.1 7.89 4.55]

% cria um ponteiro para o arquivo
% o acesso ao arquivo � do tipo escrita(w-write)
% um arquivo com o nome especificado � criado
fid = fopen('myFile.dat','w');

% grava o vetor V no arquivo especificado pelo ponteiro
% os valores s�o armazenados no format "float"
% o arquivo ocupar� ent�o 4 bytes x 6 = 24 bytes em disco
fwrite(fid,V,'float');

% fecha o arquivo
fclose(fid);

% -------------------------------------

% agora, vamos reabrir o arquivo rec�m-gerado no modo somente leitura
fid = fopen('myFile.dat','r');

% acessa diretamente o 4o byte do arquivo
fseek(fid,4,'bof');

% retorna os valores  subsequentes a essa posicao
fread(fid,2,'float')

% fecha o arquivo
fclose(fid);
