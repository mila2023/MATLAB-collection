function [] = Zadanie3()

hspan1 = linspace(1/1000, 1/10, 50);
hspan2 = linspace(1/10, 8, 100);
hspan = [hspan1, hspan2];

D = zeros(6, length(hspan));

for i = 1:length(hspan)
    h = hspan(i);
    y_jawna_h = Zadanie2jawna(false, h);
    y_njawna_h = Zadanie2niejawna(false, h);
    y_RK_h = Zadanie2RK(false, h);

    [D(1,i), D(2,i)] = delta(h, y_jawna_h);
    [D(3,i), D(4,i)] = delta(h, y_njawna_h);
    [D(5,i), D(6,i)] = delta(h, y_RK_h);
end

figure('Name', 'Zadanie3y1', 'NumberTitle', 'off');
hold on
grid on
styles = {'r', 'b', 'g'};
labels = {
    'Metoda jawna: y_1', 'Metoda njawna: y_1', 'Metoda RK: y_1', 'Interpreter','latex'};

for i = 1:3
    plot(hspan, D(2*i-1, :), styles{i}, 'DisplayName', labels{i});
end
xlabel('h (rozmiar kroku)');
ylabel('błąd');
% title('Porównanie błędu w zależności od kroku i metody dla y1');
xscale log
yscale log
legend('Location', 'best');
hold off


figure('Name', 'Zadanie3y2', 'NumberTitle', 'off');
hold on
grid on
styles = {'r', 'b', 'g'};
labels = {
    'Metoda jawna: y_2', 'Metoda njawna: y_2', 'Metoda RK: y_2', 'Interpreter','latex'};

for i = 1:3
    plot(hspan, D(2*i, :), styles{i}, 'DisplayName', labels{i});
end
xlabel('h (rozmiar kroku)');
ylabel('błąd');
% title('Porównanie błędu w zależności od kroku i metody dla y2');
xscale log
yscale log
legend('Location', 'best');
hold off

end