function [] = zadanie1()

t = linspace(0, 2, 100)*pi;

x1 = sin(t);
x2 = cos(2*t);
a = 1;
b = 2;

figure(1)
subplot(2,2,1)
hold on
title("f1")
plot(t, a*f1(x1)+b*f1(x2), "--")
plot(t, f1(a*x1 + b*x2))
hold off

subplot(2,2,2)
hold on
title("f2")
plot(t, a*f2(x1)+b*f2(x2))
plot(t, f2(a*x1 + b*x2), '--')
hold off

c = 0.1;
d = 0.2;

subplot(2,2,3)
hold on
title("f3")
plot(t, c*f1(x1)+d*f1(x2))
plot(t, f1(c*x1 + d*x2), "--")
hold off

subplot(2,2,4)
hold on
title("f4")
plot(t, c*f2(x1)+d*f2(x2))
plot(t, f2(c*x1 + d*x2), "--")
hold off