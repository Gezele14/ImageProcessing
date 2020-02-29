clc; clear
pkg load image
%Cargar la imagen
A = imread('cameraman.jpg');
A = im2double(A);

B = imread('fondo.jpg');
B = im2double(B);

C = (1/3)*(B(:,:,1)+B(:,:,2)+B(:,:,3));
imshow(C)

A1 = imresize(A,[256,256]);
C1 = imresize(C,[256,256]);
subplot(1,3,1)
imshow(A1)
title('A1')
subplot(1,3,2)
imshow(C1)
title('C1')
D = (A1+C1)/2;
subplot(1,3,3)
imshow(D)
title('A1 + C1')