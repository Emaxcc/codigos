clc 
clear all 
close all


T=256;

for i=1:T
    for j=1:T
       f(i,j,1)=i;
       f(i,j,2)=
       f(i,j,3)=i;
    end
end
%mesh(f)
figure
imshow(uint8(f))






% t=0:1:255;
% for w=0:0.001:0.1;
% xt=sin(w*t);
% plot(t,xt);
% drawnow
% end