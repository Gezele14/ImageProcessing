clc; clear
pkg load image
%Aclarar y oscurecer imagenes
%Cargar la imagen
A = imread('cameraman.jpg');
subplot(1,3,1)
imshow(A)
title('Normal')

subplot(1,3,2)
imshow(A+75)
title('Aclarar')

subplot(1,3,3)
imshow(A-75)
title('Oscurecer')

