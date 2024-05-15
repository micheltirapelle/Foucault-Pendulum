% Michel Tirapelle
clear all
close all
clc

g = 9.81;                           
W = 7.26*10^-5;                     
Re = 6*10^6;                        
alpha = 0;                          
l = 15;                             

w0 = sqrt(g/l);
w = sqrt( w0^2 + W^2*Re/l*cos(alpha)^2 );

odefcn  = @(t, y) [y(2);       
                   -w^2*y(1)];  
tspan   = [0, 10];
x0      = -0.6:0.15:0.6;
y0      = x0;

for i = 1:numel(x0)
    for j = 1:numel(y0)
        [t, y]  = ode45(odefcn, tspan, [x0(i); y0(j)]);
        plot(y(:,1), y(:,2)), hold on
    end
end
grid on
axis([-1.6 1.6 -1.6 1.6])
title('Phase Portraits')
