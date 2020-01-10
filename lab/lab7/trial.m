%% l

clear all; close all; clc;
dt = 1;
k1 = 3/60;
k2 = 0.5/60;

t = 0:dt:300;
L = length(t);

x1 = zeros(size(t));


a = find(t==0);
b = find(t==90);
x1(a:b)=(45/90)/dt;


c = find(t==100);
d = find(t==300);
x1(c:d)=(45/200)/dt;

x11 = zeros(size(t));
x11(a:b)=45/90;
x11(c:d)=45/200;

plot(t,x11);
xlabel('time/min')
ylabel('amplititude/mg')
title('design')

hold on

q1 = zeros(size(t));
y1 = zeros(size(t));

for i=2:L
    q1(i) = ( x1(i-1)*dt+q1(i-1) )/( 1+k1*dt );
    y1(i) = ( q1(i)*dt*k1+y1(i-1) )/( 1+k2*dt );
end


plot(t,y1);
legend('ingestion','bloodstream');