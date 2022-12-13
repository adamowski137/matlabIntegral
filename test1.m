
function [] = test1(n)
if ~exist('n','var')
    n = 100;
end

start = "Test 1 \nTest ten sprawdza wyniki metody dla całek wynoszących 0\n";
fprintf(start);
pause;

amount = 5;
f = cell(1, amount);
f(1) = {@(x,y)(x + y)};
f(2) = {@(x,y)(x.^3 + 10.*y)};
f(3) = {@(x,y)(10*sin(x)*cos(7*y))};
f(4) = {@(x,y)(tan(x*y))};
f(5) = {@(x,y)(sign(x))};

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