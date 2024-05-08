clc 
clear all 
close all


x=905;
y=1000;
for i=1:x
    for j=1:y 
         f(i,j)=255;  

         if (((-905/370)*j)+905>=i)
          f(i,j)=0;  
         end
         
          if ((905/375)*(j-625)>=i)
          f(i,j)=0;  
          end
         
          if (i>=715) && ((905/455)*(j-135)>=i) && ((905/345)*(j-370)<=i)
          f(i,j)=0;  
          end
          
          if (i<=715) && ((905/-360)*(j-640)<=i) && ((905/345)*(j-370)<=i)
          f(i,j)=0;  
          end
    end
end

imshow(uint8(f))
