function [] = test5(k, n)
if ~exist('n','var')
    n = 10;
end
if ~exist('k','var')
    k = 100;
end
start = "Test 5 \nTest ten sprawdza wyniki metody " + ...
    "dla złożen danej funkcji.\n";
fprintf(start);
l = 100;
fprintf("================================================================\n");
fprintf("│i%*s│a%*s│wynik%*s│\n", 3,"", 11,"", 10,"");
fprintf("================================================================\n");
final = zeros(1, l);
a = linspace(0,1,l);
for j = 1:l
    f = @(x,y)(cos(a(j)*x*y));
    %f2 = @(x,y)(a(j)*cos(x*y));
    g = f;
    for i = 1:k
        g = @(x,y)g(f(x,y),f(x,y));
    end
    final(j) = P1Z56_AZ_triangInt(g,n);
    fprintf("│%-4d│%-12d│%-15d│\n", j, a(j), final(j));
    fprintf("----------------------------------------------------------------\n");
    if mod(j,20) == 0
%         pause;
    end
end
figure(1);
plot(a,final);
xlabel("wartość współczynnika a");
ylabel("wynik całki");
title("Zmiana wyniku całki f(x,y)=cos(axy) w zależności od współczynnika a");
