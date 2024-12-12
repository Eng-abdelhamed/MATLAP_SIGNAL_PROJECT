
t = -1:0.01:6;

x_a = @(t) (t>=0 & t<1)*2 + (t>=1 & t<2)*1 + (t>=2 & t<3).*(t-1) + ...
           (t>=3 & t<4)*2 + (t<0 | t>4)*0;

x_b = @(t) (t>=0 & t<2).*t + (t>=2 & t<3).*(-t+4) + ...
           (t>=3 & t<4).*(-2*t+7) + (t>=4 & t<5).*(t-5) + (t<0 | t>5)*0;
    
x_a_vals = arrayfun(x_a, t); 
x_b_vals = arrayfun(x_b, t);

figure;
subplot(2,1,1);
plot(t, x_a_vals, 'k', 'LineWidth', 1.5);
xlabel('t'); ylabel('x(t)');
title(' x_a(t)');
grid on;

subplot(2,1,2); 
plot(t, x_b_vals, 'k', 'LineWidth', 1.5);
xlabel('t'); ylabel('x(t)');
title(' x_b(t)');
grid on;
