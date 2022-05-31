clc
clear all

syms a;
syms b;
syms c;
x = [0 4 0 5];
y = [0 0 4 6];
f = @(x,y) x^2 + y^2 + a*x + b*y + c;

% punto a)
A = [0 0 1; 4 0 1; 0 4 1; 5 6 1];
b = [0 -16 -16 61];

% punto b)
[Q, R] = qr(A);

% punto c)
% A = QR
% A'Ax = A'b 
M = A'*A;
Mx = A'*b