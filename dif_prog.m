% Datos de la función
x = [1.2, 1.29, 1.3, 1.31, 1.4];
y = [11.59006, 13.78176, 14.04276, 14.30741, 16.86187];

% Punto en el que queremos calcular la derivada
x0 = 1.2;

% Tamaño del paso
h = 0.01;

% Buscar el índice correspondiente al punto x0 en el arreglo x
idx = find(x == x0);

% Calcular la derivada aproximada con diferencias progresivas de orden 2
if idx >= 3
    f_prime = (-y(idx + 2) + 4*y(idx + 1) - 3*y(idx)) / (2*h);
else
    disp('No hay suficientes puntos para calcular la derivada con diferencias progresivas de orden 2.');
end

% Mostrar el resultado con 4 decimales
fprintf('La derivada en x = %.2f es aproximadamente %.4f\n', x0, f_prime);
