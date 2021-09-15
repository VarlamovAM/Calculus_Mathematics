clear all; close all;
x = pi/4;

h0 = pi/64;

for k = 1:40

    h = h0/(2^k)

    fd1 = (cos(x + h) - cos(x))/h

    fd2 = (cos(x + h) - cos(x - h))/2/h

    exact = -sin(x);

    err1(k) = abs(exact - fd1)/abs(exact)
    err2(k) = abs(exact - fd2)/abs(exact)
    
    h_array(k) = h
    
end

figure(1)
loglog(h_array, err1, 'ro')
hold on
loglog(h_array, h_array/2 + 2*10^(-16)./h_array, 'k')

loglog(h_array, err2, 'bo')
loglog(h_array, h_array.^2/6 + 10^(-16)./h_array, 'k')
