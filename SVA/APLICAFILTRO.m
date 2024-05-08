function J=APLICAFILTRO(I,h)
[filas,columnas]=size(I);
[T,a]=size(h);
for i=(T+1)/2:filas-(T-1)/2
    for j=(T+1)/2:columnas-(T-1)/2
        J(i-(T-1)/2,j-(T-1)/2)=sum(sum(h.*I(i-(T-1)/2:i+(T-1)/2,j-(T-1)/2:j+(T-1)/2)));
    end
end
end