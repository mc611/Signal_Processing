clc;
clear all;
close all;

%% 1
t1=linspace(-5,5,101);
t2=colon(-5,0.1,5);
% Answered in Sakai

%% 2
rect=zeros(1,101);
delta=zeros(1,101);
step=zeros(1,101);
ramp=zeros(1,101);

%% 3
t=linspace(-5,5,101);
a=find(abs(t)<=1);
rect(1,min(a):max(a))=1;
figure
plot(t,rect,'b')
hold on

%% 4
b=find(abs(t)==0);
width=2*0.1;
height=2/width;
delta(1,b)=height;
plot(t,delta,'k')
hold on

% The area under delta function is supposed to be 1. My width is 0.2, so the height should be 2/0.2=10

%% 5
step(1,b:end)=1;
plot(t,step,'r')
hold on 

%% 6
d=find(t==0);
ramp(1,d:end)=t(d:end);
plot(t,ramp,'g')

%% 7 
% Submit by Sakai

%% 8
% The area under delta function is supposed to be 1. My width is 0.2, so the height should be 2/0.2=10

%% 9

v1=cos(2*pi*t).*step;

step2=zeros(1,101);
f=find(t==2);
step2(1,f:end)=1
v2=cos(2*pi*t).*step2;

v=v1-v2;
plot(t,v)
xlabel('t')
title('cos(2*pi*t)u(t)-cos(2*pi*t)u(t-2)')




