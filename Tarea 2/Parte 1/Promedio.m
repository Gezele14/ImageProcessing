function B = Promedio(A)
  #A es la matriz a la cual de le hara limpieza
  [m,n,r] = size(A);
  A = im2double(A);
  B = A;
  for x=1:m
    for y=1:n
       if and(x==1, y==1)% esquina superior izquierda
        newpixel = (A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:))/3;
       elseif and(x==m,y==1)% esquina superior derecha
         newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/3;
       elseif and(x==1,y==n)% esquina inferior izquierda
         newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/3;
       elseif and(x==m,y==n)% esquina inferior derecha
         newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:))/3;
       elseif and(x>1,y>1,x<m,y<n)% Caso central
         newpixel = (A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:)+A(x-1,y+1,:)+A(x-1,y,:))/8;
       elseif y==1  %borde arriba
         newpixel = (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:)+A(x+1,y+1,:)+A(x+1,y,:))/5;
       elseif x==1  %borde izquierdo
         newpixel = (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:))/5;
       elseif x==m  %borde derecho
         newpixel = (A(x,y-1,:)+A(x-1,y-1,:)+A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:))/5;
       elseif y==n  %borde abajo
         newpixel = (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:))/5;
       endif
       B(x,y,:) = newpixel(1,1,:); % Se asigna el nuevo valor
    endfor
  endfor
  
endfunction