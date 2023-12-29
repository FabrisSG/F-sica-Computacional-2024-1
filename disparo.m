function shooting_method_BVP_N10()
    % Definir el rango y las condiciones iniciales
    a = 1;
    b = 2;
    A = 1; % Condición inicial en a
    B = 2; % Condición inicial en b
    n = 10; % Número de pasos de integración
    h = (b - a) / n; % Tamaño del paso

    % Función f(x, y, y')
    f = @(x, y, yp) -(2/x) * yp + (2/x^2) * y + (sin(log(x)) / x^2);

    % Inicialización
    x = a;
    y = A;
    yp_guess = 1; % Supongamos un valor inicial para y'
    delta = 1e-6; % Tolerancia para la convergencia
    max_iterations = 100;

    % Método de disparo lineal con RK4
    for iteration = 1:max_iterations
        x_values = zeros(1, n + 1);
        y_values = zeros(1, n + 1);

        for i = 1:n+1
            x_values(i) = x;
            y_values(i) = y;
            
            k1 = h * yp_guess;
            l1 = h * f(x, y, yp_guess);
            
            k2 = h * (yp_guess + 0.5 * l1);
            l2 = h * f(x + 0.5 * h, y + 0.5 * k1, yp_guess + 0.5 * l1);
            
            k3 = h * (yp_guess + 0.5 * l2);
            l3 = h * f(x + 0.5 * h, y + 0.5 * k2, yp_guess + 0.5 * l2);
            
            k4 = h * (yp_guess + l3);
            l4 = h * f(x + h, y + k3, yp_guess + l3);
            
            y = y + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
            x = x + h;
        end

        % Verificar si y(b) se acerca lo suficiente a B
        if abs(y - B) < delta
            fprintf('Convergencia alcanzada en %d iteraciones\n', iteration);
            break;
        else
            % Ajustar el valor de yp_guess usando el método de la secante
            yp_guess = yp_guess - ((y - B) / (y_values(n + 1) - y_values(n))) * (yp_guess - y_values(n));
        end
    end

    % Solución exacta
    c1 = 2;
    c2 = 3;
    x_exact = a:h:b;
    y_exact = c1 * x_exact ./ x_exact + (c2 ./ x_exact) - (3/10) * sin(log(x_exact)) - (1/10) * cos(log(x_exact));

    % Graficar la solución
    figure;
    plot(x_values, y_values, 'b-', x_exact, y_exact, 'r--');
    xlabel('x');
    ylabel('y');
    title('Solución de BVP utilizando el método de disparo lineal con RK4 (N=10)');
    legend('Aproximación', 'Solución Exacta');

    % Imprimir la solución
    disp('Aproximación de la solución:');
    disp(y_values);

    disp('Solución Exacta:');
    disp(y_exact);
end

