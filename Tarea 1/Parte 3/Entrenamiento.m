clc; clear;
pkg load image

M = 112*92; %Tamaño del vwector imagen
N = 40*9; %cantidad de imagenes
S = A = zeros(M,N); 
f = fprom = zeros(M,1);

%-----------Creacion del espacio---------------------------------
disp('- Inicio creacion del espacio.')
for x = 1:40
  for y = 1:9
    B = imread(['Database/' int2str(x) '_' int2str(y) '.png']);
    B = im2double(B); %Carga y convierte a double la imagen
    f = img2column(B); %Comvierte la matriz de la imagen en vector
    S(:,(x-1)*9+y) = f;
    fprom = fprom + f;
  endfor
endfor
disp('- Espacio creado.')

%------------Calcula el vector promedio de imagenes------------
fprom = fprom/N;
disp('- Imagen promedio del espacio creada.')

%------------Crea la matriz A----------------------------------
disp('- Inicio creacion de la matriz A = f-fprom.')
for y = 1:N
  A(:,y) = S(:,y) - fprom;
endfor
disp('- matriz A = f-fprom creada.')

%------------Calcula SVD----------------------------------------
disp('- inicio calculo de valores singulares de A')
[U,E,V] = svd(A);
disp('- Valores singulares de A creados')

%------------vector de coordenadas------------------------------
disp('- Inicio creacion del vector de coordenadas')
X = coordvector(U, A);
disp('- Vector de coordenadas creado')

%------------E0---------------------------------------------------
disp('- inicio calculo de umbrales')
E1 = threshhold(X);
disp('- E_1 creado')


disp('')
disp('*****************************')
disp('-> Entrenamiento finalizado<-')
disp('*****************************')
