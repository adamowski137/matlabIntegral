function [] = test2(n)
if ~exist('n','var')
    n = 100;
end

start = "Test 2 \nTest ten sprawdza wyniki metody " + ...
    "dla funkcji o całkach rozbieżnych.\n";
fprintf(start);
pause;

amount = 4;
f = cell(1, amount);
f(1) = {@(x,y)(exp(1/x))};
f(2) = {@(x,y)(2^(1/x)+7^(1/y))};
f(3) = {@(x,y)(tan(1/x) + tan(1/y))};
f(4) = {@(x,y)(cos(1/x))};
fprintf("================================================================\n");
fprintf("│f(x,y)%*s│wynik%*s│czas%*s│\n", 24,"", 10,"", 9,"");
fprintf("================================================================\n");
for i=1:amount
    tic;
    val = P1Z56_AZ_triangInt(f{i}, n);
    t = toc;
    fprintf("│%-30s│%-15d│%ds│ \n", char(f{i}), val, t);
    fprintf("----------------------------------------------------------------\n");
    pause;
end

end

