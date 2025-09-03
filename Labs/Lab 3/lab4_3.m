clearvars

syms q(t);

R = 6e3;
C = 0.1e-9;
L = 1.6e-3;
tspan = linspace(0, 5e-6, 1000);

% dsolve
equ = (1- exp(-(10^7)*t) - q(t)/C - R*diff(q,t) - L*diff(q,t,2)) == 0;
d = diff(q,t);
cond = [q(0) == 0, d(0) == 0];

q(t) = dsolve(equ, cond);
uC_1(t) = q(t)/C;
uR_1(t) = R*diff(q, t);




% ode45
odefun = @(t_2,y) [y(2); 1/L - exp(-(10^7)*t_2)/L - y(1)/(L*C) - y(2)*R/L];
y0 = [0; 0];
[t_2, y_2] = ode45(odefun, [0 5e-6], y0);

q_wyn_2 = y_2(:,1);
dq_2 = y_2(:,2);

uC_wyn_2 = q_wyn_2/C;
uR_wyn_2 = R*dq_2;

%syf
q_wyn_1 = double(subs(q, t, t_2));
uC_wyn_1 = double(subs(uC_1, t, t_2));
uR_wyn_1 = double(subs(uR_1, t, t_2));

delta_q = abs(q_wyn_1-q_wyn_2);
delta_uC = abs(uC_wyn_1-uC_wyn_2);
delta_uR = abs(uR_wyn_1-uR_wyn_2);

dmax_q = max(delta_q);
dmax_uC = max(delta_uC);
dmax_uR = max(delta_uR);

disp(dmax_q)
disp(dmax_uC)
disp(dmax_uR)

% mean