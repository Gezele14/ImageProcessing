function Y = bilineal(A)
  #A es la matriz a la cual de le hara limpieza   
  [m,n,r] = size(A);
  A = im2double(A);
  Y = A;  
  for x=1:m
    for y=1:n
     if or((A(x,y,1) == 0), (A(x,y,2) == 0), (A(x,y,3) == 0))
       if and(x==1, y==1)% esquina superior izquierda
        newpixel = (A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:))/3;
       elseif and(x==m,y==1)% esquina superior derecha
        newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/3;
       elseif and(x==1,y==n)% esquina inferior izquierda
        newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/3;
       elseif and(x==m,y==n)% esquina inferior derecha
        newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:))/3;
       elseif and(x>1,y>1,x<m,y<n) % Caso central
        newpixel = ((1/(((x+1)-(x-1))*((y+1)-(y-1))))*((A(x-1,y-1,:)*((x+1)-x)*((y+1)-y))+(A(x+1,y-1,:)*(x-(x-1))*((y+1)-y))+(A(x-1,y+1,:)*((x+1)-x)*(y-(y-1)))+(A(x+1,y+1,:)*(x-(x-1))*(y-(y-1)))));
       elseif y==1 %borde arriba
        newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:)+A(x+1,y+1,:)+A(x+1,y,:))/5;
       elseif x==1 %borde izquierdo
        newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:))/5;
       elseif x==m %borde derecho
        newpixel = (A(x,y-1,:)+A(x-1,y-1,:)+A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/5;
       elseif y==n %borde abajo
        newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/5;
       endif
       Y(x,y,:) = newpixel(1,1,:); % Se asigna el nuevo valor
     else
       continue
     endif       
    endfor
  endfor  
endfunction