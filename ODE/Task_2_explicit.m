function [y] = Zadanie2jawna(show, h)

if ~exist('show', 'var')
    show = false;
end
if ~exist('h', 'var')
    h = 1/1000;
end
A = [-20/3 -4/3; 4/3 -10/3];
b = [1; 1];
t = 0:h:8;
y = zeros(2, length(t));

x = @(t) exp(-t) .* sin(t);

for i = 2:length(t)
    f_wew = A*y(:, i-1) + b*x(t(i-1));
    y_zew = y(:, i-1) + (h/2)*f_wew;
    t_zew = t(i-1) + h/2;
    
    f_zew = A*y_zew + b*x(t_zew);
    y(:, i) = y(:, i-1) + h*f_zew;
end
if show
figure('Name','Zadanie2JawnaRozw','NumberTitle','off');
hold on
plot(t, y(1, :));
plot(t, y(2, :));
xlabel('$t$', 'Interpreter','latex')
legend({'$y_1(t)$', '$y_2(t)$'}, 'Interpreter', 'latex','FontSize',14)
% xlabel('t');
% ylabel('y1(t), y2(t)');
% legend('y1(t)', "y2(t)");
% title('Rozwiązanie 2 jawne y1(t), y2(t)');
grid on;
end
end