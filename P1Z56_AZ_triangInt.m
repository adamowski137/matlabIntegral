function res = P1Z56_AZ_triangInt(f, n)
% Projekt 1, zadanie 56
% Adam Żyliński, 320755
%
% Obliczanie całek podwójnych funkcji dwóch zmiennych
% za pomocą metody trójkątów 3 rzędu
% Wejście:
% f - uchwyt do funkcji którą będziemy całkować
% n - współczynnik podziału obaszaru całkowania. Zadany obszar zostanie
% podzielony na 4*n^2przystających trójkątów.
% Wyjście:
% res - wynik całkowania
%

% ustawiamy wynik całkowania na 0
res = 0;

% tworzymy trójkąty na których będziemy całkować
D = createArea(n);

% liczymy pole każdego trójkąta
P = 1/(2*n^2);

% iteracja po trójkątach
for i = 1:4*n^2
    % wyznaczamy potrzebne punkty
    p12 = 0.5*[D(i,1,1) + D(i,1,2), D(i,2,1) + D(i,2,2)];
    p23 = 0.5*[D(i,1,2) + D(i,1,3), D(i,2,2) + D(i,2,3)];
    p13 = 0.5*[D(i,1,1) + D(i,1,3), D(i,2,1) + D(i,2,3)];
    %wstawiamy do wzoru i zwiększamy wynik całkowania
    res = res + P/3 * (f(p12(1),p12(2)) + f(p13(1),p13(2)) + f(p23(1),p23(2)));
end


