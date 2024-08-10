% =====================================================
% CEFET-RJ Campus Petropolis
% Faculdade de Engenharia de Computa��o
% GCOM1001PE - Introdu��o � Engenharia - 2022/1
% Prof. Rafael Saraiva Campos
% =====================================================
% Tutorial 9 - PDI (Processamento Digital de Imagens)
% =====================================================
clc; close all; clear;

pkg load image;

% carrega imagem original
RGB = imread('img1.bmp');

% converte de RGB para n�veis de cinza
BW = rgb2gray(RGB);

% aplica filtro de mediana
Filtered = medfilt2(BW,[5 5]);

% converte em imagem bin�ria utilizando m�todo de Otsu para identifica��o
% de limiar de thresholding

nlin = size(Filtered,1);
ncol = size(Filtered,2);
Binary = zeros(nlin,ncol);
LIMIAR = 100;

for i=1:nlin
  for j=1:ncol
    if(Filtered(i,j)>LIMIAR)
      Binary(i,j)=1;
    end;
  end;
end;

% preenche buracos em uma imagem bin�ria - um buraco em uma imagem
% � um conjunto de pixels n�o conectado  a pixels de "background"
% na borda da imagem.
Filled = imfill(Binary,'holes');

subplot(2,4,1); imshow(RGB); title('(a) RGB Original');
subplot(2,4,2); imshow(BW); title('(b) Escala de cinza');
subplot(2,4,3); imshow(Filtered); title('(c) Ap�s aplicar filtro de mediana');
subplot(2,4,4); imshow(Binary); title('(d) Imagem bin�ria');
subplot(2,4,5); imshow(Filled); title('(e) Ap�s preenchimento');

% rotula os objetos na imagem
Labeled = bwlabel(Filled);

% retorna propriedades morfologicas dos objetos da imagem
STATS = regionprops(Labeled,'all');

% n�mero de objetos na imagem
N = unique(length(STATS));

% centr�ides dos objetos
centroids = cat(1, STATS.Centroid);

% exibe os r�tulos junto aos objetos
subplot(2,4,6); imshow(Filled); hold on;
for i=1:N
    text(centroids(i,1), centroids(i,2) , int2str(i),'Color','r');
end;
title('(f) Objetos rotulados');

% calcula e exibe a m�trica de curvatura
subplot(2,4,7); imshow(Filled); hold on; k=0;
for i=1:N
    metric = 4*pi*STATS(i).Area/STATS(i).Perimeter/100;
    text(centroids(i,1), centroids(i,2) , num2str(metric),'Color','r');
    disp(abs(metric-1));
    if(abs(metric-1)<=.15)
        k=k+1;
        idx(k)=i;
    end;
end;
title('(g) M�trica de curvatura');

% marca os objetos aproximadamente circulares
subplot(2,4,8); imshow(Filled); hold on;
for i=1:length(idx)
    scatter(centroids(idx(i),1),centroids(idx(i),2),'Marker','o','MarkerFaceColor','r');
end;
title('(h) Objetos quase circulares identificados');


