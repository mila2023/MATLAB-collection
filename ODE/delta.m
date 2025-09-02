function [d1, d2] = delta(h, y_dasz)

t = 0:h:8;

sum_y1 = 0;
sum_y2 = 0;
sum_roz_y1 = 0;
sum_roz_y2 = 0;
[y1n, y2n] = Zadanie1(false);

for i = 1:length(y_dasz)
    sum_y1 = sum_y1 + y1n(t(i))*y1n(t(i));
    sum_y2 = sum_y2 + y2n(t(i))*y2n(t(i));
    sum_roz_y1 = sum_roz_y1 + (y_dasz(1,i)-y1n(t(i)))^2;
    sum_roz_y2 = sum_roz_y2 + (y_dasz(2,i)-y2n(t(i)))^2;
end
d1 = sum_roz_y1/sum_y1;
d2 = sum_roz_y2/sum_y2;

end