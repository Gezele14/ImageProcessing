function Y = img2column(A)
  [m,n] = size(A);
  Y = zeros(m*n);
  i = 1;
  for x = 1:m
    for y = 1:n
      Y(i) = A(x,y);
      i += 1;
    endfor
  endfor