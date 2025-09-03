clearvars

syms t q(t);

R = 6e3;
C = 0.1e-9;
L = 1.6e-3;

equ = (1- exp(-(10^7)*t) - q(t)/C - R*diff(q,t) - L*diff(q,t,2)) == 0;

d = diff(q,t);
cond = [q(0) == 0, d(0) == 0];

wyn = dsolve(equ, cond);

figure(1)
hold on
grid on
fplot(wyn/C, [0 5e-6])
fplot(R*diff(wyn, t), [0 5e-6])
xlim = ([0 5e-6]);