function [ root ] = regulafalsi( f,a,b,Nmax, error )

r = 1;
n = 1;

while n < Nmax
    
    ya = f(a);
    yb = f(b);
    x(r) = b - (yb*(b-a))/(yb-ya);
    yc = f(x(r));  
    if r > 1
        error(r-1) = x(r) - x(r-1);
        if (abs(x(r) - x(r-1)) < error)
            break;
        end
    end
    if ya*yc == 0
        root = yc;
        break;
    end
    if yc*ya > 0
        a = x(r);
    end
    if yc*ya < 0
        b = x(r);
    end
    r = r + 1;
    
    n = n +1;
end
root = x(r-1);

end

