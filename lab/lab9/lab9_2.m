clear all;
close all;
clc;

%% plot EKG data and count waves number

load('EKGdata2.mat');
t = EKGdata2(:,1);
data = EKGdata2(:,end);

plot(t,data)
xlim([min(t) max(t)])
xlabel('time')
ylabel('amplitute')
title('EKGdatda VS. time')


a=find(data(:,1)>1.5);
diffa = diff(a);
index = find(diffa~=1);
number = length(index)+1;


%% plot R-R interval data

new_t = t(3452:10335,1);
new_t = new_t-min(new_t);
new_data = data(3452:10335,1);
plot(new_t,new_data);
xlabel('time')
ylabel('amplitute')
title('R-R interval VS. time')


%% fourier series fitting

[Xk,f0,Series] = cefsekg(new_data,24,new_t);

subplot(311)
plot(new_t,new_data)
hold on
plot(new_t,Series)
xlabel('time')
ylabel('amplitute')
title('EKGdatda VS. time')
legend('Signal','FourierSeries')



L = length(Xk);
Xk_mag = zeros(1,L);
Xk_ang = zeros(1,L);

for i=1:1:L
    Xk_mag(1,i) = abs(Xk(1,i));
    Xk_ang(1,i) = angle(Xk(1,i));
end   

k0 = -24:1:24;
subplot(312)
plot(k0*f0,Xk_mag,'*');
xlabel('frequency/[Hz]')
ylabel('Amplitute')
title('|X[k]|')

subplot(313)
plot(k0*f0,Xk_ang,'*');
xlabel('frequency/[Hz]')
ylabel('Angle')
title('<X[k]')


%% calculate error

error = 0;
for i=1:1:L
    error = ( error+( Xk_mag(1,i)-Xk(1,i) )^2) /L ;
end


%% supress 60Hz signal 

% [Xk_de,f0,Series_de] = cefsekg(new_data,25,new_t);
% plot(new_t,new_data)
% hold on
% plot(new_t,Series)
% hold on
% plot(new_t,Series_de)
% xlabel('time')
% ylabel('amplitute')
% title('EKG')
% legend('EKG signal','with 60Hz','without 60Hz')

%%

[Xk,f0,Series] = cefsekg(new_data,24,new_t);

noise = Xk(1,26)*exp(2*pi*j*21*f0*t)+ Xk(1,4)*exp(2*pi*j*(-21)*f0*t);
Series_de = new_data - noise ;

plot(k0*f0,Series_de,'o');
xlabel('frequency/[Hz]')
ylabel('Amplitute')
title('Denoise')


  