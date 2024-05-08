%CEBALLOS CONDE EMANUEL SISTEMAS DE VISION ARTIFICIAL 4MV6 2022/1
clc
clear all
close all
for i=1:1
ruta='C:\Users\kitsu\Documents\SVA\P03\imagenes mem\';
direccion=strcat(ruta,num2str(i),'.png');
ima=imread(direccion);
gris=rgb2gray(ima);
f=double(gris>125);
% subplot(5,5,i),
imshow(uint8(255*f))

m00=MOMENTOINICIAL(f,0,0);
m01=MOMENTOINICIAL(f,0,1);
m10=MOMENTOINICIAL(f,1,0);

xc=m10/m00;
yc=m01/m00;

u00=MOMENTOCENTRAL(f,0,0,xc,yc);
u20=MOMENTOCENTRAL(f,2,0,xc,yc);
u02=MOMENTOCENTRAL(f,0,2,xc,yc);
u11=MOMENTOCENTRAL(f,1,1,xc,yc);
u12=MOMENTOCENTRAL(f,1,2,xc,yc);
u21=MOMENTOCENTRAL(f,2,1,xc,yc);
u30=MOMENTOCENTRAL(f,3,0,xc,yc);
u03=MOMENTOCENTRAL(f,0,3,xc,yc);

n20=MOMENTONORMALIZADO(u20,u00,2,0);
n02=MOMENTONORMALIZADO(u02,u00,0,2);
n11=MOMENTONORMALIZADO(u11,u00,1,1);
n12=MOMENTONORMALIZADO(u12,u00,1,2);
n21=MOMENTONORMALIZADO(u21,u00,2,1);
n30=MOMENTONORMALIZADO(u30,u00,3,0);
n03=MOMENTONORMALIZADO(u03,u00,0,3);

phi1=n20+n02;
phi2=(n20-n02)^2+4*n11^2;
phi3=(n30-3*n12)^2+(3*n21-n03)^2;
Phi(i,:)=[phi1,phi2,phi3];
title(strcat('phi1=',num2str(phi1),',',' phi2=',num2str(phi2),',',' phi3=',num2str(phi3)));
end
% Phi=array2table(Phi)