clc
clear all 
close all

imal=imread('C:\Users\kitsu\Documents\SVA\vision estereo\ii.png');
imar=imread('C:\Users\kitsu\Documents\SVA\vision estereo\id.png');
[fil,col]=size(imal);
imal(:,col/2)=zeros(fil,1);
imal(fil/2,:)=zeros(1,col);
imar(:,col/2)=zeros(fil,1);
imar(fil/2,:)=zeros(1,col);
[xl,yl,pl]=impixel(imal);
xl=xl-col/2
yl=fil/2-yl

[xr,yr,pl]=impixel(imar);
xr=xr-col/2
yr=fil/2-yr
% 
f=57*(xl-xr)/20
% f=193;
% f=1064.2;
% z=f*20/(xl-xr)
% figure,imshow(imal)
% figure,imshow(imar)