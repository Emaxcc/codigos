function [Ibr]=SNMG2(G,phi2)
[filas,columnas]=size(G);
dir=[0,45,90,135,-180,-135,-90,-45,180];
clear Ibr
for i=2:filas-1
    for j=2:columnas-1
        [a,dn]=min(min(abs(phi2(i,j)-dir)));
       
       switch dn
    case 1
        if (G(i,j)<G(i+1,j))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 2
        if (G(i,j)<G(i+1,j-1)) 
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 3
        if (G(i,j)<G(i,j-1)) 
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 4
        if (G(i,j)<G(i-1,j-1))
            Ibr(i,j)=0;
        else
            Ibr(i,j)=G(i,j);
        end
    case 5
    if (G(i,j)<G(i-1,j)) 
        Ibr(i,j)=0;
    else
        Ibr(i,j)=G(i,j);
    end
            case 6
    if (G(i,j)<G(i-1,j+1))
        Ibr(i,j)=0;
    else
        Ibr(i,j)=G(i,j);
        end
            case 7
    if (G(i,j)<G(i,j+1))
        Ibr(i,j)=0;
    else
        Ibr(i,j)=G(i,j);
        end
            case 8
    if (G(i,j)<G(i+1,j+1)) 
        Ibr(i,j)=0;
    else
        Ibr(i,j)=G(i,j);
        end
            case 9
    if (G(i,j)<G(i+1,j)) 
        Ibr(i,j)=0;
    else
        Ibr(i,j)=G(i,j);
    end
           otherwise
               
      end
   end
end
end