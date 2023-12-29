% Definición de la función
f = @(x) exp(-x.^2);

% Límite superior de integración
a = 1.5;

% Número de trapecios
n = 10;

% Valores iniciales
x0 = 0;
x1 = a;

% Calcula la suma de áreas de los trapecios
approx_integral = 0;
h = (x1 - x0) / n;
for i = 1:n
    approx_integral = approx_integral + (f(x0) + f(x1)) / 2;
    x0 = x1;
    x1 = x0 + h;
end

approx_integral = h * approx_integral;

% Calcula el valor real de erf(1.5)
real_integral = 2/sqrt(pi) * integral(f, 0, a);

% Calcula el error porcentual
error_percent = 100 * abs(approx_integral - real_integral) / real_integral;

% Muestra los resultados
fprintf('Valor aproximado de erf(1.5): %.6f\n', approx_integral);
fprintf('Valor real de erf(1.5): %.6f\n', real_integral);
fprintf('Error verdadero porcentual: %.6f%%\n', error_percent);
