% clc 
% clear all
% close all
%  

IMA=imread('C:\Users\kitsu\Documents\SVA\imagenes\1.jpg');

R=IMA(:,:,1);
G=IMA(:,:,2);
B=IMA(:,:,3);
figure,imshow(B)
[filas,columnas,capas]=size(IMA);
U=45;
for i=1:filas
    for j=1:columnas
        if(B(i,j)<=U)
            f(i,j)=1;
        else
          f(i,j)=0;  
        end
    end
    end
figure, imshow(255*uint8(f))

% G=(B<=U);
% figure, imshow(255*uint8(G))

x=[1:columnas];
y=[1:filas];
fx=sum(f,1);
fy=sum(f,2)';
% figure, plot(fx)
% figure, plot(fy)
cy=sum(x.*fx)/sum(fx)
cx=sum(y.*fy)/sum(fy)

figure
imshow(IMA)
hold on 
plot(fix(cy),fix(cx),'B*')
hold off

