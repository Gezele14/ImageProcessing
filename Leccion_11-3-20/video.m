clc; clear;
pkg load image
pkg load video

maximg = 200;

rango = 5:5:maximg;

A = imread('barbara.jpg');
A = imresize(A,[256, 256]);

video = VideoWriter('Video2.avi');
open(video);
for k = rango
  B = rippling(A,75,75,k,k);
  
  for j = 1:7
    writeVideo(video, B);
  endfor
endfor
close(video);