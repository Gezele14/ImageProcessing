function B = limpiar(A)
  #A es la matriz a la cual de le hara limpieza
  [m,n,r] = size(A);
  B=zeros(m,n,r);
  B=uint8(B);
  for x=1:m
    for y=1:n
     if and(x==1, y==1)
       B(x,y,:) = (1/3) * (A(x,y+1,:)+A(x+1,y,:)+A(x+1,y+1,:));
     elseif and(x==m,y==1)
       B(x,y,:) = (1/3) * (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:));
     elseif and(x==1,y==n)
       B(x,y,:) = (1/3) * (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:));
     elseif and(x==m,y==n)
       B(x,y,:) = (1/3)* (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:));
     elseif and(y==1,x>1)
       B(x,y,:) = (1/5) * (A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:)+A(x+1,y+1,:)+A(x+1,y,:));
     elseif and(x==1, y>1)
       B(x,y,:) = (1/5) * (A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:));
     elseif and(x==m, y>1)
       B(x,y,:) = (1/5) * (A(x,y-1,:)+A(x-1,y-1,:)+A(x-1,y,:)+A(x-1,y+1,:)+A(x,y+1,:));
     elseif and(y==n, x>1)
       B(x,y,:) = (1/5)* (A(x-1,y,:)+A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:));
     else
       B(x,y,:) = (1/8) * (A(x-1,y-1,:)+A(x,y-1,:)+A(x+1,y-1,:)+A(x+1,y,:)+A(x+1,y+1,:)+A(x,y+1,:)+A(x-1,y+1,:)+A(x-1,y,:));
     endif
       
    endfor
  endfor
  
endfunction