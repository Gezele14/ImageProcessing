function Y=rotar(A, angulo)
  #A es la matriz que representa la imagen (8 bits)
  #Angulo debe estar en grados
  #Y es la imagen rotada
  a0=cosd(angulo); a1=sind(angulo); a2=0;
  b0=-sind(angulo); b1=cosd(angulo); b2=0;
  
  %Centro
  [m,n,r] = size(A);
  xc=round(m/2); yc=n/2;
  Y=zeros(m,n,r);
  Y=uint8(Y);
  
  for x=1:m
    for y=1:n
      xnew= mod(round(a0*(x-xc)+a1*(y-yc)+xc),m);
      ynew= mod(round(b0*(x-xc)+b1*(y-yc)+xc),n);
      xaux= round(a0*(x-xc)+a1*(y-yc)+xc);
      yaux= round(b0*(x-xc)+b1*(y-yc)+xc);
      if and(xnew==xaux, ynew==yaux)
        Y(xnew+1, ynew+1, :) = A(x,y,:);
      endif
    endfor
  endfor
  
  
endfunction