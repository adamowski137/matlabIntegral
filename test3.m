function [] = test3(min, max, step, f)
if ~exist('min','var')
    min = 1;
end
if ~exist('max','var')
    max = 101;
end
if ~exist('step','var')
    step = 10;
end
if ~exist('f','var')
    f = @(x,y)(cos(x*y)+10*x^2 + 8*y^4+12^x);
end

start = "Test 3 \nTest ten sprawdza wyniki metody dla zadanej funkcji" + ...
    "\n dla różnych ilości trójkątów \n" ;
fprintf(start);
pause;
valprev = 0;
x = min:step:max;
err = zeros(1, length(x));
i = 1;
for n  = min:step:max
    tic;
    val = triang(f, n);
    t = toc;
    err(i) = abs(valprev - val);
    fprintf("f(x,y) = %-30s n = %-10d wynik = %-15d zmiana = %-15d czas: %ds \n", char(f), n, val, err(i), t);
    valprev = val;
    i = i + 1;
    pause;
end

figure(1);
semilogy(x,err);
axis([min max -inf inf]);
