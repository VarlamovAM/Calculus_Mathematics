clear all; close all

N = 32;

L = 2*pi;
h = L/N;

x = [0:N]'*h;

func = @(x)sin(x);

alpha = 10;
beta = 20;

A = zeros(N - 1, N -1);

A = 1/h^2*(-2 * diag(ones(N - 1, 1), 0) + diag(ones(N - 2, 1), 1) +   diag(ones(N - 2, 1), -1));

f = zeros(N - 1, 1);
f = func(x(2:N));

f(1)   = f(1)   - alpha/h^2;
f(end) = f(end) - beta/h^2;

T = zeros(N-1, 1);

T_ex = A^-1*f

Di = diag(diag(A))^-1;

% plot(T_ex);

figure(1);

for k = 1:1000
    r = f - A*T;
    T = T + Di*r;
    
    
    if (mod(k, 10) == 0)
        plot(x(2:N), T, x(2:N), T_ex);
        title(['iter = ', num2str(k) ' relative residual norm = ', num2str(norm(r)/norm(f))]);
        pause(0.01);
    end
end