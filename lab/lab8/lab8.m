clc;
clear all;
close all;

%%
t=linspace(-5,5,101);


rect=zeros(1,101);
a=find(t==-2.5);
b=find(t==2.5);
rect(a:b)=1;


subplot(211)
plot(t,rect)
xlabel('time/[s]')
ylabel('amplitute')
title('rect function')
hold on

[ak,bk,f0,Series] = FourierSeriesMegan(rect,10,t);
plot(t,Series)
legend('Signal','FourierSeries')
hold on




%%
rect2=zeros(1,101);
c=find(t==-5);
d=find(t==0);
rect2(c:d)=1;

subplot(212)
plot(t,rect2)
xlabel('time/[s]')
ylabel('amplitute')
title('shifted rect function')
hold on

[ak2,bk2,f02,Series2] = FourierSeriesMegan(rect2,10,t);
plot(t,Series2)
legend('Signal','FourierSeries')


%% 
k=0:1:10;


ak_new=zeros(1,11);
ak_new(1,2:11)=ak;
ak_new(1,1)=0.5010;



bk_new=zeros(1,11);
bk_new(1,2:11)=bk;
bk_new(1,1)=0;

plot(k*f0,ak_new,'b*')
hold on

plot(k*f0,bk_new,'r*')

xlabel('frequency/[Hz]')
ylabel('ak/bk')
title('coefficients')
legend('ak','bk')



