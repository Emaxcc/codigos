clc 
clear all 
close all

% Ceballos Conde Emanuel

ima1=imread('C:\Users\kitsu\Documents\SVA\grad\0.png');
ima=imcrop(ima1);

R=ima(:,:,1);
G=ima(:,:,2);
B=ima(:,:,3);

[filas,columnas]=size(R);

HGR=zeros(1,256);
HGG=zeros(1,256);
HGB=zeros(1,256);

for i=1:filas
    for j=1:columnas
     HGR(1,(R(i,j)+1))=HGR(1,(R(i,j)+1))+1;
     HGG(1,(G(i,j)+1))=HGG(1,(G(i,j)+1))+1;
     HGB(1,(B(i,j)+1))=HGB(1,(B(i,j)+1))+1; 
    end
end


%promedio
pr=fix(mean2(R))
pg=fix(mean2(G))
pb=fix(mean2(B))

%centroide 
cr=fix(sum((0:255).*HGR)/sum(HGR))
cg=fix(sum((0:255).*HGG)/sum(HGG))
cb=fix(sum((0:255).*HGB)/sum(HGB))

figure
imshow(ima)
title('área seleccionada')


figure
hold on;
plot([0:255],HGR,'r')
plot([0:255],HGG,'g')
plot([0:255],HGB,'b')
title('Histograma')
hold off;


imaprom=zeros(filas,columnas,3);

imaprom(:,:,1)=pr;
imaprom(:,:,2)=pg;
imaprom(:,:,3)=pb;

imacent=zeros(filas,columnas,3);
imacent(:,:,1)=cr;
imacent(:,:,2)=cg;
imacent(:,:,3)=cb;

figure
subplot(1,2,1)
imshow(uint8(imaprom))
title('color obtenido por promedios')

subplot(1,2,2)
imshow(uint8(imacent))
title('color obtenido por centroides del histograma')
