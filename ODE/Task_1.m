function [y1n, y2n] = Zadanie1(show)

if ~exist('show', 'var')
    show = false;
end

syms x(t) y1(t) y2(t)

a = -20/3;
b = -4/3;
c = 4/3;
d = -10/3;

tspan = [0, 8];
x(t) = exp(-t)*sin(t);

eqns = [diff(y1,t) == a*y1 + b*y2 + x, diff(y2,t) == c*y1 + d*y2 + x];
conds = [y1(0) == 0; y2(0) == 0];
[y1_s, y2_s] = dsolve(eqns, conds);
y1n = matlabFunction(y1_s);
y2n = matlabFunction(y2_s);

if show
figure('Name','Zadanie1rozwy1y2','NumberTitle','off');
hold on
fplot(y1_s, tspan)
fplot(y2_s, tspan)
% title('Rozwiązanie 1 y1(t), y2(t)')
xlabel('$t$', 'Interpreter','latex')
legend({'$y_1(t)$', '$y_2(t)$'}, 'Interpreter', 'latex','FontSize',14)
grid on
hold off
end
end