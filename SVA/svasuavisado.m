clc
clear all 
close all
%%%% Ceballos Conde Emanuel 
%%%% Sistemas de vision artificial
%%%% 4MV6 2022/1

ima=imread('C:\Users\kitsu\Documents\SVA\0.jpg');
f=double(rgb2gray(ima));
s=mascarasobel(f);
% 
% figure, imshow(uint8(f))
% figure, imshow(uint8(s))

[filas,columnas]=size(f);

%%%%filtro promediador 
for T=3:10:35
h=(1/T^2)*ones(T);
    for i=((T+1)/2):filas-((T-1)/2)
        for j=((T+1)/2):columnas-((T-1)/2)
        I=f(i-((T-1)/2):i+((T-1)/2),j-((T-1)/2):j+((T-1)/2));
        g(i-1,j-1)=sum(sum(I.*h));
        end
    end
% figure, imshow(uint8(f))
% title('gray')
% figure, imshow(uint8(g))
% title('gray suavizado (promediador T=3) ')
% figure, imshow(uint8(mascarasobel(f)))
% title('filtro soble')
% figure, imshow(uint8(mascarasobel(g)))
% title('filtro soble suavizado (promediador T=3)')
figure,imshow(uint8(mascarasobel(g)))
title(strcat('soble suavizado promediador T=',num2str(T)))
drawnow
end