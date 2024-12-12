% Define time intervals
t = linspace(0, 2*pi, 1000);    % Time interval for one period
t2 = linspace(0, 4*pi, 2000);   % Extended time interval (two periods)

% Define the signals
x_t  = cos(t) + sin(3*t);       % Signal for one period
x2_t = cos(t2) + sin(3*t2);     % Signal for extended time interval

% Create figure for simulation
figure;
hold on;

% Plot the full signal for reference (static background)
plot(t2, x2_t, 'k--', 'LineWidth', 0.5, 'DisplayName', 'Full Signal');
legend;
grid on;
xlabel('t');
ylabel('x(t)');
title('Simulation: Signal Periodicity');
ylim([-2, 2]);

% Simulate periodicity dynamically
h_period = plot(NaN, NaN, 'b', 'LineWidth', 1.5); % Placeholder for periodic signal

for k = 0:2
    % Dynamically update one period of the signal
    current_t = t + k*2*pi; % Shift time for each period
    current_x = cos(current_t) + sin(3*current_t);
    set(h_period, 'XData', current_t, 'YData', current_x);
    
    % Add periodicity message for the first period
    if k == 1
        text(2*pi, 1.5, 'The signal is periodic!', 'FontSize', 12, ...
             'HorizontalAlignment', 'center', 'Color', 'green');
    end
    
    % Pause for visualization
    pause(1.5);
end

% Final message to console
disp('The signal x(t) is periodic. The period is 2*pi.');
