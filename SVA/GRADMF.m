function [G,phi2]=GRADMF(J)
[filas,columnas]=size(J);
for i=2:filas-1
    for j=2:columnas-1
        Gx(i-1,j-1)=(J(i+1,j)-J(i-1,j))/2;
        Gy(i-1,j-1)=(J(i,j+1)-J(i,j-1))/2;
        G(i-1,j-1)=sqrt(Gx(i-1,j-1)^2+Gy(i-1,j-1)^2);
        phi1(i-1,j-1)=atand(Gy(i-1,j-1)/Gx(i-1,j-1));
        phi2(i-1,j-1)=atan2d(Gy(i-1,j-1),Gx(i-1,j-1));
    end
end
end