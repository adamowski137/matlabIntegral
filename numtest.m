function [] = numtest(n)
if ~exist('n','var')
    n = 100;
end
amount = 2;
f = cell(1, amount);
f(1) = {@(x,y)(10000000+0*x)};
f(2) = {@(x,y)(x.^2 .* y.^2)};

val2= zeros(1,amount);
err= zeros(1,amount);

val2(1) = 20000000;
val2(2) = 19/45;

fprintf("=================================================================\n");
fprintf("│f(x,y)%*s│wynik%*s│błąd%*s│\n", 24,"", 10,"",10,"");
fprintf("=================================================================\n");

for i=1:amount
    val = P1Z56_AZ_triangInt(f{i}, n);
    err(i) = abs(val - val2(i));
    fprintf("│%-30s│%-15d│%-14d│\n", char(f{i}), val, err(i));
    fprintf("-----------------------------------------------------------------\n");
end
end

