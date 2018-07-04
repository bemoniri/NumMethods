function [ result ] = integ( f, N, lower, upper, method)


deltax=(upper-lower)/N;
x = lower : deltax : upper;
%f = @(x) sin(x);


%% RECTANGULAR METHOD
if (strcmp(method,'rect'))
   	 w = (upper-lower)/N;
   	 rect = 0;
    
   	 for i = 1 : N   	 
   	    x_i = lower + (i-1)*w;       
   	    rect = rect + ( w * f(x_i));
     end
     result = rect;
end


%% TRAPZOIDAL METHOD

if strcmp( method , 'trapz')
   
    trapzoid = 0;  %trapezoidal rule
    for k = 1 : N;  
        trapzoid = trapzoid + (f(lower+(k-1)*deltax) + f(lower+(k).*deltax)) / 2 * deltax; %trapazoidal rule
    end;
    result = trapzoid;

end



%% MIDPOINT METHOD

if strcmp( method , 'midpoint')
   
   	 w = (upper-lower)/N;
   	 mid = 0;
    
   	 for i = 1 : N   	 
   	    x_i = lower + (i-0.5)*w;       
   	    mid = mid + ( w * f(x_i));
     end
     result = mid;
end

%% SIMPSON'S METHOD
if strcmp( method , 'simpson')
    simpspn = 0;
    
    if numel(f)>1
        N = numel(f)-1;
        simpspn = deltax/3*(f(1)+2*sum(f(3:2:end-2))+4*sum(f(2:2:end))+f(end));
    else
        simpspn = deltax/3*(f(x(1))+2*sum(f(x(3:2:end-2)))+4*sum(f(x(2:2:end)))+f(x(end)));
    end   
    result = simpspn;
end
end