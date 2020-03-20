clc; clear;

A = imread('boat.jpg');

subplot(1, 2, 1)
imshow(A)
title('imagen original')

c = 2; 

for b = 0:20:200 
  A = c*A+b;
  subplot(1, 2, 2)
  imshow(A)
  title('imagen transformada')
  pause(0.25)
endfor
