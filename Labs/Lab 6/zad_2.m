function zad_2
clearvars

L = 6.2e-2;
C = 3.4e-5;
R = 70;

fs = 2000;
dt = 1/fs;
t = 0:dt:0.2;
N = length(t);

x = (-0.6*sin(20*pi*t)+0.4*cos(380*pi*t)).*(t>=0 & t<=0.2);
H = @(f) L*(2*pi.*f).^2./(sqrt((-L*(2*pi.*f).^2+1/C).^2+(R*(2*pi.*f)).^2));

X = fftshift(fft(x));
f = linspace(-fs/2, fs/2, N);
Xf = H(f).*X;

xf = ifft(ifftshift(Xf));

figure(1)
title("przebieg sygnalu");
hold on
plot(f, x);
plot(f, xf);

figure(2)
title("widmo amplitudowe")
hold on
plot(f, abs(X));
plot(f, abs(Xf));