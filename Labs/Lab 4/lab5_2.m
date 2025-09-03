function [] = lab5_2() 

syms t x(t) w omega;

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
disp(isolate(equ, x))
X = rhs(c);
x = ifourier(X, w, t);

figure(2)
fplot(1/sqrt((k-m*omega^2)^2+(b^2)*omega^2), [0, 10]);

% 
% figure(3)
% hold on
% w0 = [0.1, 1.4, 3.2];
% for i = 1:3
%     F = F0*heaviside(t)*cos(w0(i)*t);
%     dx = diff(x, t);
%     dx2 = diff(x, t, 2);
%     equ = fourier(m*dx2 + b*dx + k*x, t, w) == fourier(F, t, w);
%     X = fourier(x, t, w);
%     c = isolate(equ, X);
%     X = rhs(c);
%     x = ifourier(X, w, t);
%     fplot(x, [0, 60])
% end
% 
% hold off