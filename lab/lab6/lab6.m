
%% 3,6,7

load('NeuralData790.mat');
FS = 30000;
L = length(NeuralData);
t=0:1/FS:(L-1)/FS;

NeuralData1 = NeuralData(1,:);
NeuralData2 = NeuralData(2,:);
NeuralData3 = NeuralData(3,:);

subplot(311)
plot(t,NeuralData1);
title('data1');
xlabel('time [s]');
ylabel('amplitude');
hold on 

NeuralData1_1 = set_threshold(NeuralData1, 0.98);
plot(t,NeuralData1_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')



subplot(312)
plot(t,NeuralData2);
title('data2');
xlabel('time [s]');
ylabel('amplitude');
hold on

NeuralData2_1 = set_threshold(NeuralData2, 0.98);
plot(t,NeuralData2_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')

subplot(313)
plot(t,NeuralData3);
title('data3');
xlabel('time [s]');
ylabel('amplitude');
hold on

NeuralData3_1 = set_threshold(NeuralData3, 0.98);
plot(t,NeuralData3_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')

%% 8 

number1 = count_spikes(NeuralData1_1,1);
number2 = count_spikes(NeuralData2_1,1);
number3 = count_spikes(NeuralData3_1,1);



%% 9

deri1 = diff(NeuralData1);
deri2 = diff(NeuralData2);
deri3 = diff(NeuralData3);

L1 = length(deri1);
t1=0:1/FS:(L1-1)/FS;



subplot(311)
plot(t1,deri1);
title('data1');
xlabel('time [s]');
ylabel('amplitude');
hold on 

deri1_1 = set_threshold(deri1, 0.98);
plot(t1,deri1_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')



subplot(312)
plot(t1,deri2);
title('data2');
xlabel('time [s]');
ylabel('amplitude');
hold on

deri2_1 = set_threshold(deri2, 0.98);
plot(t1,deri2_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')



subplot(313)
plot(t1,deri3);
title('data3');
xlabel('time [s]');
ylabel('amplitude');
hold on

deri3_1 = set_threshold(deri3, 0.98);
plot(t1,deri3_1,'*');
hold on

plot(t,Deltachain2);
legend('NeuralData','thresholded','DeltaChain')

%% 10

number1_1 = count_spikes(deri1_1,1);
number2_1 = count_spikes(deri2_1,1);
number3_1 = count_spikes(deri3_1,1);

%% 11,12

t2 =0:1/FS:(L+299)/FS ;
deltachain = 8*Deltachain2;

NeuralSpike_flip = fliplr(NeuralSpike);
corr1 = conv(NeuralData1,NeuralSpike_flip);

NeuralSpike_flip = fliplr(NeuralSpike);
corr2 = conv(NeuralData2,NeuralSpike_flip);

NeuralSpike_flip = fliplr(NeuralSpike);
corr3 = conv(NeuralData3,NeuralSpike_flip);


subplot(311)
plot(t2,corr1);
title('data1');
xlabel('time [s]');
ylabel('amplitude');
hold on 

corr1_1 = set_th(corr1, 6.5);
plot(t2,corr1_1,'*');
hold on

plot(t+300/FS,deltachain);
legend('NeuralData','thresholded','DeltaChain')



subplot(312)
plot(t2,corr2);
title('data2');
xlabel('time [s]');
ylabel('amplitude');
hold on

corr2_1 = set_th(corr2,6.5);
plot(t2,corr2_1,'*');
hold on

plot(t+300/FS,deltachain);
legend('NeuralData','thresholded','DeltaChain')



subplot(313)
plot(t2,corr3);
title('data3');
xlabel('time [s]');
ylabel('amplitude');
hold on

corr3_1 = set_th(corr3,6.5);
plot(t2,corr3_1,'*');
hold on

plot(t+300/FS,deltachain);
legend('NeuralData','thresholded','DeltaChain')


%% 13
number1_2 = count_spikes(corr1_1,8);
number2_2 = count_spikes(corr2_1,8);
number3_2 = count_spikes(corr3_1,8);




