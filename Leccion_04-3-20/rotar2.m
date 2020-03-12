function Y=rotar2(A, angulo)  

  #A es la matriz que representa la imagen (8 bits)
  #Angulo debe estar en grados
  #Y es la imagen rotada
  a0=cosd(angulo); a1=sind(angulo);
  b0=-sind(angulo); b1=cosd(angulo);
  
  %Centro
  [m,n,r] = size(A);
  A = im2double(A);

  scale1 = n; scale2 = m;

  if (angulo > 90)
    scale1 = m; scale2 = n;
  end

  nM = round(scale1*cosd(90-mod(angulo, 90)) + scale2*cosd(mod(angulo, 90)));
  nN = round(scale1*sind(90-mod(angulo, 90)) + scale2*sind(180-mod(angulo, 90)));


  xc=round(nM/2); yc=round(nN/2); %Calcula el centro en la nueva imagen
  difx=round((nM-m)/2); %Calcula nuevo x donde poner A dentro de la nueva imagen
  dify=round((nN-n)/2); %Calcula nuevo y donde poner A dentro de la nueva imagen
  W=zeros(nM,nN,r); %imagen temporal donde se reacomodara A sin rotar
  Y=zeros(nM,nN,r); %crea imagend e salida
  
  
  for x=1:nM
    for y=1:nN
      if and(x < m, y < n)
        W(x+difx,y+dify,:) = A(x,y,:);
      endif
      xnew= mod(round(a0*(x-xc)+a1*(y-yc)+xc),nM);
      ynew= mod(round(b0*(x-xc)+b1*(y-yc)+yc),nN);
      xaux= round(a0*(x-xc)+a1*(y-yc)+xc);
      yaux= round(b0*(x-xc)+b1*(y-yc)+yc);
      if and(xnew==xaux, ynew==yaux)
        Y(xnew+1, ynew+1, :) = W(x,y,:);
      endif
    endfor
  endfor
endfunction