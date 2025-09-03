function zad_1
clearvars

L = 6.2e-2;
C = 3.4e-5;
R = 70;

f = 10^0:0.1:10^3;
H = @(f) L*(2*pi.*f).^2./(sqrt((-L*(2*pi.*f).^2+1/C).^2+(R*(2*pi.*f)).^2));

figure(1)
plot(f, abs(H(f)), LineWidth=2);
xscale log;
yscale log

%tranformata=widmo
%sygnal->widmo =>fft=> widmo*charakterystyka =>ifft=> widmo->sygnal
%
% 
% fs= 4000;
% dt= 1/fs;
% tspan = [0, 20e-3];
% 
% t = tspan(1):dt:tspan(2);
% x = sin(2*pi*440*t);
% 
% figure(1);
% plot(t,x,LineWidth=2);
% 
% X = fftshift(fft(x));
% f = linspace(-fs/2, fs/2 -1, length(t));
% 
% 
% figure(2);
% plot(f, abs(X), LineWidth=2);
% 
% x2 = ifft(ifftshift(X));
% 
% figure(1)
% hold on
% plot(t, x2, '--', LineWidth=2);