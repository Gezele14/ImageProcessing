function Y = column2img(A,m,n)
  Y = zeros(m,n);
  for x = 1:m
    for y = 1:n
      Y(x,y) = A(n*(x-1)+y);
    endfor
  endfor