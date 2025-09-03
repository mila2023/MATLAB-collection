function [] = lab5_1() 

syms t x(t) w;

m = 0.5;
b = 0.1;
k = 1;
F0 = 0.1;

F = F0 * heaviside(t)*(1-exp(-0.2*t));
dx = diff(x, t);
dx2 = diff(x, t, 2);

equ = fourier(m*dx2 + b*dx + k*x, t, w) == fourier(F, t, w);
X = fourier(x, t, w);
c = isolate(equ, X);

X = rhs(c);
x = ifourier(X, w, t);

figure(1);

fplot(x, [0, 60])