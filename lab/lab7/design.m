%% l

clear all; close all; clc;
dt = 1;
k1 = 3/60;
k2 = 0.5/60;

t = 0:dt:300;
L = length(t);

line = 30*ones(size(t));
plot(t,line,'--');
hold on



x1 = zeros(size(t));


a = find(t==0);
b = find(t==90);
x1(a:b)=(50/90)/dt;


c = find(t==91);
d = find(t==300);
x1(c:d)=(50/209)/dt;

x11 = zeros(size(t));
x11(a:b)=50/90;
x11(c:d)=50/209;

plot(t,x11);
xlabel('time/min')
ylabel('amplititude/mg')
title('consumed 100mg')

hold on

q1 = zeros(size(t));
y1 = zeros(size(t));

for i=2:L
    q1(i) = ( x1(i-1)*dt+q1(i-1) )/( 1+k1*dt );
    y1(i) = ( q1(i)*dt*k1+y1(i-1) )/( 1+k2*dt );
end

plot(t,q1);
plot(t,y1);
legend('30mg line','ingestion','gas tract','bloodstream');