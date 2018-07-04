function [ lambda, x1 ] = eigenval(A, N)

i = 1;
x = [1; 1; 1];
for i = 1:N
 y = A*x;
 eigen0(i) = y(1)./x(1);
 x = y./norm(x, inf);
end
x1 = x./norm(x,inf);
lambda = eigen0(i-1);
end
