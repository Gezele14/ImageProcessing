clc; clear; close all

%Carga de paquetes
pkg load image
pkg load signal

%Carga de imagenes
A = imread('files/imagen1.jpg');
Z = imread("files/marca.jpg");
[m,n] = size(A);

Out = zeros(m,n);

%Imprime imagen original
subplot(2,2,1)
imshow(A)
title("Imagen original")

subplot(2,2,2)
imshow(Z)
title("Marca original")

A = im2double(A);
Z = double(Z);

%Vectores necesarios
B = zeros(8,8);
W = zeros(64,64);
p = q = 1;

%===========PASO 1=================
for i = 1:8:m
  for j = 1:8:n
    B(1:8,1:8) = A(i:i+7,j:j+7);
    B = dct2(B);
    W(p,q) = B(1,1);
    q += 1;
    B = zeros(8,8);
  endfor
  q = 1;
  p += 1;
endfor

%===========PASO 2=================
[U, S, V] = svd(W);

%===========PASO 3=================
alpha = 0.1;
W1 = S + alpha*Z;
[U1,S1,V1] = svd(W1);

A1 = U * S1 * V';

%===========PASO 4=================
%No se hace nada.... de momento

%===========PASO 5=================
p = q = 1;
A1 = idct2(A1);
for i = 1:8:m
  for j = 1:8:n
    B(1:8,1:8) = A(i:i+7,j:j+7);
    B(1,1) = A1(p,q);
    
    Out(i:i+7,j:j+7) = B;
    q += 1;
    B = zeros(8,8);
  endfor
  q = 1;
  p += 1;
endfor

Out = im2uint8(Out);
subplot(2,2,3)
imshow(Out);
title("Imagen Nueva")

%=============Proceso inverso=============
B = zeros(8,8);
X = zeros(64,64);
p = q = 1;
for i = 1:8:m
  for j = 1:8:n
    B(1:8,1:8) = Out(i:i+7,j:j+7);
    B = dct2(B);
    X(p,q) = B(1,1);
    q += 1;
    B = zeros(8,8);
  endfor
  q = 1;
  p += 1;
endfor

[U2 S2 V2] = svd(X);
D = U1 * S2 * V1';

WM = (1/alpha) * (D-S1);

WM = uint8(WM);
subplot(2,2,4)
imshow(WM);
title("Marca Extraida")