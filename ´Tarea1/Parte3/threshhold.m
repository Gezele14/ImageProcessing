function Y = threshhold(A)
  [m,n] = size(A);
  Y = Y_temp = 0;
  for i = 1:n
    Y_temp =  norm(A-A(:,i),2);
    if Y_temp > Y
      Y = Y_temp;
    endif
  endfor
endfunction