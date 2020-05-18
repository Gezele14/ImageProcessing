clc; clear;
pkg load image;
% Se leen las imagenes
A= imread('imagen1.jpg');
B= imread('imagen0.jpg');

% Se obtiene la norma de la imagen original
norma_original = norm_fro(im2double(B));

subplot(1,4,1)
imshow(B)
title(['Original y con norma = ' num2str(norma_original)])

subplot(1,4,2)
imshow(A)
title('Original con ruido')

% Se aplica la interpolacion bilineal
C= bilineal(A);
% Se obtiene la norma de la imagen y su error con respecto a la original
norma_bi = norm_fro(C);
error_bi = ((abs(norma_original - norma_bi)) / (abs(norma_original)));
subplot(1,4,3)
imshow(C)
title(['Interpolacion Bilineal con norma = ' num2str(norma_bi) ' y con error = ' num2str(error_bi)])

% Se aplica la interpolacion del promedio
D= Promedio(A);
% Se obtiene la norma de la imagen y su error con respecto a la original
norma_pro = norm_fro(D);
error_pro = ((abs(norma_original - norma_pro)) / (abs(norma_original)));
subplot(1,4,4)
imshow(D)
title(['Promedio con norma = ' num2str(norma_pro) ' y con error = ' num2str(error_pro)])

