function [ result ] = derv( f, x0, h, method)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Symetric 

if(strcmp(method, '4sym'))

    result = (-f(x0 + 2.*h) + 8.* f(x0 + h) - 8.*f(x0 - h) + f(x0 - 2.*h))./(12.*h);
end


if(strcmp(method, '2sym'))

    result = (f(x0+h) - f(x0-h))./(2.*h);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Forward 
if(strcmp(method, '4forward'))

    result = (2*f(x0+3*h)-9*f(x0+2*h)+18*f(x0+h)-11*f(x0))./(6.*h);
end


if(strcmp(method, '3forward'))

    result = (-f(x0+2*h)+4*f(x0+h)-3*f(x0))./(2*h);
end

if(strcmp(method, '2forward'))

    result = (f(x0+h)-f(x0))./(h);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Backward
if(strcmp(method, '4backward'))

    result = -(2*f(x0-3*h)-9*f(x0-2*h)+18*f(x0-h)-11*f(x0))./(6.*h);
end


if(strcmp(method, '3backward'))

    result = -(-f(x0-2*h)+4*f(x0-h)-3*f(x0))./(2*h);
end

if(strcmp(method, '2backward'))

    result = -(f(x0-h)-f(x0))./(h);
end


