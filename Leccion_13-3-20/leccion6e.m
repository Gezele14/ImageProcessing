clc; clear;
A = imread('boat.jpg');
subplot(1, 2, 1)
imshow(A)
title('imagen Original')

[m,n,r] = size(A);
B = zeros(m,n,r);
B = uint8(B);
for x = 1:m
  for y = 1:n
    if x < m/2
      if and(A(x,y) <= 130, A(x,y) >= 125)
        B(x,y) = 0;
      elseif A(x,y) > 170
        B(x,y) = 255;
      endif
    else
      B(x,y) = A(x,y);
    endif
  endfor
endfor

subplot(1, 2, 2)
imshow(B)
title('imagen transformada')
