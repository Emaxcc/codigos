clc
clear all 
close all

ima=imread('E:\scheems.jpg');
HSV=rgb2hsv(ima);

H=uint8(255*double(HSV(:,:,1)));
S=uint8(255*(1-double(HSV(:,:,2))));
V=uint8(255*double(HSV(:,:,3)));

figure,imshow(ima)

figure,imshow(H)

figure,imshow(S)

figure,imshow(V)



HC=zeros(size(ima));

for i=1:size(H,1)  
for j=1:size(H,2)
    
    if (H(i,j)<=21) || (H(i,j)>=233)
    HC(i,j,1)=255; 
    HC(i,j,2)=0;
    HC(i,j,3)=0;
    end  
    
    if (((H(i,j)<=85) && H(i,j)>=43))
    HC(i,j,1)=255; 
    HC(i,j,2)=255;
    HC(i,j,3)=0;    
    end
    
    if (((H(i,j)<=127) && H(i,j)>=86))
    HC(i,j,1)=0; 
    HC(i,j,2)=255;
    HC(i,j,3)=0;    
    end
    
     if (((H(i,j)<=170) && H(i,j)>=128))
    HC(i,j,1)=0; 
    HC(i,j,2)=255;
    HC(i,j,3)=255;    
     end
    
   if (((H(i,j)<=212) && H(i,j)>=171))
    HC(i,j,1)=0; 
    HC(i,j,2)=0;
    HC(i,j,3)=255;    
    end
    
     if (((H(i,j)<=232) && H(i,j)>=213))
    HC(i,j,1)=255; 
    HC(i,j,2)=0;
    HC(i,j,3)=255;    
    end
    
end
end

figure,imshow(HC)
