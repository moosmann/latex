ca;
clear all
% create Shepp-Logan-Phantom
ph = 1-phantom('Modified Shepp-Logan',256)';
% Fourier transfrom
phd = padarray(ph,[128 128],'symmetric','both');
phf = 1-normat(log(1+ abs( fftshift( fft2(phd) ) ) ) );
%phf = phf(2:2:end,2:2:end);
phf = Binning(phf(2:end,2:end));
% projection
sino = radon(ph,[0:0.5:180]);
%p = Binning(sino);
p = sino(:,1);
binp = 6;
% numpn = floor(size(p,1)/binp);
% pn = zeros(numpn,1);
% for nn=1:binp
%     pn = pn + p(nn:binp:binp*numpn) ;
% end
pn = 0.5*normat(p(ceil(binp/2):binp:end-floor(binp/2)))';
N = numel(pn);
x = 2*(0:N-1)/(N-1) -1;

sino = normat(sino);
% save images
imwrite(ph,'Phantom.png');
imwrite(phf,'Phantom_FT.png');
imwrite(sino,'Phantom_sino.png');
sinoinv = normat(1-sino);
imwrite(sinoinv,'Phantom_sino_inv.png');

% print
domain(ph),domain(phf),domain(sino)
fprintf('\n')
fprintf('(%.2g,%.2g) ',[pn;x])
fprintf('\n')
% show
itool(ph)
itool(phf)
itool(sino)
figure,plot(p)
figure,plot(pn)


