clc; clear
pkg load image
pkg load video
%Comado para cargar un video
V = VideoReader('video_original.mp4'); %V es un objeto que contiene informacion del video
fr = V.NumberOfFrames; %Numero de marcos

m = V.Height; %Numero de filas de cada marco
n = V.Width; %Numero de filas de cada marco
m = round(m/2); n = round(n/2); %Redimensionar el tamano de cada marco
Y = uint8(zeros(m,n,3,fr)); %La matriz donde guarda todos los marcos del video en su nuevo tamano

%Leer el video y guardar cada uno de los marcos en si nuevo tamano
for k =1 : fr
  Z = readFrame(V); %Leer cada uno de los marcos del video. Z es una imagen a color
  Y(:,:,1,k) = imresize(Z(:,:,1), [m,n]);
  Y(:,:,2,k) = imresize(Z(:,:,2), [m,n]);
  Y(:,:,3,k) = imresize(Z(:,:,3), [m,n]);
end 

imshow(Y(:,:,:,114));