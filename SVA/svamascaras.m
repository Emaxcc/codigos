clc 
clear all 
close all

% Ceballos Conde Emanuel

ima=imread('C:\Users\kitsu\Documents\SVA\0.jpg');
figure, imshow(ima)
r=ima(:,:,1);
g=ima(:,:,2);
b=ima(:,:,3);
f=double(rgb2gray(ima));
% f=rgb2gray(ima);
% 
% figure, imshow(r)
% figure, imshow(g)
% figure, imshow(b)
% figure, imshow(f)

[filas,columnas]=size(f);
di=1;
dj=1;
msx=[-1 -2 -1;0 0 0;1 2 1];
msy=[-1 0 1;-2 0 2;-1 0 1];
mpx=[-1 -1 -1;0 0 0;1 1 1];
mpy=[-1 0 1;-1 0 1;-1 0 1];
for j=2:columnas-1
    for i=2:filas-1
       
       gx(i,j)=(f(i+di,j)-f(i-di,j))/(2*di);
       gy(i,j)=(f(i,j+dj)-f(i,j-dj))/(2*dj);
       G(i,j)=sqrt( gx(i,j)^2 + gy(i,j)^2);
        
       sx(i-1,j-1)=1*sum(sum(f(i-1:i+1,j-1:j+1).*msx));
       sy(i-1,j-1)=1*sum(sum(f(i-1:i+1,j-1:j+1).*msy));
       S(i-1,j-1)=sqrt( sx(i-1,j-1)^2 + sy(i-1,j-1)^2);
      
       px(i-1,j-1)=1*sum(sum(f(i-1:i+1,j-1:j+1).*mpx));
       py(i-1,j-1)=1*sum(sum(f(i-1:i+1,j-1:j+1).*mpy));
       P(i-1,j-1)=sqrt( px(i-1,j-1)^2 + py(i-1,j-1)^2);
    end
end


figure, imshow(uint8(abs(gx)));
title('Gradiente x')
figure, imshow(uint8(abs(gy)));
title('Gradiente y')
figure, imshow(uint8(G));
title('Gradiente general')
figure, mesh(G)
title('Grafica 3D (mesh) de Gradiente general')



figure, imshow(uint8(abs(sx)))
title('Sobel x')
figure, imshow(uint8(abs(sy)))
title('Sobel y')
figure, imshow(uint8(S))
title('Sobel general')
figure, mesh(S)
title('Grafica 3D (mesh) de sobel general')

figure, imshow(uint8(abs(px)))
title('Prewitt x')
figure, imshow(uint8(abs(py)))
title('Prewitt y')
figure, imshow(uint8(P))
title('Prewitt general')
figure, mesh(P)
title('Grafica 3D (mesh) de Prewitt general')