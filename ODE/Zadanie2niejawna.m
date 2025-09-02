function [y] = Zadanie2niejawna(show, h)

if ~exist('show', 'var')
    show = false;
end
if ~exist('h', 'var')
    h = 1/1000;
end
A = [-20/3 -4/3; 4/3 -10/3];
I = [1 0; 0 1];
b = [1; 1];
t = 0:h:8;
y = zeros(2, length(t));

x = @(t) exp(-t) .* sin(t);

f_wew = A*y(:, 1) + b*x(t(1));
y_zew = y(:, 1) + (h/2)*f_wew;
t_zew = t(1) + h/2;
f_zew = A*y_zew + b*x(t_zew);
y(:, 2) = y(:, 1) + h*f_zew;

for i = 3:length(t)
    syf = I-(2/3)*h*A;
    y(:, i) = syf\((4/3)*y(:,i-1)-(1/3)*y(:,i-2)+(2/3)*h*b*x(t(i)));
end

if show
figure('Name','Zadanie2niejawnarozw','NumberTitle','off');
hold on
plot(t, y(1, :));
plot(t, y(2, :));
xlabel('$t$', 'Interpreter','latex')
legend({'$y_1(t)$', '$y_2(t)$'}, 'Interpreter', 'latex','FontSize',14)
% xlabel('t');
% ylabel('y1(t), y2(t)');
% legend('y1(t)', "y2(t)");
% title('Rozwiązanie 2 niejawne y1(t), y2(t)');
grid on;
end
end