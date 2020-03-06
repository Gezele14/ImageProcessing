clc; clear

%Cargar la imagen
A = imread('cameraman.jpg');
A = im2double(A);
[m,n] = size(A);
s = svd(A); %Escribe los valores singulares de la matriz A en el vector s
r = min([m,n]);
%plot(1:r,s)

[U,S,V] = svd(A);
k = 150;
Uk = U(:,1:k); Sr = S(1:k,1:k); Vr = V (:,1:k);
A_k = Uk * Sr * Vr';

subplot(1,2,1)
imshow(A)
title('Imagen Original')
subplot(1,2,2)
imshow(A)
title('Imagen Reconstruida')
