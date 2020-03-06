clc; clear;
pkg load image
pkg load video

rango = [0 1:60 61];
Y= zeros(256,256,62);

for k = rango
 if k < 10
   A = imread(['VIDEO/VIDEO_00' num2str(k) '.jpg']);
 else
   A = imread(['VIDEO/VIDEO_0' num2str(k) '.jpg']);
 endif
  
 A = imresize(A,[256 256]);
 Y(:,:,k+1) = A(:,:,1); 
end 

video = Videp