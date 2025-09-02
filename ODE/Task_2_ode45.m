function [] = Zadanie2ode45()

clearvars

a = -20/3;
b = -4/3;
c = 4/3;
d = -10/3;

dydt = @(t,y) [a*y(1) + b*y(2) + exp(-t)*sin(t); c*y(1) + d*y(2) + exp(-t)*sin(t)];
tspan = [0, 8];
conds = [0; 0];

[t, y] = ode45(dydt,tspan, conds);

disp(y(2,:))

figure('Name','Zadanie2ode45Rozwy1y2','NumberTitle','off');
hold on
plot(t, y(:,1))
plot(t, y(:,2))
% title('Rozwiązanie 2 ode45 y1(t), y2(t)')
xlabel('$t$', 'Interpreter','latex')
legend({'$y_1(t)$', '$y_2(t)$'}, 'Interpreter', 'latex','FontSize',14)
% ylabel('y1(t), y2(t)')
grid on
hold off

end