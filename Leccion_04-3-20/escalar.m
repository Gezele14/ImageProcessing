function Y=escalar(A, S)
  a0=S(1);
  b1=S(2);
  
  %Centro
  [m,n,r] = size(A);
  
  nM = round(a0*m);
  nN = round(b1*n);
  
  Y=zeros(nM,nN,r);
  Y=uint8(Y);
  
  for x=1:m
    for y=1:n
      xnew= mod(round(a0*x),m);
      ynew= mod(round(b1*y),n);
      Y(xnew+1, ynew+1, :) = A(x,y,:);
    endfor
  endfor
endfunction
