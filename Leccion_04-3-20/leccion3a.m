clc; clear;
pkg load image;

A = imread('barbara.jpg');

%Rotar de la imagen A
deltax = 200; deltay = 150;

angulo = 30;
a0=cosd(angulo); a1=sind(angulo); a2=0;
b0=-sind(angulo); b1=cosd(angulo); b2=0;

T = [a0 a1 a2; b0 b1 b2; 0 0 1];

Tr = maketform('affine', T'); %Crear la transformacion

B=escalar(A,[1.5,1.5]);
B=escalar(A,[1.5,1.5]);

subplot(1,3,1) 
imshow(A)
title('Normal')

subplot(1,3,2)
imshow(B)
title('escalar(A, [1.5,1.5])')
