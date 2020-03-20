clc; clear;
A = imread('boat.jpg');
subplot(1, 2, 1)
imshow(A)
title('imagen Original')

c = 1;

for a = 0:0.1:2 
  B = c * power(A,a);
  subplot(1, 2, 2)
  imshow(B)
  title('imagen transformada')
  pause(0.25)
endfor
