function B = limpiar(A)
  #A es la matriz a la cual de le hara limpieza
  [m,n,r] = size(A);
  A = im2double(A);
  B = A;
  for x=1:m
    for y=1:n
     if or((A(x,y,1) == 0), (A(x,y,2) == 0), (A(x,y,3) == 0))
       if and(x==1, y==1)
        newpixel = (A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:))/3;
       elseif and(x==m,y==1)
         newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/3;
       elseif and(x==1,y==n)
         newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/3;
       elseif and(x==m,y==n)
         newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:))/3;
       elseif and(x>1,y>1,x<m,y<n)
         newpixel = (A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:)+A(x-1,y+1,:)+A(x-1,y,:))/8;
       elseif y==1
         newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:)+A(x+1,y+1,:)+A(x+1,y,:))/5;
       elseif x==1
         newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:))/5;
       elseif x==m
         newpixel = (A(x,y-1,:)+A(x-1,y-1,:)+A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/5;
       elseif y==n
         newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/5;
       endif
       B(x,y,:) = newpixel(1,1,:);
     else
       continue
     endif
       
    endfor
  endfor
  
endfunction