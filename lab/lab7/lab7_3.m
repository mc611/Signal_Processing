%% i
clear all; close all; clc;
dt = 1;
k1 = 3/60;
k2 = 0.5/60;

t = 0:dt:300;
L = length(t);

% original
subplot(311);
x2 = zeros(size(t));
a2 = find(t==0);
b2 = find(t==50);
x2(a2:b2)=4/dt;

x21 = zeros(size(t));
a21 = find(t==0);
b21 = find(t==50);
x21(a21:b21)=4;

plot(t,x21);
xlabel('time/min')
ylabel('amplititude/mg')
title('uniformly(50min)')

hold on

q2 = zeros(size(t));
y2 = zeros(size(t));

for i=2:L
    q2(i) = ( x2(i)*dt+q2(i-1) )/( 1+k1*dt );
    y2(i) = ( q2(i)*dt*k1+y2(i-1) )/( 1+k2*dt );
end

plot(t,q2);
hold on

plot(t,y2);
legend('x','q','y')



% larger k2
subplot(312);
x2 = zeros(size(t));
a2 = find(t==0);
b2 = find(t==50);
x2(a2:b2)=4/dt;

x21 = zeros(size(t));
a21 = find(t==0);
b21 = find(t==50);
x21(a21:b21)=4;

plot(t,x21);
xlabel('time/min')
ylabel('amplititude/mg')
title('larger k2')

hold on

q2l = zeros(size(t));
y2l = zeros(size(t));
for i=2:L
    q2l(i) = ( x2(i)*dt+q2l(i-1) )/( 1+k1*dt );
    y2l(i) = ( q2l(i)*dt*k1+y2l(i-1) )/( 1+10*k2*dt );
end

plot(t,q2l);
hold on

plot(t,y2l);
legend('x','q','y')



% smaller k2
subplot(313);
x2 = zeros(size(t));
a2 = find(t==0);
b2 = find(t==50);
x2(a2:b2)=4/dt;

x21 = zeros(size(t));
a21 = find(t==0);
b21 = find(t==50);
x21(a21:b21)=4;

plot(t,x21);
xlabel('time/min')
ylabel('amplititude/mg')
title('smaller k2')

hold on

q2s = zeros(size(t));
y2s = zeros(size(t));
for i=2:L
    q2s(i) = ( x2(i)*dt+q2s(i-1) )/( 1+k1*dt );
    y2s(i) = ( q2s(i)*dt*k1+y2s(i-1) )/( 1+k2/10*dt );
end

plot(t,q2s);
hold on

plot(t,y2s);
legend('x','q','y')











