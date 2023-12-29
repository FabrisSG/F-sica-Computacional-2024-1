% Definimos la función a integra
fun = @(x) exp(2*x) .* sin(3*x);

% Definimos los límites de integración
a = 0; % Lim inf
b = 2; % Lim sup

% Definimos el número de puntos para la aproximación
n = 8; % Podemos variar n

% Calculamos la anchura de cada segmento
h = (b - a) / n;

% Inicializamos la suma de los términos de la regla del trapecio
sumatoria = 0;

% Calculamos la suma de los términos
for i = 1:n-1
    x_i = a + i * h;
    sumatoria = sumatoria + fun(x_i);
end

% Aplicar la regla del trapecio
integral_aproximada = h/2 * (fun(a) + 2 * sumatoria + fun(b));

% Mostrar el resultado
fprintf('La integral aproximada es: %f\n', integral_aproximada);
