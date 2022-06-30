% Euler's Method for y'(x) = x^2 - y^2 with initial conditions: y(0) = 1 and step size h = 0.01
pkg load symbolic;
clear all;
close all;
clc;
warning('off', 'all');

h = 0.01;
j = 100;

% Initial conditions
fxy = @(x, y)(x^2 - y^2);
x0 = 0;
y0 = 1;

% Tabulating the initial values
X(1) = x0;
Y(1) = y0;

for i = 2:j
    Y(i) = Y(i - 1) + (feval(fxy, X(i - 1), Y(i - 1)) * h);
    X(i) = X(i - 1) + h;
endfor

% Graphing the exact and approximate solutions
figure(1);
[x, y] = ode45(fxy, [0:h:1], y0);
plot(x, y, 'g-');
hold on;
plot(X, Y, 'r--');
xlabel("x");
ylabel("y(x)");
title("Using Euler's method to solve y' = x^2 - y^2");
legend("Exact solution", "Approximate solution (Euler's)");
grid on;
