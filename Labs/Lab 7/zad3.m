function zad3()
clearvars

d1 = 0.4;
dF = 4;
delta_x = 0.04;
delta_t = 0.002;

x = 0:delta_x:10;
t = 0:delta_t:1.3;

d = d1.*(x < 2) + (d1 + (dF - d1)/(2.8 - 2)*(x - 2)).*(x >= 2 & x <= 2.8) + dF.*(x > 2.8);

g = 9.8;
U0 = 1.2;
sigma = 1.5;
x0 = 6;
v0 = sqrt(g*dF);

Ux0 = @(x) U0*exp(-(x - x0).^2/(sigma.^2));
Udt = @(x) U0*exp((-(x - x0 + v0*delta_t).^2)/(sigma.^2));

lenx = length(x);
lent = length(t);

wyn = zeros(lenx, lent);

for i = 1:lenx
    wyn(i,1) = Ux0(delta_x*(i-1));
    wyn(i,2) = Udt(delta_x*(i-1));
end
wyn(1,1:lent) = 0;
wyn(lenx, 1:lent) = 0;

r = g*delta_t*delta_t/(delta_x*delta_x);

for k=2:(lent-1)
    for i=2:(lenx-1)
        wyn(i,k+1) = -1*wyn(i,k-1) + (-2*r*d(i) + 2)*wyn(i,k) ...
            + (1/2*r*d(i+1)+1/2*r*d(i))*wyn(i+1,k) + (r*3/2*d(i)-1/2*r*d(i+1))*wyn(i-1,k);
    end
end

surf(t, x, wyn, 'EdgeColor', 'none')