function [] = test2(n)
if ~exist('n','var')
    n = 100;
end

start = "Test 2 \nTest ten sprawdza wyniki metody " + ...
    "dla funkcji o bardzo dużych całkach lub " + ...
    "o całkach rozbieżnych.\n";
fprintf(start);
pause;

amount = 4;
f = cell(1, amount);
f(1) = {@(x,y)(10000000)};
f(2) = {@(x,y)((10*x)^8+(12*y)^6)};
f(3) = {@(x,y)(exp(1/x))};
f(4) = {@(x,y)(abs(10*x)^(1/y))};
for i=1:amount
    tic;
    val = triang(f{i}, n);
    t = toc;
    fprintf("Funkcja %d. f(x,y) = %-30s wynik = %-15d czas: %ds \n", i, char(f{i}), val, t);
    pause;
end

end

