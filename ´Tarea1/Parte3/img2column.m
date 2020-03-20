function Y = img2column(A)
  [m,n] = size(A);
  Y = zeros(m*n,1);
  for x = 1:m
    for y = 1:n
      Y(n*(x-1)+y) = A(x,y);
    endfor
  endfor