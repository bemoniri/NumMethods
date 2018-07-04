% Natural Cubic Spline
function s = cubic_spline(xx, y, t)

    n = length(y);
    h = zeros(1,n);

    for j=1:(n-1)
        h(j+1) = xx(j+1)-xx(j);
    end

    d = zeros(n-2,1);

    for j=1:(n-2)
        d(j,1) = 6/(h(j+1)+h(j+2))*((y(j+2)-y(j+1))/h(j+2)-(y(j+1)-y(j))/h(j+1));
    end

    lambda = zeros(1,n);

    for j=1:(n-3)
        lambda(j) = h(j+2)/(h(j+1)+h(j+2));
    end

    mu = zeros(1,n);

    for j=1:(n-3)
        mu(j+1) = h(j+1)/(h(j+2)+h(j+3));
    end

    A = zeros(n-2);

    for i=1:(n-2)
        A(i,i) = 2;
        if i<n-2
            A(i,i+1) = lambda(i);
        end
        if i>1
            A(i,i-1) = mu(i);
        end
    end    


    N = A\d;

    M=zeros(1,n);
    for i=2:(n-1)
        M(i)=N(i-1,1);
    end

    e = zeros(1,n-1);
    f = zeros(1,n-1);

    for j=1:n-1
        e(j)=((y(j+1)-y(j))/h(j+1))-(h(j+1)/6)*(M(j+1)-M(j));
        f(j)=y(j)-((h(j+1)^2)*M(j))/6;
    end

    syms x
    T=zeros(1,n-1);
    T=vpa(x);
    for j=1:(n-1)
        T(j,1)=(((x-xx(j+1))^3)/(-6*h(j+1)))*M(j)+(((x-xx(j))^3)/(6*h(j+1)))*M(j+1)+e(j)*(x-xx(j))+f(j);
    end
    expand(simplify(T));
    %for j=1:(n-1)
     %   disp(T(j,1));
    %end
    f = @(x) 0;
    for i = 1 : (n - 1)
       f = f + T(i,1)*heaviside(xx(i+1)-x)*heaviside(x - xx(i));
    end
    s = subs(f, x, t);
end