function [] = numtest(n)
if ~exist('n','var')
    n = 100;
end
amount = 5;
f = cell(1, amount);
f(1) = {@(x,y)(10000000+0*x)};
f(2) = {@(x,y)((10.*x).^8+(12.*y).^6)};
f(3) = {@(x,y)(x.^2 + y.^2)};
f(4) = {@(x,y)(x.^10.*y.^8 + y.^10)};
f(5) = {@(x,y)cos(x.*y)+10.*x.^2 + 8.*y.^4+12.^x};

for i=1:amount
    disp(f(i));
    val = triang(f{i}, n);
    val2 = integral2(f{i}, -1, 1, @(x)(-abs(x)+1), 1) + integral2(f{i}, -1, 1, -1, @(x)(abs(x)-1));
    disp("trinag value");
    disp(val);
    disp("integral value");
    disp(val2);
    disp("error");
    disp(val - val2);
    disp("relative error");
    disp((val - val2)/val2);
end
end

