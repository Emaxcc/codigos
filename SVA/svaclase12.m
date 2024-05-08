clc
clear all
close all

filas=600;
columnas=600;
% w1=0.1;
for w1=0:0.01:1
for i=1:filas
    for j=1:columnas
        f(i,j)=((-1)^(i+j))*(1*sin(w1*i)+1*sin(w1*j))/2;
    end
end
F=fft2(f);
mesh(abs(F))
% mesh(uint8(127.5*f+125.5))
% imshow(uint8(127.5*f+125.5))
title(num2str(w1))
drawnow
end