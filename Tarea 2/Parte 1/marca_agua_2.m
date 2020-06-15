clc; clear; close all

%Carga de paquetes
pkg load image
pkg load signal

%Carga de imagenes
A = imread('files/imagen2.jpg');
[m,n] = size(A);

Out = zeros(128,128);

%Imprime imagen inicial
subplot(2,2,1)
imshow(A)
title("Imagen con Ruido")

A = im2double(A);

%Vectores necesarios
B = zeros(8,8);
W = zeros(128,128);
p = q = 1;


%=============Proceso inverso=============
B = zeros(8,8);
X = zeros(64,64);
p = q = 1;
for i = 1:8:m
  for j = 1:8:n
    B(1:8,1:8) = Out(i:i+7,j:j+7);
    B1 = dct(B(1,1));
    X(p,q) = B1;
    q += 1;
    B = zeros(8,8);
  endfor
  q = 1;
  p += 1;
endfor

[U2 S2 V2] = svd(X);
D = U1 * S2 * V1';

WM = (1/alpha) * (D-S1);

WM = Promedio(WM);
WM = uint8(WM);
subplot(2,2,4)
imshow(WM);
title("Marca Extraida")