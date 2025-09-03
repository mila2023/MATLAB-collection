clearvars

syms P(z) A(z) dP(Q)

%dane
L = 5;
ro = 1.06;
miu = 0.053;
P0 = 1.2e5;
A0 = 0.2;
sig1 = 0.2;
sig2 = 0.4;
sig3 = 0.6;
sig4 = 0.8;
epsilon = 1e-10;

%syf
A1(z) = A0 * (1 - (sig1*z)/L);
A2(z) = A0 * (1 - (sig2*z)/L);
A3(z) = A0 * (1 - (sig3*z)/L);
A4(z) = A0 * (1 - (sig4*z)/L);

eq1 = (4*Q^2/3) * diff(1/A1(z), z) + (A1(z)/ro) * diff(P(z), z) + (8*pi*miu*Q)/(ro*A1(z)) == 0;
eq2 = (4*Q^2/3) * diff(1/A2(z), z) + (A2(z)/ro) * diff(P(z), z) + (8*pi*miu*Q)/(ro*A2(z)) == 0;
eq3 = (4*Q^2/3) * diff(1/A3(z), z) + (A3(z)/ro) * diff(P(z), z) + (8*pi*miu*Q)/(ro*A3(z)) == 0;
eq4 = (4*Q^2/3) * diff(1/A4(z), z) + (A4(z)/ro) * diff(P(z), z) + (8*pi*miu*Q)/(ro*A4(z)) == 0;

cond = P(0) == P0;
wyn1 = dsolve(eq1, cond);
wyn2 = dsolve(eq2, cond);
wyn3 = dsolve(eq3, cond);
wyn4 = dsolve(eq4, cond);

dP1(Q) = P0-subs(wyn1,z,L);
dP2(Q) = P0-subs(wyn2,z,L);
dP3(Q) = P0-subs(wyn3,z,L);
dP4(Q) = P0-subs(wyn4,z,L);

%wykresy
figure
hold on
fplot(dP1, [1.0, 5.0])
fplot(dP2, [1.0, 5.0])
fplot(dP3, [1.0, 5.0])
fplot(dP4, [1.0, 5.0])
legend("\sigma = 0.2", "\sigma = 0.4", "\sigma = 0.6", "\sigma = 0.8")
hold off