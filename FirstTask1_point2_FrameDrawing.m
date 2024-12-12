% Define time interval
t = linspace(0, 2*pi, 1000); % Fine resolution for smooth plot

% Define the signal
x_t = cos(t) + sin(3*t);

% Plot the signal
figure;
plot(t, x_t, 'k', 'LineWidth', 1.5);
xlabel('t');
ylabel('x(t)');
title('Signal x(t) = cos(t) + sin(3t)');
grid on;
