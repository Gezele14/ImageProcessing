pkg load image
pkg load signal
pkg load parallel
pkg load ndpar

function [II, K]=insertWatermark(I, W, a=0.1)
	[m, n] = size(I);
	II = I;
	K = I;
	A = zeros(m/8, n/8);
	for x=1:8:m
		for y=1:8:n
			II(x:x+7, y:y+7) = dct2(I(x:x+7, y:y+7));
			A(ceil(x/8),ceil(y/8)) = II(x:x+7, y:y+7)(1);
		end
	end
	[U, S, V] = svd(A, 1);
	[U1, S1, V1] = svd(S + a * W, 1);
	AA = U * S1 * V';
	K = U1 * S * V1';
	for x=1:8:m
		for y=1:8:n
			II(x, y) = AA(ceil(x/8),ceil(y/8));
			II(x:x+7, y:y+7) = idct2(II(x:x+7, y:y+7));
		end
	end
endfunction

function W=extractWatermark(II, K, a=0.1)
	[m, n] = size(II);
	AA = zeros(m/8, n/8);
	for x=1:8:m
		for y=1:8:n
			AA(ceil(x/8),ceil(y/8)) = dct2(II(x:x+7, y:y+7))(1);
		end
	end
	[UU, SS, VV] = svd(AA, 1);
	[U1, S, V1] = svd(K,1);
	D = U1 * SS * V1';
	W = 1/a * (D-S);
endfunction


I = imread('imagen1.jpg');
I = im2double(I);
subplot(2,2,1);
imshow(I);
title('Original Image');

W = imread('marca.jpg');
W = im2double(W);
subplot(2,2,2);
imshow(W);
title('Watermark');

a = 0.1;

[II, K] = insertWatermark(I, W, a);
subplot(2,2,3);
imshow(II);
title('Image with watermark')

W = extractWatermark(II, K, a);
subplot(2,2,4);
imshow(W);
title('Extracted watermark')

waitfor(gcf)