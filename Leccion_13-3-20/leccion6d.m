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
    if A(x,y) >= 127
      B(x,y) = 255;
    else
      B(x,y) = 0;
    endif
  endfor
endfor

subplot(1, 2, 2)
imshow(B)
title('imagen transformada')
