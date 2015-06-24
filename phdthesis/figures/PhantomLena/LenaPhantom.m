ca;clear all;

% read lena phantom
lena = double(imread('lena.tif'));
% pad symmetric
lenap = padarray(lena,[256 256],'symmetric','both');
% fft
lenaf = log( 1 + abs(fftshift( fft2(lenap) ) ) );
% save
lena = normat( lena );
lenaf = normat( Binning( lenaf ) );
imwrite(lena,'PhantomLena.png')
imwrite(lenaf,'PhantomLena_ft.png')
% print
domain(lena)
domain(lenaf)
% show
itool(lena)
itool(lenaf)