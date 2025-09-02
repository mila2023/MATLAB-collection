function [y] = Zadanie2RK(show, h)

if ~exist('show', 'var')
    show = false;
end

if ~exist('h', 'var')
    h = 1/1000;
end

A = [-20/3, -4/3; 4/3, -10/3];
c = [0, 1/2, 1];
w = [1/6, 2/3, 1/6];
a = [1/6, -1/3, 1/6; 1/6, 5/12, -1/12; 1/6, 2/3, 1/6];
I = [1 0; 0 1];
b = [1; 1];
t = 0:h:8;
y = zeros(2, length(t));

x = @(t) exp(-t) .* sin(t);

H = h*A;
L = [I-a(1,1)*H, -H*a(1,2), -H*a(1,3); -H*a(2,1), I-H*a(2,2), -H*a(2,3); -H*a(3,1), -H*a(3,2), I-H*a(3,3)];

for i = 2:length(t)
    P = [A*y(:,i-1) + b*x(t(i-1) + c(1)*h); A*y(:,i-1) + b*x(t(i-1) + c(2)*h); A*y(:,i-1) + b*x(t(i-1) + c(3)*h)];
    g = L\P;
    
    suma = 0;
    for j = 1:3
        suma = suma + w(j)*g([j*2-1,j*2]);
    end

    y(:, i) = y(:,i-1) + h*suma;
end

if show
    figure('Name','Zadanie2RKrozw','NumberTitle','off');
    hold on
    plot(t, y(1, :));
    plot(t, y(2, :));
    xlabel('$t$', 'Interpreter','latex')
    legend({'$y_1(t)$', '$y_2(t)$'}, 'Interpreter', 'latex','FontSize',14)
    % xlabel('t');
    % ylabel('y1(t), y2(t)');
    % legend('y1(t)', "y2(t)");
    % title('Rozwiązanie 2 RK y1(t), y2(t)');
    grid on;
end

end