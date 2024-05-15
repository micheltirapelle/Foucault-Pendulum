% Michel Tirapelle and Denis Toniolo
clear all
close all
clc

g = 9.81;
l = 15;
W = 7.26e-5 * 1000; 
alpha = 0.8;

ode = @(t, y) [          y(3);
    y(4);
    2*W*sin(alpha)*y(4) - y(1)*g/l;
    -2*W*sin(alpha)*y(3) - y(2)*g/l ];

t_span = [0 100];
X0 = [0.5, 1, 1, 1;
    0, 0.5, 0, 0;
    0,0,1,0;
    1,0,0,0];

sgtitle("Trajectories for the Foucault pendulum", "Interpreter","latex")

for i = 1:size(X0)
    [ts, sol] = ode45(ode, t_span, X0(i,:));
    subplot(1, size(X0,1), i)
    plot(sol(:,1), sol(:,2));
    xlabel('$x$', "Interpreter","latex");
    ylabel('$y$', "Interpreter","latex");
    title(strcat("$x_0=$", num2str(X0(i,1)), ", $y_0=$" , num2str(X0(i,2)), ", $\dot{x_0}=$", num2str(X0(i,3)), ", $\dot{y_0}=$" , num2str(X0(i,4))), "Interpreter","latex")
    grid on;
end
