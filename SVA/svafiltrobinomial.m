clc
clear all 
% close all
%%%% Ceballos Conde Emanuel 
%%%% Sistemas de vision artificial
%%%% 4MV6 2022/1

b=[1 6 15 20 15 6 1];

ima=imread('C:\Users\kitsu\Documents\SVA\0.jpg');
f=double(rgb2gray(ima));

[filas,columnas]=size(f);

T=7;
h=(b'*b)/sum(sum(b'*b))
% h=(1/T^2)*ones(T);
%%filtro binomial
    for i=((T+1)/2):filas-((T-1)/2)
        for j=((T+1)/2):columnas-((T-1)/2)
        I=f(i-((T-1)/2):i+((T-1)/2),j-((T-1)/2):j+((T-1)/2));
        g(i-1,j-1)=sum(sum(I.*h));
        end
    end

figure,imshow(uint8(mascarasobel(g)))
title(strcat('soble suavizado binomial T=',num2str(T)))
