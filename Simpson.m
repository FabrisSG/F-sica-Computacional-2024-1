% Definimos la función a integrar
fun = @(x) x.^2;

% Definimos los límites de integración
a = 0; % Lim inf
b = 2; % Lim sup

% Definimos el número de puntos  para la aproximación (debe ser un número par)
n = 100; % Podemos ajustar el numero de puntos

% Calculamos la anchura de cada segmento
h = (b - a) / n;

% Inicializamos la suma de los términos de la regla de Simpson
sumatoria = fun(a) + fun(b);

% Calculamos la suma de los términos pares
for i = 2:2:n-2
    x_i = a + i * h;
    sumatoria = sumatoria + 2 * fun(x_i);
end

% Calculamos la suma de los términos impares
for i = 1:2:n-1
    x_i = a + i * h;
    sumatoria = sumatoria + 4 * fun(x_i);
end

% Aplicamos la regla de Simpson
integral_aproximada = h/3 * sumatoria;

% Resultado
fprintf('La integral aproximada es: %f\n', integral_aproximada);
