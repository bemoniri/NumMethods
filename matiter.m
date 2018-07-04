function [ x ] = matiter( A, b,x, N, method )


if strcmp(method, 'jacobi')
    
    [n,m]=size(A);
    iter=N;

    for i=1:N
        for j=1:n
            y(j)=(b(j)-A(j,1:j-1)*x(1:j-1)-A(j,j+1:n)*x(j+1:n))/A(j,j);
        end
        x=y';
    end
    
end

if strcmp(method, 'seidel')
    n = length(A);
    for k = 1:N
        for i = 1:n
            x(i) = (1/A(i, i))*(b(i) - A(i, 1:n)*x + A(i, i)*x(i));
        end
    end
end
end

