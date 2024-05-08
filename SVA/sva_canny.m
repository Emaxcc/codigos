clc
clear all
close all


IMA=imread('C:\Users\kitsu\Documents\SVA\canny1\1.jpg');
I=double(rgb2gray(IMA));
% imshow(uint8(I))

h=FILTROG(3,2);
J=APLICAFILTRO(I,h);

[G,phi2]=GRADMF(J);
Ibr=CCERRMASNMG(G,phi2);





figure,imshow(uint8(I))
figure,imshow(uint8(10*G))%%amplificion del borde para mayor visualizacion
title('bordes gradiente con amplificación = 3')
figure, mesh(phi2)

figure,imshow(uint8(10*Ibr))%%amplificion del borde para mayor visualizacion
title('bordes gradiente con supreción y amplificación = 3')

% IHBOR=CCERRMAHUSNM(Ibr,10,60);
% figure,imshow(uint8(3*IHBOR))
% title('bordes gradiente con histeresis de suprecion y amplificación = 3')



