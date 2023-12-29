% Parámetros
L = 10; % Tamaño del dominio
N = 1000; % Número de puntos de muestreo
dx = L / (N - 1); % Espaciado entre puntos

% Crear una matriz para representar el dominio espacial
x = linspace(-L/2, L/2, N);

% Definir el potencial del oscilador armónico cuántico
V = 0.5 * x.^2;

% Definir el operador Laplaciano en diferencias finitas de 4to orden
A = (1 / dx^2) * (-2 * diag(ones(N, 1)) + diag(ones(N-1, 1), 1) + diag(ones(N-1, 1), -1) - 0.5 * diag(ones(N-2, 1), 2) - 0.5 * diag(ones(N-2, 1), -2));

% Resolución de la ecuación de Schrödinger
H = -0.5 * A + diag(V); % Hamiltoniano
[E, psi] = eig(H); % Autovalores y autofunciones

% Graficar funciones pares e impares
figure;
for i = 1:3
    subplot(2, 3, i);
    plot(x, psi(:, i));
    title(['Función par, E_', num2str(i) ' = ', num2str(E(i, i))]);
    
    subplot(2, 3, i + 3);
    plot(x, psi(:, N - i + 1));
    title(['Función impar, E_', num2str(N - i + 1) ' = ', num2str(E(N - i + 1, N - i + 1))]);
end

% Ajustar los límites de las subtramas
for i = 1:6
    subplot(2, 3, i);
    axis([-L/2, L/2, -max(abs(psi(:, i))), max(abs(psi(:, i)))]);
end
