function D = createArea(n)
% Projekt 1, zadanie 56
% Adam Żyliński, 320755
% Wejście:
% n - współczynnik podziału obaszaru całkowania. Zadany obszar zostanie
% podzielony na 4*n^2przystających trójkątów.
% Wyjście:
% D - macierz zawierająca punkty gdzie znajdują sie wierzcholki trójkątów.
% dim A = (4*n^2, 2, 3)

% tworzymy iterator
k = 1;
% deklarujemy macierz wynikową
D = zeros(4*n^2,2,3);
% wyznaczenie wierzchołków dla 3 ćwiartki
for i = 0 : n-1
    for j = 0:n-2 - i
        % w poniższym bloku wypełniamy pierwszą część obszaru 
        % kolumną kwadratów złożonych z 2 trójkątów przystających 
        px1 = [-1+(i/n), -1+i/n, -1+((i+1)/n)];
        py1 = [-1+(j/n), -1+((j+1)/n), -1+(j/n)];
        px2 = [-1+((i+1)/n), -1+i/n, -1+((i+1)/n)];
        py2 = [-1+((j+1)/n), -1+((j+1)/n), -1+(j/n)];
        % wpisujemy ich wierzchołki do macierzy
        D(k,1,:) = px1;
        D(k,2,:) = py1;
        k = k+1;
        D(k,1,:) = px2;
        D(k,2,:) = py2;
        k = k+1;
    end
    % na koniec dodajemy trójkąt na górę kolumny 
    px = [-1+i/n, -1+i/n, -1 + 1/n + i/n];
    py = [ 0-i/n, -1/n-i/n, -1/n-i/n];
    % wpisujemy jego wierzchołki do macierzy
    D(k,1,:) = px;
    D(k,2,:) = py;
    k = k+1;
end
% wyznaczamy wierzchołków dla 1 ćwiartki poprzez symetrię całkowitą wokół
% osi x i y;
for i = 1:n*n
   px = -D(i,1,:);
   py = -D(i,2,:);
   D(k,1,:) = px;
   D(k,2,:) = py;
   k = k +1;
end
% wyznaczamy wierzchołków dla 4 ćwiartki poprzez symetrię całkowitą wokół
% osi x 
for i = 1:n*n
   px = -D(i,1,:);
   py = D(i,2,:);
   D(k,1,:) = px;
   D(k,2,:) = py;
   k = k +1;
end
% wyznaczenie wierzchołków dla 1 ćwiartki poprzez symetrię całkowitą wokół
% osi y
for i = 1:n*n
   px = D(i,1,:);
   py = -D(i,2,:);
   D(k,1,:) = px;
   D(k,2,:) = py;
   k = k +1;
end

end

