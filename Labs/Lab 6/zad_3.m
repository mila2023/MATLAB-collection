function zad_3
clearvars

L = 6.2e-2;
C = 3.4e-5;
R = 70;

f = 10^0:0.1:10^3;
H = @(f) (1/C)./(sqrt((-L*(2*pi.*f).^2+1/C).^2+(R*(2*pi.*f)).^2));

figure(1)
plot(f, abs(H(f)), LineWidth=2);
xscale log;
yscale log

