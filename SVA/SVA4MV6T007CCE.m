clc 
clear all 
close all


T=256;

%RG0
for i=1:T
    for j=1:T
       f(i,j,1)=T-i;
       f(i,j,2)=j;
       f(i,j,3)=0;
    end
end
figure
subplot(3,4,2)
imshow(uint8(f))

%R0B
for i=1:T
    for j=1:T
       f(i,j,1)=T-j;
       f(i,j,2)=0;
       f(i,j,3)=i;
    end
end
% figure
subplot(3,4,5)
imshow(uint8(f))

%0GB
for i=1:T
    for j=1:T
       f(i,j,1)=0;
       f(i,j,2)=j;
       f(i,j,3)=i;
    end
end
% figure
subplot(3,4,6)
imshow(uint8(f))

%RG255
for i=1:T
    for j=1:T
       f(i,j,1)=i;
       f(i,j,2)=j;
       f(i,j,3)=255;
    end
end
% figure
subplot(3,4,10)
imshow(uint8(f))

%R255B
for i=1:T
    for j=1:T
       f(i,j,1)=j;
       f(i,j,2)=255;
       f(i,j,3)=i;
    end
end
% figure
subplot(3,4,7)
imshow(uint8(f))

%255GB
for i=1:T
    for j=1:T
       f(i,j,1)=255;
       f(i,j,2)=255-j;
       f(i,j,3)=i;
    end
end
% figure
subplot(3,4,8)
imshow(uint8(f))
