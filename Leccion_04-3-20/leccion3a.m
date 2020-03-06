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

B=rotar(A,30);

C=limpiar(A);

subplot(1,3,1)
imshow(A)

subplot(1,3,2)
imshow(B)

subplot(1,3,3)
imshow(C)