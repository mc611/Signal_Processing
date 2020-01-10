clc;
clear all;
close all;

%%
t=linspace(-5,5,101);

rect=zeros(1,101);
a=find(t==-2.5);
b=find(t==2.5);
rect(a:b)=1;

subplot(311)
plot(t,rect)
xlabel('time/[s]')
ylabel('amplitute')
title('rect function')
hold on

[Xk,f0,Series] = cefs(rect,10,t);
% plot(t,Series)
% legend('Signal','FourierSeries')
% hold on
% 
% 
% L = length(Xk);
% Xk_mag = zeros(1,L);
% Xk_ang = zeros(1,L);
% 
% for i=1:1:L
%     Xk_mag(1,i) = abs(Xk(1,i));
%     Xk_ang(1,i) = angle(Xk(1,i));
% end   
% 
% k0 = -10:1:10;
% subplot(312)
% plot(k0*f0,Xk_mag,'*');
% xlabel('frequency/[Hz]')
% ylabel('Amplitute')
% title('|X[k]|')
% 
% subplot(313)
% plot(k0*f0,Xk_ang,'*');
% xlabel('frequency/[Hz]')
% ylabel('Angle')
% title('<X[k]')










