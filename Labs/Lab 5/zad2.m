clearvars

par = [12.0 0.15 0.05 13.5];
x0 = 100;
y0 = 60;
h = 0.01;

epsilon = 10^(-12);
tspan = [0 1];

z = zeros(2, 101);
z(1,1) = x0;
z(2,1) = y0;

% function y = f1(z1, z2, par)
%     y = par(1)*z1 - par(2)*z1*z2;
% end
% 
% function y = f2(z1, z2, par)
%     y = par(3)*z1*z2 - par(4)*z2;
% end

function y = f(t, z, par)
    y = [par(1)*z(1)-par(2)*z(1)*z(2);par(3)*z(1)*z(2)-par(4)*z(2)];
end

for i = 2:101
    tn = (i-1)*h;
    tn_1 = (i-2)*h;
    z(:,i) = z(:, i-1) + h*f(tn_1, z(:,i-1), par);
    %z(1,i) = z(1,i-1) + h*f1(tn_1, z(1,i-1), z(2,i-1), par);
    %z(2,i) = z(2,i-1) + h*f2(z(1,i-1), z(2,i-1), par);
end
% 
% 
% function dydt = odefun(t, y, par)
%     dydt = [ (par(1)*y(1)-par(2)*y(1)*y(2)) ; (par(3)*y(1)*y(2) - par(4)*y(2))];
% end
% [t, y] = ode45(@odefun, tspan, [x0 y0], [], par);
% disp(y)
% function tn = nwm(n)
%     tn = n*h;
% end
% 
% function zn = nwm2xd(nwm())
%     zn = []
% end
figure
hold on
plot(z(1, :))
plot(z(2, :))
hold off
%legend("ofiary", "drapieżniki")

