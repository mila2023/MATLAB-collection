function zad1()
clearvars

d1 = 0.4;
dF = 4;
delta_x = 0.04;
delta_t = 0.002;

x = 0:delta_x:10;

d = d1.*(x < 2) + (d1 + (dF - d1)/(2.8 - 2)*(x - 2)).*(x >= 2 & x <= 2.8) + dF.*(x > 2.8);

U0 = 1.2;
sigma = 1.5;
x0 = 6;

Ux0 = @(x) U0*exp(-(x - x0).^2/(sigma.^2));

figure(1)
hold on;
plot(x, -d);
plot(x, Ux0(x));