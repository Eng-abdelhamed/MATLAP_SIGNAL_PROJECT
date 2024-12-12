% 2.2 Question 3 Check if time varient or invarient
% Define the time interval
t = -10:0.01:10;  % Time vector with small step size for smooth plots
t0 = 2;           % Delay value

% Define the input signal x(t)
x_t = cos(10 * pi * t);  % Example signal

% Compute the system output for x(t)
y_t = 5 * x_t + 2;

% Define the delayed input signal x(t-t0)
x_delayed = cos(10 * pi * (t - t0));

% Compute the system output for the delayed input
y_delayed_input = 5 * x_delayed + 2;

% Compute the delayed output y(t-t0)
y_delayed_output = circshift(y_t, round(t0 / 0.01));  % Approximate delay in indices

% Correct for edge effects due to circshift (optional, for perfect accuracy)
if t0 > 0
    y_delayed_output(1:round(t0 / 0.01)) = NaN;  % Mark invalid shifted values as NaN
else
    y_delayed_output(end+round(t0 / 0.01):end) = NaN;
end

% Check for time invariance
difference = y_delayed_input - y_delayed_output;
threshold = 1e-5;  % Tolerance for numerical differences
if all(abs(difference(~isnan(difference))) < threshold)
    result = 'The system is Time-Invariant';
else
    result = 'The system is NOT Time-Invariant';
end

% Display the result
disp(result);

% Plot the results
figure;

subplot(2, 1, 1);
plot(t, y_delayed_input, 'b', 'LineWidth', 1.5);
hold on;
plot(t, y_delayed_output, 'r--', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('Output');
legend('y_{delayed\_input}(t)', 'y_{delayed\_output}(t)');
title(['Testing Time Invariance: ', result]);
grid on;

subplot(2, 1, 2);
plot(t, difference, 'k', 'LineWidth', 1.5);
xlabel('Time (t)');
ylabel('Difference');
title('Difference Between Outputs');
grid on;

