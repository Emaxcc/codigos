clc
clear all
close all

for i=1:36;
ruta=strcat('C:\Users\kitsu\Documents\SVA\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
ima=imread(ruta);
f=rgb2gray(ima);
P(:,i)=reshape(double(f),90000,1);
end


NP=8;

for i=1:NP
    W(:,i)=P(:,i)/norm(P(:,i));
end


for i=1:36
    a=compet(W'*P(:,i)/norm(P(:,i)));
    prueba=W'*P(:,i)/norm(P(:,i));
    [b,c]=max(a)
     subplot(6,6,i), imshow(reshape(uint8(P(:,i)),300,300))
    switch(c)
        case 1
            title('Policia Malo');
        case 2
            title('Emmet');
        case 3
            title('Sr Negocios');
        case 4
            title('Lucy');
        case 5
            title('Frank');
        case 6
            title('Benny');
        case 7
            title('Skelegro');
        otherwise
            title('BATMAN');
    end
    
end