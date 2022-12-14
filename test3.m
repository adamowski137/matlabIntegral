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
    f = @(x,y)(x.^2*y.^2);
end

start = "Test 3 \nTest ten sprawdza wyniki metody dla funkcji f(x,y)=%s" + ...
    "\ndla różnych ilości trójkątów \n" ;
fprintf(start, char(f));
pause;
valReal = 19/45;
x = min:step:max;
x = x';
err = zeros(length(x), 1);
val = zeros(length(x), 1);
t = zeros(length(x), 1);

i = 1;
stopI = 20;

fprintf("========================================================\n");
fprintf("│n%*s│wynik%*s│błąd%*s│czas%*s│\n", 4,"", 10,"", 10,"", 10,"");
fprintf("========================================================\n");
for n  = min:step:max
    tic;
    val(i) = P1Z56_AZ_triangInt(f, n);
    t(i) = toc;
    err(i) = abs(valReal - val(i));
    fprintf("│%-5d│%-15d│%-14d│%-13ds│\n", n, val(i), err(i), t(i));
    fprintf("--------------------------------------------------------\n");
    i = i + 1;
    if mod(i,stopI) == 0
        pause;
    end
end
figure(1);
semilogy(x,err);
axis([min max -inf inf]);
xlabel("wartość współczynnika n");
ylabel("bezwzględny błąd całki");
title("Zmiana błędu całki w zależności od ilości trójkątów");