clc; clear; close all

%Carga de paquetes
pkg load image
pkg load signal

%Carga de imagenes
A = imread('files/imagen2.jpg');
[m,n] = size(A);

Out = zeros(128,128);

%Imprime imagen inicial
subplot(1,2,1)
imshow(A)
title("Imagen con Ruido")

A = im2double(A);

%Vectores necesarios
B = zeros(4,4);
Out = zeros(256,256);
p = q = 1;


%=============Proceso inverso=============
B = zeros(4,4);
p = q = 1;
for i = 1:4:m
  for j = 1:4:n
    B(1:4,1:4) = A(i:i+3,j:j+3);
    B1 = dct(B(1,1));
    Out(p,q) = B1;
    q += 1;
    B = zeros(4,4);
  endfor
  q = 1;
  p += 1;
endfor

alpha = 0.1;
U1 = cell2mat(struct2cell(load("files/U1")));
V1 = cell2mat(struct2cell(load("files/V1")));

[U2 S2 V2] = svd(Out);
D = U1 * S2 * V1';

WM = (1/alpha) * (D-S2);

WM = im2uint8(WM);
subplot(1,2,2)
imshow(WM);
title("Marca Extraida")