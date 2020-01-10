%% k

clear all; close all; clc;
dt = 1;
k1 = 3/60;
k2 = 0.5/60;

t = 0:dt:300;
L = length(t);

x1 = zeros(size(t));
a = find(t==0);
b = find(t==100);
x1(a:b)=4/dt;

x11 = zeros(size(t));
a1 = find(t==0);
b1 = find(t==100);
x11(a1:b1)=4;

plot(t,x11);
xlabel('time/min')
ylabel('amplititude/mg')
title('x[n]=2(u[n]-u[n-100])')

hold on

q1 = zeros(size(t));
y1 = zeros(size(t));

for i=2:L
    q1(i) = ( x1(i-1)*dt+q1(i-1) )/( 1+k1*dt );
    y1(i) = ( q1(i)*dt*k1+y1(i-1) )/( 1+k2*dt );
end

plot(t,q1);
hold on

plot(t,y1);
legend('x','q','y');