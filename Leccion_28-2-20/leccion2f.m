clc; clear
pkg load image
%Aclarar y oscurecer imagenes
%Cargar la imagen
rango = [0 1:60 61];

for k = rango
  if k < 10
    A = imread(['VIDEO/VIDEO_00' num2str(k) '.jpg']);
  else
    A = imread(['VIDEO/VIDEO_0' num2str(k) '.jpg']);
  endif
  subplot(1,2,1)
  imshow(A)
  title('Normal')
  pause(0.1)
end