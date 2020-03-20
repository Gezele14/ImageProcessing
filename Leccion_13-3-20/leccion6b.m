clc; clear;
A = imread('boat.jpg');
subplot(1, 3, 1)
imshow(A)
title('imagen Original')

A = imread('boat_new.jpg');
subplot(1, 3, 2)
imshow(A)
title('imagen nueva')

L = 255;
rmax = max(max(A));
rmin = min(min(A));

A = (L-1) / (rmax-rmin) * (A-rmin);
subplot(1, 3, 3)
imshow(A)
title('imagen transformada')
