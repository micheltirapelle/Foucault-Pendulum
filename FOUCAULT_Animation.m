% Michel Tirapelle
clear all
close all
clc

a(2,1) = 1/2; a(3,1) = 0; a(3,2) = 1/2; a(4,1) = 0; a(4,2) = 0; a(4,3) = 1;
c(1) = 0; c(2) = 1/2; c(3) = 1/2; c(4) = 1;
b(1) = 1/6; b(2) = 1/3; b(3) = 1/3; b(4) = 1/6;

k = 0.05;

g = 9.81;
l = 15;
W = 7.26e-5 * 1000;
alpha = 0.8;

ode = @(t, y) [ y(3);
                y(4);
    2*W*sin(alpha)*y(4) - y(1)*g/l;
    -2*W*sin(alpha)*y(3) - y(2)*g/l ];

tend = 1000;
X0 = [0.5, 1, 1, 1];
n = 1;
t = 0;
sol = X0(:);
e = zeros(length(X0),3);

plot(X0(1),X0(2),'ro', sol(1,:),sol(2,:),'.b')
hold on

while (t <= tend)
    t  = t + k;
    e(:,1) = sol;

    e(:,2) = sol+...
        a(2,1)*k*ode(t+c(1)*k,e(:,1));

    e(:,3) = sol+...
        a(3,1)*k*ode(t+c(1)*k,e(:,1))+...
        a(3,2)*k*ode(t+c(2)*k,e(:,2));

    e(:,4) = sol+...
        a(4,1)*k*ode(t+c(1)*k,e(:,1))+...
        a(4,2)*k*ode(t+c(2)*k,e(:,2))+...
        a(4,3)*k*ode(t+c(3)*k,e(:,3));

    sol = sol+k*(b(1)*ode(t+c(1)*k,e(:,1))+...
        b(2)*ode(t+c(2)*k,e(:,2))+...
        b(3)*ode(t+c(3)*k,e(:,3))+...
        b(4)*ode(t+c(4)*k,e(:,4)));

    plot(sol(1,:),sol(2,:),'b.')
    axis([-3,3,-3,3])
    title(strcat("Solution at $t$ =", num2str(t)), "Interpreter","latex")
    hold on
    drawnow
end
