clc
clear all
close all

P1=[1;1];
P2=[-1;1];
P3=[-1;-1];
P4=[1;-1];

PP=[-0.9;0.5];

P=[P1 P2 P3 P4];

[NE,NP]=size(P);

for i=1:NP
    W(:,i)=P(:,i)/norm(P(:,i));
end

PP=PP/norm(PP)

a=compet(W'*PP)

[b,c]=max(a)