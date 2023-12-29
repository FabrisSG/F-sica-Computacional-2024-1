% Parámetros
t0 = 0;      % Valor inicial de t
tf = 2;      % Valor final de t
h = 0.1;     % Tamaño del paso
Y0 = 0.5;    % Condición inicial
n = (tf - t0) / h;  % Número de pasos

% Inicialización de vectores
t = zeros(1, n + 1);
Y2 = zeros(1, n + 1);
Y4 = zeros(1, n + 1);

% Establecemos valores iniciales
t(1) = t0;
Y2(1) = Y0;
Y4(1) = Y0;

% Método de Taylor de orden 2
for i = 1:n
    t(i + 1) = t(i) + h;
    Y2(i + 1) = Y2(i) + h * (Y2(i) - t(i)^2 + 1);
    Y2(i + 1) = Y2(i + 1) + (h^2 / 2) * (Y2(i) - t(i)^2 + 1 - 2 * t(i) * (Y2(i) - t(i)^2 + 1));
end

% Método de Taylor de orden 4
for i = 1:n
    t(i + 1) = t(i) + h;
    Y4(i + 1) = Y4(i) + h * (Y4(i) - t(i)^2 + 1);
    Y4(i + 1) = Y4(i + 1) + (h^2 / 2) * (Y4(i) - t(i)^2 + 1 - 2 * t(i) * (Y4(i) - t(i)^2 + 1));
    Y4(i + 1) = Y4(i + 1) + (h^3 / 6) * (Y4(i) - t(i)^2 + 1 - 2 * t(i) * (Y4(i) - t(i)^2 + 1) - 2 * (Y4(i) - t(i)^2 + 1));
    Y4(i + 1) = Y4(i + 1) + (h^4 / 24) * (Y4(i) - t(i)^2 + 1 - 2 * t(i) * (Y4(i) - t(i)^2 + 1) - 2 * (Y4(i) - t(i)^2 + 1) - 6 * t(i)^2 * (Y4(i) - t(i)^2 + 1));
end

% Graficamos las soluciones
plot(t, Y2, '-o', 'DisplayName', 'Orden 2');
hold on;
plot(t, Y4, '-s', 'DisplayName', 'Orden 4');
xlabel('t');
ylabel('Y(t)');
title('Solución de dy/dt = Y - t^2 + 1');
legend('Location', 'Northwest');
grid on;
