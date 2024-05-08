clc 
clear all 
close all

% Ceballos Conde Emanuel

ima=imread('C:\Users\kitsu\Documents\SVA\grad\0.jpg');

% imshow(ima)

f=double(ima(:,:,1));
[filas,columnas]=size(f);
dx=1;
dy=1;
for y=2:columnas-1
    for x=2:filas-1
        gx(x,y)=(f(x+dx,y)-f(x-dx,y))/(2*dx);
        gy(x,y)=(f(x,y+dy)-f(x,y-dy))/(2*dy);
        G(x,y)=sqrt( gx(x,y)^2 + gy(x,y)^2);
        
    end
end
figure, mesh(gx)
figure, imshow(uint8(abs(gx)));
figure, imshow(uint8(abs(gy)));
figure, imshow(uint8(G));