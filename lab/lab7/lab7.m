

%% b

clear all; close all; clc;
dt = 1;
k1 = 3/60;
k2 = 0.5/60;


%% c,d,e,f

%cd

t = 0:dt:300;
L = length(t);

subplot(311);
x1 = zeros(size(t));
a = find(t==0);
x1(a)=200/dt;

x11 = zeros(size(t));
a1 = find(t==0);
x11(a1)=200;

plot(t,x11);
xlabel('time/min')
ylabel('amplititude/mg')
title('x(t)=200delta(t)')

hold on

q1 = zeros(size(t));
y1 = zeros(size(t));

for i=2:L
    q1(i) = ( x1(i-1)*dt+q1(i-1) )/( 1+k1*dt );
    y1(i) = ( q1(i)*dt*k1+y1(i-1) )/( 1+k2*dt );
end

plot(t,q1,'.-');
hold on

plot(t,y1,'--');
legend('x','q','y');



%e

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
title('uniformly(50min)')

hold on

q2 = zeros(size(t));
y2 = zeros(size(t));

for i=2:L
    q2(i) = ( x2(i)*dt+q2(i-1) )/( 1+k1*dt );
    y2(i) = ( q2(i)*dt*k1+y2(i-1) )/( 1+k2*dt );
end

plot(t,q2,'.-');
hold on

plot(t,y2,'--');
legend('x','q','y');


%f

subplot(313);
x3 = zeros(size(t));
a3 = find(t==0);
b3 = find(t==100);
x3(a3:b3)=2/dt;

x31 = zeros(size(t));
a31 = find(t==0);
b31 = find(t==100);
x31(a31:b31)=2;

plot(t,x31);
xlabel('time/min')
ylabel('amplititude/mg')
title('uniformly(100min)')
hold on

q3 = zeros(size(t));
y3 = zeros(size(t));

for i=2:L
    q3(i) = ( x3(i)*dt+q3(i-1) )/( 1+k1*dt );
    y3(i) = ( q3(i)*dt*k1+y3(i-1) )/( 1+k2*dt );
end

plot(t,q3,'.-');
hold on

plot(t,y3,'--');
legend('x','q','y');










    
    








