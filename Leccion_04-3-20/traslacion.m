function Y=traslacion(A, dx, dy)
  a0=1; a1=0; a2=dx;
  b0=0; b1=1; b2=dy;
  
  %Centro
  [m,n,r] = size(A);
  Y=zeros(m,n,r);
  Y=uint8(Y);
  
  for x=1:m
    for y=1:n
      xnew= mod(round(a0*x + a1*y + a2),m);
      ynew= mod(round(b0*x + b1*y + b2),n);
      xaux= round(a0*x + a1*y + a2);
      yaux= round(b0*x + b1*y + b2);
      if and(xnew==xaux, ynew==yaux)
        Y(xnew+1, ynew+1, :) = A(x,y,:);
      endif
    endfor
  endfor
endfunction
