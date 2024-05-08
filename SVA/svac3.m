clc
clear all 
close all

IMA1=imread('C:\Users\kitsu\Documents\SVA\pokemon\1.jpg');
IMA2=imread('C:\Users\kitsu\Documents\SVA\pokemon\2.jpg');
IMA3=imread('C:\Users\kitsu\Documents\SVA\pokemon\3.jpg');
R1=IMA1(:,:,1);
G1=IMA1(:,:,2);
B1=IMA1(:,:,3);

R2=IMA2(:,:,1);
G2=IMA2(:,:,2);
B2=IMA2(:,:,3);

R3=IMA3(:,:,1);
G3=IMA3(:,:,2);
B3=IMA3(:,:,3);
% figure, imshow(IMA)
% figure, imshow(R)
% figure, imshow(G)
% figure, imshow(B)
subplot(3,3,1)
imshow(R1)
subplot(3,3,2)
imshow(G1)
subplot(3,3,3)
imshow(B1)
subplot(3,3,4)
imshow(R2)
subplot(3,3,5)
imshow(G2)
subplot(3,3,6)
imshow(B2)
subplot(3,3,7)
imshow(R3)
subplot(3,3,8)
imshow(G3)
subplot(3,3,9)
imshow(B3)

