numimg = 40;
image = imread(['Comparar/' num2str(numimg) '_10.png']);
image = im2double(image);
f_image = img2column(image);

x_image = U' * (f_image - fprom);

fp = U * x_image;

Ef = norm(((f_image - fprom) - fp),2);

index = 0;
Ei_temp = 0;
Ei = 100000;

if Ef > E1
  disp('No es una cara');
else
  for i = 1:360
    Ei_temp = norm(x_image - X(:,i), 2);
    if Ei_temp < Ei
      index = i;
      Ei = Ei_temp;
    endif
  endfor
  
  subplot(1, 2, 1)
  imshow(image)
  title(['Imagen a comparar: ' num2str(numimg)])
  
  subplot(1, 2, 2)
  imshow(column2img(S(:,index),112,92))
  title(['Imagen mas parecida, index = ' num2str(index)])
endif