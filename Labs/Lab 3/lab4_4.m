clearvars

syms q(t);

R = 6e3;
C = 0.1e-9;
L = 1.6e-3;
tspan = [0 5e-6];
eps = 1e-10;

odefun = @(t,y) [y(2); 1/L - exp(-(10^7)*t)/L - y(1)/(L*C) - y(2)*R/L];
% war pocz
y0 = [0, 0];
options = odeset("RelTol", eps, "AbsTol", eps);
[t, y] = ode45(odefun, tspan, y0, options);

% q i jego pochodna 
q_wyn = y(:,1);
dq_wyn = y(:,2);

uC = q_wyn/C;
uR = dq_wyn*R;

dt = diff(t);
disp(mean(dt))
