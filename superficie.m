% Datos
x = [1.2, 1.29, 1.3, 1.31, 1.4];
y = [11.59006, 13.78176, 14.04276, 14.30741, 16.86187];

% Punto en el que deseamos aproximar la derivada
x0 = 1.2;

% Paso h
h = 0.1;

% Buscar el índice correspondiente al punto x0
index = find(x == x0);

% Calcular la aproximación de la derivada con diferencias progresivas de orden 2
if index > 1 && index < (length(x) - 1)
    approx_derivative = (-y(index + 2) + 4 * y(index + 1) - 3 * y(index)) / (2 * h);
    fprintf('Aproximación de la derivada en x = 1.2: %.4f\n', approx_derivative);
else
    fprintf('No se pueden usar diferencias progresivas de orden 2 en el punto dado.\n');
end
