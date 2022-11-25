function area = Area(x,y)
% Projekt 1, zadanie 56
% Adam Żyliński, 320755
% Wejście:
% x - wektor współrzędnych x wierzchołków trójkąta
% y - wektor współrzędnych y wierzchołków trójkąta
% Wyjście:
% area - pole trójkąta
%

% tworzymy zmienne pomocnicze
xx = zeros(1, 3);
yy = zeros(1, 3);

% konwertujemy je aby zgadzały się wymiary
xx(:) = x(1,1,:);
yy(:) = y(1,1,:);

% obliczmy pole trójkąta
A = [1,1,1;xx;yy];
area = 0.5 * abs(det(A)); 

end

