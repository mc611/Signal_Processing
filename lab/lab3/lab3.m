%% 2.(a)
t1=-5:0.05:5;
x1=exp(-(t1-2));
subplot(411);
plot(t1,x1,'r')
xlabel('t');
ylabel('x(t)');
title('exp function');

%% 2.(b)
delta=zeros(1,201);
a=find(t1==3);
width=0.1;
height=2/width;
delta(1,a)=height;
subplot(412);
plot(t1,delta,'b');
hold on 

x2=exp(-t1);
plot(t1,x2,'r');
xlabel('t');
ylabel('delta and exp')
title('delta and exp');
legend('delta function','exp function')

%% 2.(c)
subplot(413);
x3=x2.*delta;
plot(t1,x3)
xlabel('t');
ylabel('delta * exp function')

%% 2.(d)
s1=sum(x3,'all');

% s=0.9957*0.05=0.0498

%% 2.(e)
s2=zeros(length(t1));
for k=2:length(t1);
    s2(1)=0;
    s2(k)=s2(k-1)+x3(k)*0.05;   
end
subplot(414);
plot(t1,s2)
xlabel('t');
ylabel('inte');
title('inte');

    