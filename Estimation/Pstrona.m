function wyn = Pstrona(m, x, y)

    function rwyn = rcount(j, k)
        rwyn = (sqrt((x(k)-x(j))^2 + (y(k)-y(j))^2))^3;
    end

    r12 = rcount(1,2);
    r31 = rcount(3,1);
    r23 = rcount(2,3);

    wyn = zeros(1, 6);
    G = 1;

    wyn(1) = G*m*(x(2)-x(1))/r12 + G*m*(x(3)-x(1))/r31;
    wyn(2) = G*m*(y(2)-y(1))/r12 + G*m*(y(3)-y(1))/r31;
    wyn(3) = G*m*(x(3)-x(2))/r23 + G*m*(x(1)-x(2))/r12;
    wyn(4) = G*m*(y(3)-y(2))/r23 + G*m*(y(1)-y(2))/r12;
    wyn(5) = G*m*(x(1)-x(3))/r31 + G*m*(x(2)-x(3))/r23;
    wyn(6) = G*m*(y(1)-y(3))/r31 + G*m*(y(2)-y(3))/r23;

end