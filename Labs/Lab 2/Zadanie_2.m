clearvars

syms A(z) P(z)

%dane
L = 5;
Q = 2;
ro = 1.06;
miu = 0.053;
P0 = 1.2e5;
A0 = 0.2;
sigma = 0.8;
epsilon = 1e-10;

%syf
A = @(z) A0 * (1 - (sigma*z)/L);
d_odwA = @(z) -(1/A(z)^2) * (A(z + epsilon) - A(z - epsilon)) / (2*epsilon);
odefun = @(z) -(ro/A(z))*( (8*pi*miu*Q)/(ro*A(z)) + (4*Q^2/3) * d_odwA(z) );
[z, P] = ode45(@(z, P) odefun(z), [0 L], P0);

%wykres
figure(2);
plot(z, P, "--")
title('Ciśnienie P(z) dla różnych wartości z')
hold off;
