clc; clear

%Cargar la imagen
A = imread('cameraman.jpg');
A = im2double(A);
[m,n] = size(A);
s = svd(A); %Escribe los valores singulares de la matriz A en el vector s
r = min([m,n]);

[U,S,V] = svd(A);

dimensiones = [1 20:20:460 469];
for k = dimensiones
  Uk = U(:,1:k); Sr = S(1:k,1:k); Vr = V (:,1:k);
  A_k = Uk * Sr * Vr';
  error = norm(A-A_k);
  %subplot(1,2,1)
  %imshow(A)
  %title('Imagen Original')
  %subplot(1,2,2)
  %imshow(A)
  %title(['Imagen Reconstruida con k =' num2str(k) 'con error de ' num2str(error)])
  plot(1:k, error)
  %pause(0.5)
end

