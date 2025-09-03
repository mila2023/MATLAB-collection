clearvars

syms P(z) A(z)

%dane
L = 5;
Q = 2;
ro = 1.06;
miu = 0.053;
P0 = 1.2e5;
A0 = 0.2;
sigma = 0.8;

%syf
A(z) = A0 * (1 - (sigma*z)/L);
equ = (4*Q^2/3) * diff(1/A(z), z) + (A(z)/ro) * diff(P(z), z) + (8*pi*miu*Q)/(ro*A(z)) == 0;
cond = P(0) == P0;
wyn = dsolve(equ, cond);

%wykresy
fplot(A, [0, L])
title("Przebieg A(z) w zależności od z")
figure(2);
hold on;
fplot(wyn, [0, L])
title("Przebieg P(z) w zależności od z")
