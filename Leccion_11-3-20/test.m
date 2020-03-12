clc; clear;
pkg load image

A = imread('barbara.jpg');

B = rippling(A,75,75,5,5);

C = limpiar(B); 

subplot(1,3,1) 
imshow(A)
title('Normal')

subplot(1,3,2)
imshow(B)
title('Rippling')

subplot(1,3,3)
imshow(C)
title('Rippling limpio')