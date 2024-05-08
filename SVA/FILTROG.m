function h=FILTROG(T,sig)
%%%% Ceballos Conde Emanuel 
%%%% Sistemas de vision artificial
%%%% 4MV6 2022/1

for i=1:T
    for j=1:T
        h(i,j)=exp(-((i-T/2-1/2)^2+(j-T/2-1/2)^2)/(2*(sig^2)));
    end
end
h=h/sum(sum(h));
end