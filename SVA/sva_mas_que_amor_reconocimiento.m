clc 
clear all 
close all

ima=imread('C:\Users\kitsu\Documents\SVA\Mas que amor\MAS QUE AMOR 4.bmp');
f=255-double(ima(:,:,1));

Sx=sum(f,2);
Sx=double(Sx>0)
n1=1;
n2=1;
for i=2:length(Sx)
    if Sx(i-1)==0 && Sx(i)==1
        fsr(n1)=i;
        n1=n1+1;
    end
    
    if Sx(i-1)==1 && Sx(i)==0
        fbr(n2)=i;
        n2=n2+1;
    end
end

[fsr',fbr']


for i=1:n1-1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    renglon=f(fsr(i):fbr(i),:);
    
    Sy=sum(renglon);
    Sy=double(Sy>0)
    
    n3=1;
    n4=1;
    clear fsl fbl
        for j=2:length(Sy)
            if Sy(j-1)==0 && Sy(j)==1
                fsl(n3)=j;
                n3=n3+1;
            end

            if Sy(j-1)==1 && Sy(j)==0
                fbl(n4)=j;
                n4=n4+1;
            end
        end
    
    for j=1:length(fsl);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        letra=f(fsr(i):fbr(i),fsl(j):fbl(j))
        [fi,co]=size(letra);
        espacio=zeros(30,30);
        espacio(1:fi,1:co)=letra;
        letra=espacio;
        imshow(uint8(letra))
        drawnow
    end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
  
end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        
        
%         plot(sx)
% 
% imshow(uint8(f))