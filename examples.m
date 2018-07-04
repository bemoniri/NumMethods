%% Example One: integ
clc
clear
disp('Example One');
format long
f = @(x) sin(x);
I = integ(f, 100, 0, 1, 'simpson');
disp(I)

%% Example Two: derv
 
 clear
 disp('Example Two');

f = @(x) 1./(1+x.^2);
D = derv(f, 1, 0.001, '4forward');
disp(D)

%% Example Three: newton_interpolation
 clear
t = 0:0.1:2.5*pi;
x1 = [0, pi/4, pi/2, pi, 3*pi/2, 2*pi];
f1 = newton_interpolation(x1, sin(x1), t);
figure
hold on
title('Newton Interpolation Example'); ylabel('y'); xlabel('x');
plot(t,f1); 
plot(t, sin(t));
legend('interpolating polynomial','sin(x)');

%% Example Four: cubic_spline
 clear
t = 0:0.01:10;
x1 = 0:2:10;
y1 = exp(-x1);
f1 = cubic_spline(x1,y1 ,t);
disp('Example Four');

figure
hold on
title('Spline Example'); ylabel('y'); xlabel('x');
plot(t,f1); 
plot(t, exp(-t));
legend('spline','exp(-x)');

%% Example Five: gauss_elimination
clear
disp('Example Five');
A = [1 2 3; 4 7 8; 12 0 2];
b = [1; 2; 3];
sol = gauss_elimination(A, b);
disp(sol)

%% Example Six: matiter
clear
disp('Example Six');
A = [10 1 1; 4 55 2; 2 10 2];
b = [1; 2; 3];
sol1 = matiter(A, b, [0;0;0], 100, 'jacobi');
disp(sol1)
sol2 = matiter(A, b, [0;0;0], 100, 'seidel');
disp(sol2)

%% Example Seven: eigenval
A = [7 4 1; 4 4 4; 1 4 7];
[a,b] = eigenval(A, 100);

%% Example Eight: bisection
 clear
bisection(@(x) x.*sin(x) - 2 , -227, -225, 100, 0.0001)

%% Example Nine: regulafalsi
clear
regulafalsi(@(x) x.*sin(x) - 2 , -227, -225, 100, 0.0001)

%% Example Eleven: Secant
clear
secant(@(x) x.*sin(x) - 2 , -227, -225, 1000, 0.1)


