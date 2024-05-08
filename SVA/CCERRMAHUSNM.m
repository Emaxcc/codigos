function [IHBOR]=CCERRMAHUSNM(Ibr,t1,t2)
[filas,columnas]=size(Ibr);
for i=1:filas
    for j=1:columnas
        
        
        if(Ibr(i,j)<t1)
            
              IHBOR(i,j)=0;
        elseif (Ibr(i,j)>t2)
                
              IHBOR(i,j)=Ibr(i,j);
        
        elseif any((Ibr(i-1,j-1:j+1)<t2)) || any((Ibr(i+1, j-1:j+1))<t2) || any((Ibr(i, [j-1, j+1]) < t2))
              IHBOR(i,j)=Ibr(i,j);
              
           
        end

   end
end
end