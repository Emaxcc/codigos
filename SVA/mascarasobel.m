function R=mascarasobel(f)
Sx=[-1 0 1;-2 0 2;-1 0 1];
Sy=[-1 -2 -1;0 0 0;1 2 1];

[filas,columnas]=size(f);

    for i=2:filas-1
        for j=2:columnas-1
            S=f(i-1:i+1,j-1:j+1);
            R(i-1,j-1)=sqrt(sum(sum(S.*Sx))^2+sum(sum(S.*Sy))^2);
        end
    end
end