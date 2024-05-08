clc 
clear all 
close all


abcd={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',...
      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' '}



ima=imread('C:\Users\kitsu\Documents\SVA\Mas que amor\PATRONES 4.bmp');
gray=rgb2gray(ima)
f=255-double(gray);

Sx=sum(f,2);
Sx=double(Sx>0);
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

k=1;
for i=1:n1-1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    renglon=f(fsr(i):fbr(i),:);
    
    Sy=sum(renglon);
    Sy=double(Sy>0);
    
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
    
    for j=1:length(fsl)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        letra=f(fsr(i):fbr(i),fsl(j):fbl(j));
        [fi,co]=size(letra);
        espacio=zeros(30,30);
        espacio(1:fi,1:co)=letra;
        letra=espacio
        mem(:,k)=reshape(double(letra),900,1);
%         imshow(uint8(letra))
%         drawnow
%         pause(1);
        k=k+1;
    end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
  
end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NP=52;

for i=1:NP
    W(:,i)=mem(:,i)/norm(mem(:,i));
end

ima=imread('C:\Users\kitsu\Documents\SVA\Mas que amor\MAS QUE AMOR 4.bmp');
gray=rgb2gray(ima)
f=255-double(gray);

Sx=sum(f,2);
Sx=double(Sx>0);
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
    Sy=double(Sy>0);
    
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
    k=1;
    for j=1:length(fsl)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
       if j>1 && j<length(fsl)
           esp=fsl(j)-fbl(j-1);
           if esp>10
               texto(i,k)=53;
               k=k+1;
           end
       end
       
        letra=f(fsr(i):fbr(i),fsl(j):fbl(j));
        [fi,co]=size(letra);
        espacio=zeros(30,30);
        espacio(1:fi,1:co)=letra;
        letra=espacio;
        let=reshape(double(letra),900,1);
        a=compet(W'*let(:,1)/norm(let(:,1)));
        [b,c]=max(a);
        texto(i,k)=c;
%         imshow(uint8(letra))
%         drawnow
%         abcd(c)
%         pause(1);
        k=k+1;    
    end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
   
  
end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Ceballos Conde Emanuel 4MV6')
reng='';
for i=1:size(texto,1)
 reng='';
 for j=1:size(texto,2)
    if texto(i,j)==0
        break
    end
   reng=strcat(reng,abcd(texto(i,j)));
 end
disp(char(reng))
end
disp('FIN')

