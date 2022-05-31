clc
clear all

tol = 1.e-8;
xi = 1/2 + 2*[0:5];
yi = zeros(5, 1);
f = @(x) 2/pi * 11/2 * (1 - exp(-0.05.*x)) .* sin(x.^2);
Ns = zeros(5, 1);

for i = 1:6
    [IN,N] = simptoll(f,0,xi(i),tol);
    yi(i) = IN;
    Ns(i) = N;
end
yi
Ns

yy = InterpL(xi, yi, linspace(0,xi(6),200));

figure
plot(xi, yi, 'bo') 
hold on
plot(linspace(0,xi(6),200), yy, 'r-')





