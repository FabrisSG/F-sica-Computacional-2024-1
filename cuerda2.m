% Parámetros iniciales
L = 1;              % Longitud de la cuerda
c = 1/pi;           % Velocidad de la onda
T = 2;              % Tiempo total
Nx = 100;           % Número de puntos en el espacio
Nt = 1000;          % Número de pasos en el tiempo

% Espaciado en el espacio y el tiempo
dx = L / Nx;
dt = T / Nt;

% Vector de posiciones
x = linspace(0, L, Nx+1);

% Inicialización de la matriz de solución
u = zeros(Nx+1, Nt+1);

% Condición inicial con la forma triangular
for i = 1:Nx+1
    if x(i) >= 0 && x(i) < 1/3
        u(i, 1) = (3 * x(i)) / 10;
    elseif x(i) >= 1/3 && x(i) <= 1
        u(i, 1) = (3 * (1 - x(i))) / 20;
    end
end

% Inicialización de la columna n-1
u(:, 2) = u(:, 1);

% Implementación del método de diferencias finitas
for n = 2:Nt
    for i = 2:Nx
        u(i, n+1) = 2 * (1 - c^2) * u(i, n) - u(i, n-1) + c^2 * (u(i+1, n) + u(i-1, n));
    end
end

% Solución exacta
u_exacta = zeros(Nx+1, Nt+1);
for n = 1:Nt
    for i = 1:Nx+1
        sum = 0;
        for m = 1:10  % Sumar un número finito de términos de la serie
            sum = sum + (9 / (10 * pi)) * (sin(m * pi / 3) / (m^2)) * sin(m * pi * x(i)) * cos(m * pi * c * n * dt);
        end
        u_exacta(i, n+1) = sum;
    end
end

% Graficar la solución numérica y la solución exacta en función del tiempo
figure;
for n = 1:20:Nt
    plot(x, u(:, n), 'b', 'LineWidth', 1.5);    % Solución numérica
    hold on;
    plot(x, u_exacta(:, n), 'r--', 'LineWidth', 1.5);    % Solución exacta
    axis([0 L -0.1 0.1]);
    xlabel('Posición (x)');
    ylabel('Amplitud (u)');
    title(['Tiempo t = ', num2str(n * dt)]);
    legend('Numérica', 'Exacta');
    pause(0.1);
    hold off;
end
