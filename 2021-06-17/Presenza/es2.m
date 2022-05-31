clc
clear all

% punto a)
syms a

p = 10^5;
q = 10.^(-[0:10]);

sol = @(x) -p + sqrt(p^2 + q);

dsol = @(x) 1./(2 * sqrt(p^2 + x));

K = abs(dsol(q)) .* abs(q) ./ abs(sol(q));

% punto b)
f = @(x) x^2 + 2*p*x - q;
df = @(x) 2*x + 2*p;


