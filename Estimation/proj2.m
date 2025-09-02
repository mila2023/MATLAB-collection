function proj2()

    data = readtable('data_57.csv');
    time = readtable('query_57.csv');
    
    G = 1;
    m = linspace(1/10, 10, 100);

    bledy = zeros(1, length(m));

    function p = pom(j, a, b, c)
        h2 = ((data.t(j+1)-data.t(j-1))/2)^2;
        p = (a - 2*b + c)/h2;
    end

    for j = 2:height(data.t)-1
        x = zeros(3);
        y = zeros(3);
        x(1) = data.x1(j);
        y(1) = data.y1(j);
        x(2) = data.x2(j);
        y(2) = data.y2(j);
        x(3) = data.x3(j);
        y(3) = data.y3(j);
        
        wyn = zeros(1, 6);
        wyn(1) = pom(j, data.x1(j+1), data.x1(j), data.x1(j-1));
        wyn(2) = pom(j, data.y1(j+1), data.y1(j), data.y1(j-1));
        wyn(3) = pom(j, data.x2(j+1), data.x2(j), data.x2(j-1));
        wyn(4) = pom(j, data.y2(j+1), data.y2(j), data.y2(j-1));
        wyn(5) = pom(j, data.x3(j+1), data.x3(j), data.x3(j-1));
        wyn(6) = pom(j, data.y3(j+1), data.y3(j), data.y3(j-1));

        for i = 1:length(m)
            P = Pstrona(m(i), x, y);
            L = wyn;
            for k = 1:6
                bledy(i) = bledy(i) + (P(k)-L(k))^2;
            end
            if( j == height(data.t)-1 )
                if(i == 1)
                    masa = m(i);
                    bledy_min = bledy(i);
                elseif( bledy(i) < bledy_min )
                    masa = m(i);
                    bledy_min = bledy(i);
                end
            end
        end
    end
    % mam juz wstepna mase
    
    ode_opts = odeset('AbsTol', 1e-12, 'RelTol', 1e-10);

    % wartosci poczatkowe
    h = data.t(2) - data.t(1);
    v1x_0 = (data.x1(2) - data.x1(1)) / h;
    v1y_0 = (data.y1(2) - data.y1(1)) / h;
    v2x_0 = (data.x2(2) - data.x2(1)) / h;
    v2y_0 = (data.y2(2) - data.y2(1)) / h;
    v3x_0 = (data.x3(2) - data.x3(1)) / h;
    v3y_0 = (data.y3(2) - data.y3(1)) / h;

    p0 = [data.x1(2), data.y1(2), data.x2(2), data.y2(2), data.x3(2), data.y3(2), v1x_0, v1y_0, v2x_0, v2y_0, v3x_0, v3y_0, masa];
     
    function dydt = odefun(t, y, masa)
        dydt = zeros(12,1);
        for i = 1:6
            dydt(i,1) = y(i+6);
        end

        r12 = (sqrt((y(3)-y(1))^2 + (y(4)-y(2))^2))^3;
        r31 = (sqrt((y(1)-y(5))^2 + (y(2)-y(6))^2))^3;
        r23 = (sqrt((y(5)-y(3))^2 + (y(6)-y(4))^2))^3;

        G_masa = 1*masa;

        dydt(7,1) = G_masa*((y(3)-y(1))/r12 + (y(5)-y(1))/r31);
        dydt(8,1) = G_masa*((y(4)-y(2))/r12 + (y(6)-y(2))/r31);
        dydt(9,1) = G_masa*((y(5)-y(3))/r23 + (y(1)-y(3))/r12);
        dydt(10,1) = G_masa*((y(6)-y(4))/r23 + (y(2)-y(4))/r12);
        dydt(11,1) = G_masa*((y(1)-y(5))/r31 + (y(3)-y(5))/r23);
        dydt(12,1) = G_masa*((y(2)-y(6))/r31 + (y(4)-y(6))/r23);
    end 

    function suma = crit(p0, data)
        masa = p0(end);
        [t, y] = ode45(@(tt,yy) odefun(tt,yy,masa), data.t, p0(1:12), ode_opts);

        errors = (data.x1 - y(:, 1)).^2 + (data.y1 - y(:, 2)).^2 + ...
         (data.x2 - y(:, 3)).^2 + (data.y2 - y(:, 4)).^2 + ...
         (data.x3 - y(:, 5)).^2 + (data.y3 - y(:, 6)).^2;

        suma = sum(errors);
    end
    opts = optimset('TolX', 1e-8, 'TolFun', 1e-8, 'MaxFunEvals', 100000, ...
                    'MaxIter', 20000, 'Display', 'none');

    [p, J] = fminsearch(@(p) crit(p, data), p0, opts);

    tspan_2 = time.t;
    [t_wyn, y_wyn] = ode45(@(tt,yy) odefun(tt,yy,p(13)), tspan_2, p(1:12), ode_opts);
    
    labels = {'y_1 w zaleznosci od x_1', 'y_2 w zaleznosci od x_2', 'y_3 w zaleznosci od x_3', 'Interpreter','latex'};
    ll = {'x_i', 'y_i', 'Interpreter','latex'};
    figure('Name', 'Trajektorie', 'NumberTitle', 'off');
    grid on
    plot(y_wyn(:,1), y_wyn(:,2), 'DisplayName', labels{1}); hold on;
    plot(y_wyn(:,3), y_wyn(:,4), 'DisplayName', labels{2});
    plot(y_wyn(:,5), y_wyn(:,6), 'DisplayName', labels{3});
    xlabel(ll{1});
    ylabel(ll{2});
    legend show;
    legend location best;
    %title('Trajektoria x_i w zaleznosci od y_i', 'Interpreter','latex');
    grid on;
    xlim([-1.2 1.2]);
    ylim([-1.2 1.2]);
    axis equal
    set(gcf, 'Color', 'w')

    test_solution_57(y_wyn(:,1), y_wyn(:,2), y_wyn(:,3), y_wyn(:,4), y_wyn(:,5), y_wyn(:,6));

end