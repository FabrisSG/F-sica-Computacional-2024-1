% Definimos la función a integrar
fun = @(x) x.^2;

% Definimos los límites de integración
a = 0; % Lim inf
b = 2; % Lim sup

% Definimos el número de puntos de evaluación y los pesos para la cuadratura Gaussiana
% Estos valores son específicos para diferentes reglas de cuadratura Gaussiana
n = 4; % Podemos variar la n
if n == 2
    % Cuadratura Gaussiana de 2 puntos (Regla de Legendre)
    x = [-1/sqrt(3), 1/sqrt(3)];
    w = [1, 1];
elseif n == 3
    % Cuadratura Gaussiana de 3 puntos (Regla de Legendre)
    x = [-sqrt(3/5), 0, sqrt(3/5)];
    w = [5/9, 8/9, 5/9];
elseif n == 4
    % Cuadratura Gaussiana de 4 puntos (Regla de Legendre)
    x = [-0.861136, -0.339981, 0.339981, 0.861136];
    w = [0.347855, 0.652145, 0.652145, 0.347855];
else
    error('No se ha definido una regla de cuadratura Gaussiana para n especificado.');
end

% Calculamos la integral aproximada utilizando la cuadratura Gaussiana
integral_aproximada = 0;
for i = 1:n
    integral_aproximada = integral_aproximada + w(i) * fun(0.5 * (b - a) * x(i) + 0.5 * (a + b));
end

% Ajustamos el resultado al intervalo de integración [a, b]
integral_aproximada = integral_aproximada * 0.5 * (b - a);

% resultado
fprintf('La integral aproximada es: %f\n', integral_aproximada);
