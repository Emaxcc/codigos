function [Ibr]=CCERRMASNMG(G,phi)
[filas,columnas]=size(G);
% dir=[0,45,90,135;-180,-135,-90,-45;180,-135,-90,-45];
clear Ibr
for i=2:filas-1
    for j=2:columnas-1
%         [a,dn]=min(min(abs(phi2(i,j)-dir)));

            if (phi(i,j)>=0 && phi(i,j)<45)  || (phi(i,j)>=-180 && phi(i,j)<=-135)
                dn=1;
            elseif (phi(i,j)>=45 && phi(i,j)<90)  || (phi(i,j)>-135 && phi(i,j)<=-90)
                dn=2; 
            elseif (phi(i,j)>=90 && phi(i,j)<135)  || (phi(i,j)>-90 && phi(i,j)<=-45)
                dn=3;
            elseif (phi(i,j)>=135 && phi(i,j)<=180)  || (phi(i,j)>-45 && phi(i,j)<0)
                dn=4;
            end
       
       switch dn
    case 1
        if ((G(i,j)<G(i-1,j)) || (G(i,j)<G(i+1,j)))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 2
        if ((G(i,j)<G(i+1,j-1)) || (G(i,j)<G(i-1,j+1)))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 3
        if ((G(i,j)<G(i,j-1)) || (G(i,j)<G(i,j+1)))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 4
        if ((G(i,j)<G(i-1,j-1)) || (G(i,j)<G(i+1,j+1)))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
           otherwise
               
      end
   end
end
end