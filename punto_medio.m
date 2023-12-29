% Parámetros del sistema
k = 2;
x0 = 0.3;
theta0 = 0.1;
x_dot0 = 0;
theta_dot0 = 0;

% Intervalo de tiempo
tspan = [0 10];

% Número de pasos de tiempo
N = 1000;
h = (tspan(2) - tspan(1)) / N;

% Vectores para almacenar las soluciones
t = zeros(1, N+1);
x = zeros(1, N+1);
theta = zeros(1, N+1);

% Condiciones iniciales
t(1) = tspan(1);
x(1) = x0;
theta(1) = theta0;

% Método de Heun
for i = 1:N
    t(i+1) = t(i) + h;
    x(i+1) = x(i) + h * x_dot0;
    theta(i+1) = theta(i) + h * theta_dot0;
    
    x_dot = (x(i) + 1) * theta_dot0 + sin(theta(i));
    theta_dot = (1 + x(i)) * theta(i)^2 - k * x(i) - cos(theta(i));
    
    x(i+1) = x(i) + (h / 2) * (x_dot0 + x_dot);
    theta(i+1) = theta(i) + (h / 2) * (theta_dot0 + theta_dot);
    
    x_dot0 = x_dot;
    theta_dot0 = theta_dot;
end

% Graficar resultados
figure;

subplot(3,1,1);
plot(t, x, 'r', 'LineWidth', 2);
xlabel('Tiempo (t)');
ylabel('x(t)');
title('x(t) vs t');

subplot(3,1,2);
plot(t, theta, 'g', 'LineWidth', 2);
xlabel('Tiempo (t)');
ylabel('θ(t)');
title('θ(t) vs t');

subplot(3,1,3);
plot(x, theta, 'b', 'LineWidth', 2);
xlabel('x(t)');
ylabel('θ(t)');
title('x(t) vs θ(t)');

sgtitle('Solución del sistema de ecuaciones diferenciales');


