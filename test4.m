function [] = test4(f, k, n)
if ~exist('f','var')
    f = @(x,y)(cos(0.983*x*y));
end
if ~exist('n','var')
    n = 10;
end
if ~exist('k','var')
    k = 50;
end
start = "Test 5 \nTest ten sprawdza wyniki metody " + ...
    "dla złożen danej funkcji.\n";
fprintf(start);

fprintf("================================================================\n");
fprintf("│ilość złożeń%*s│wynik%*s│czas%*ss│\n", 0,"", 10,"", 9,"");
fprintf("================================================================\n");
x = 1:k;
val = zeros(1, k);
g = f;
for i = 1:k
    tic;
    val(i) = P1Z56_AZ_triangInt(g,n);
    t = toc;
    fprintf("│%-12d│%-15d│%ds│ \n", i, val(i), t);
    fprintf("----------------------------------------------------------------\n");
    g = @(x,y)g(f(x,y),f(x,y));
end
figure(1);
plot(x,val);

