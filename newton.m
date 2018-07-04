function [f] = newton(f, x0, Nmax, error)
r = 1;
y (r) = x0;
while r < Nmax
    y(r+1) = y(r) - f(y(r)) / derv(f, y(r), error, '4sym');
    error(r) = abs(y(r + 1) - y(r));
    r = r + 1;
    if abs(y(r) - y(r-1) ) < error 
        break;
    end
end