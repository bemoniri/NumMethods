function [ root ] = secant(f, a, b, Nmax, error)
x(2) = a;
x(1) = b;
v = 2;
y(1) = f(x(1));
y(2) = f(x(2));
iteration = 1;
while 1
    y(v) = f(x(v));
    x(v+1) = x(v) - ((x(v)-x(v-1))*y(v))/(y(v) - y(v-1));
    error(v) = x(v+1) - x(v);
    if( x(v+1) - x(v) < 10^(-4))
        break;
    end
    v = v+1;
    iteration = iteration + 1;
end
root = x(v+1);
end
