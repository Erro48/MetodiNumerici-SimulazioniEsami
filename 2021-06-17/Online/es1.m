clc
clear all

B = [
0.98 0.02 0 0.04 0;
0.08 0.93 0.08 -0.07 -0.03;
0.04 0.01 0.97 -0.07 -0.04;
0.02 -0.03 0 1.03 0;
0.07 0.04 0 -0.08 1.01
];
% punto a)
A = eye(length(B)) - B;
M = max(max(abs(A)));

% punto b)
invBApp = A^0;
for k = 1:3
    invBApp = invBApp + A^k;
end

% punto c)
ammetteLU = true;
for i = 1:length(B)
    tmp = B(1:i, 1:i);
    if det(tmp) == 0
        ammetteLU = false;
        break;
    end
end

if ammetteLU == true
    disp('La matrice B ammette fattorizzazione LU')
else
    disp('La matrice B NON ammette fattorizzazione LU')
end

% punto d) fattorizzazione LU senza pivoting
[L,U,P,flag] = LU_parziale(B);

% punto e)
% Ax = b => LUx = b => Ux = y; Ly = b
Id = eye(length(B));
for n = 1:length(B);
    % Bx = Id(:,n)
    [x, flag] = LUsolve(L, U, P, Id(:,n));
    invB(:,n) = x;
end

cond(invB)
invB
cond(invBApp)
invBApp


