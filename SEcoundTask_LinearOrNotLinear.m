t = linspace(-10, 10);
%Two Test signals
x1T = cos(10*pi*t);
x2T = exp(-0.5*t);

% two Scalar 
a1 = 2;
a2 = 3;

% anonymous function
H = @(x) 5*x + 2;

% yExpected and X Expected
yexp = a1 * H(x1T) + a2 * H(x2T);
yact = H(a1 * x1T + a2 * x2T);

% the expected Output
figure;
subplot(2, 1, 1);
plot(t, yexp, 'g', 'LineWidth', 1.5);
xlabel('time'); 
ylabel('expected(t)');
title('Expected Figure');
grid on;

% the Acutal Output
subplot(2, 1, 2);
plot(t, yact, 'b', 'LineWidth', 1.5);
xlabel('time'); ylabel('actual(t)');
title('Actual Figure');
grid on;

if isequal(round(yexp, 5), round(yact, 5))
    disp('The system is linear.');
    disp(yexp)
else
    disp('The system is not linear.');
    disp('y expected')
    disp(yexp)
     disp('y Actual')
    disp(yact)
end