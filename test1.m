function [] = test1(n)
if ~exist('n','var')
    n = 100;
end

start = "Test 1 \nTest ten sprawdza czy dla różnych funkcji " + ...
    "nie parzystych, czyli takich że f(x,y) = -f(-x,-y),\nCałka " + ...
    "po zadanym obszarze wynosi zero.\n";
fprintf(start);
pause;

amount = 5;
f = cell(1, amount);
f(1) = {@(x,y)(x + y)};
f(2) = {@(x,y)(x.^3 + 10.*y)};
f(3) = {@(x,y)(10*sin(x)*cos(7*y))};
f(4) = {@(x,y)(tan(x*y))};
f(5) = {@(x,y)(sign(x))};

for i=1:amount
    tic;
    val = triang(f{i}, n);
    t = toc;
    fprintf("Funkcja %d. f(x,y) = %-30s wynik = %-15d czas: %ds \n", i, char(f{i}), val, t);
    pause;
end