% Definimos la función a derivar
f = @(x) cos(x); % Aquí podemos poner la función de interés, en este ejemplo elejí el coseno

% Definimos el intervalo [a, b] y el número de puntos
a = 0;
b = 2*pi; % Intervalo de 0 a 2*pi
n = 100;  % Número de puntos equidistantes

% Paso de incremento h
h = (b - a) / (n - 1);

% Inicialización de vectores para almacenar los puntos y las derivadas
x = linspace(a, b, n); % Vector de puntos equidistantes
df_forward = zeros(1, n); % Vector para la derivada calculada

% Cálculo de la derivada usando diferencia hacia adelante
for i = 1:n-1
    df_forward(i) = (f(x(i + 1)) - f(x(i))) / h;
end

% El último punto se calcula de forma especial para evitar un índice fuera de rango
df_forward(n) = (f(x(n)) - f(x(n - 1))) / h;

% Gráfica de la función original y su derivada
figure;
subplot(2,1,1);
plot(x, f(x), 'b-', 'LineWidth', 2);
title('Función Original');
xlabel('x');
ylabel('f(x)');

subplot(2,1,2);
plot(x, df_forward, 'r-', 'LineWidth', 2);
title('Derivada Numérica (Diferencia hacia adelante)');
xlabel('x');
ylabel('f(x)');

% Mostramos la derivada en un punto específico
x0 = 1.0; % Punto en el que se calcula la derivada
index_x0 = find(x == x0); % Se encuentra el índice correspondiente
disp(['Derivada en x = ', num2str(x0), ': ', num2str(df_forward(index_x0))]);
