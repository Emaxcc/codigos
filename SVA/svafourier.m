clc
clear all
close all
% % % % vision con fourier es de las mas poderosas pore nadie la usa por ser
% % % dificil
ima=imread('C:\Users\kitsu\Documents\SVA\pokemon\1.jpg');

f=double(rgb2gray(ima));
[filas,columnas]=size(f);
for i=1:filas
    for j=1:columnas
        f(i,j)=((-1)^(i+j))*f(i,j);
    end
end
F=fft2(f);
% mesh(abs(F))
for R=0:50
for i=1:filas
    for j=1:columnas
        if (i-filas/2)^2+(j-columnas/2)^2>R^2
            filtro(i,j)=1;
        else
            filtro(i,j)=0;
        end
    end
end
filtrada=filtro.*F;
fr=abs(real(ifft2(filtrada)));
imshow(uint8(fr))
title(num2str(R))
drawnow
end

%transformada de fourier con pasa bajas detecta el cambio de color 
%transformada do fourier con pasa altas deteccióñ de bondes 
