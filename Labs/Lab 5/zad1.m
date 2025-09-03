clearvars

par = [12.0 0.15 0.05 13.5];
x0 = 100;
y0 = 60;

epsilon = 10^(-12);
tspan = [0 1];

function dydt = odefun(t, y, par)
    dydt = [ (par(1)*y(1)-par(2)*y(1)*y(2)) ; (par(3)*y(1)*y(2) - par(4)*y(2))];
end
[t, y] = ode45(@odefun, tspan, [x0 y0], [], par);
plot(t, y)
legend("ofiary", "drapieżniki")