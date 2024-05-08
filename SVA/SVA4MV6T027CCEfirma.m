clc 
clear all 
close all

% Ceballos Conde Emanuel

ima=imread('C:\Users\kitsu\Documents\SVA\firma\1.bmp');
figure, imshow(ima)
gris=rgb2gray(ima);
f=double(gris<127);
[filas,columnas]=size(f);
x=1:columnas;
y=1:filas;

fx=sum(f,1);
fy=sum(f,2)';
xc=sum(y.*fy)/sum(fy);
yc=sum(x.*fx)/sum(fx);

f(uint16(xc),uint16(yc))=1;

% imshow(uint8(255*f))

for i=1:filas
    for j=1:columnas
        if f(i,j)==1
            break;
        end  
    end
      if f(i,j)==1
            break;
        end 
end
mask=[3 2 1;4 0 8;5 6 7];
n=1;
while(1)
i;
j;

R(n)=sqrt((xc-i).^2+(yc-j).^2);
n=n+1;

f(i,j)=0;
v=f(i-1:i+1,j-1:j+1)
A=v.*mask;
dir=max(max(A));

switch(dir)

    case 1 
            i=i-1;
            j=j+1;
    case 2
            i=i-1;   
    case 3
            i=i-1;
            j=j-1;
    case 4 
            j=j-1;      
    case 5
            i=i+1;
            j=j-1;
    case 6
            i=i+1;        
    case 7 
            i=i+1;
            j=j+1;       
    case 8
            j=j+1;
    otherwise
        break;
          
end
imshow(uint8(255.*f))
drawnow

end
figure, plot(R)
axis([1 n 0 filas])

