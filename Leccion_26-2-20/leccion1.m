clc; clear

%Cargar la imagen
X = imread("lena_256.jpg");

%Mostrar imagen
%imshow(X);

%Tama�o de la imagen
[m,n,r] = size(X);

%Imformacion de la imagen
%imfinfo('lena_256.jpg');

%Mostrar las primeras 5 filas y columnas del canal rojo
R5 = X(1:5,1:5,1)

%Convertir de formato imagen a double
R5_2 = im2double(R5)

%Guardar los canales en matrices iguales
R = X(:,:,1);
B = X(:,:,2);
B = X(:,:,3);

%G uardar imagen con solo el canal rojo habilidado

Y = zeros(m,n,3);
Y(:,:,1) = R;
Y = uint8(Y);

imshow(Y);


%Guardar la imagen en disco
imwrite(Y,'canal_rojo.jpg','quality', 100)

% Descomposicion en valores singulares
A= rand(4,6);

[U,S,V] = svd(A) % Donde A = U*S*V'

%Comprimir el canal rojo usando el SVD
R = im2double(R);
[U,S,V] = svd(R);
k = 150;
Ur = U(:,1:k); Sr = S(1:k,1:k); Vr = V (:,1:k);
R_k = Ur * Sr * Vr';
imshow(R_k)