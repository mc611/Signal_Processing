%% part 2: Playing with sound in MATLAB


%% (a)
fs = 44100;
t = 0:1/fs:3;


%% (b)
f = 261.6;
xt = cos(2*pi*f*t);


%% (c)
soundsc(xt,fs);

% I tried fs/4,fs/2,fs,fs*2,fs*4. I found that 
% the times of fs means 1/times of times lasting.
% e.g. fs/4 shows 4 times duration of fs.
% and it shows low frequency.


%% (d)
figure 
subplot(511)
plot(t,xt);
hold on
xlabel('time [s]')
ylabel('Amp')
title('initial cosine wave')

% It doesn't sound like a pinao. 
% Because signal amplitudes at all times are the same.


%% (e)
L = length(t);
env = hamming(L);
env = transpose(env);
result = xt .* env;
subplot(512)
plot(t,result)
xlabel('time [s]');
ylabel('Amp')
title('modulated by hamming window');

soundsc(result, fs);

% They sound different. 
% For the latter one, the volumn is not always the same while the former one is.

%% (f)

% I got the modulation method from google.
% reference: https://web.eecs.umich.edu/~fessler/course/100/misc/chowning-73-tso.pdf

aL = 0.5; 
a = find(t==aL);
at = t(1,1:a); 
attack1 = exp(4/aL*at)-1; 
attack1 = attack1 / max(attack1); % to keep amp at max 1

sL=2.3; 
b = find(t==aL+sL);
st=t(1,a+1:b);
sustain1 = ones(1,length(st));

rL = 0.2; 
rt = t(1,b+1:end);
release1 = exp(-4/rL*rt);
release1 = release1/max(release1);

env1 = [attack1, sustain1, release1];
result1 = xt .* env1;

subplot(513)
plot(t,result1)
xlabel('time [s]');
ylabel('Amp')
title('Woodwind');

soundsc(result1, fs);


%% (g)

attack2 = 2*at; 
attack2 = attack2 / max(attack2); 

sustain2 = ones(1,length(st));

release2 = -rt+3;
release2 = release2/max(release2);

env2 = [attack2, sustain2, release2];
result2 = xt .* env2;

subplot(514)
plot(t,result2)
xlabel('time [s]');
ylabel('Amp')
title('String');

soundsc(result2, fs);


%% (h)
%reference: https://blog.landr.com/adsr-envelopes-infographic/
t=0:1/fs:3;

L1 = 0.5; 
c = find(t==L1);
t1 = t(1,1:c); 
attack = sqrt(t1); 
attack = attack / max(attack); 

L2 = 0.5;
d = find(t==L1+L2);
t2 = t(1,c+1:d);
delay = exp(-1/L2*t2);
delay = delay / max(delay);

L3 = 1; 
e = find(t==L1+L2+L3);
t3 = t(1,d+1:e);
sustain = ones(1,length(t3))-(max(delay)-min(delay));

L4 = 1; 
t4 = t(1,e+1:end);
release = exp(-0.4/L4*t4);
release = release / max(release) -(max(delay)-min(delay));

env3 = [attack,delay,sustain,release];
result3 = xt .* env3;

subplot(515)
plot(t,result3)
xlabel('time [s]');
ylabel('Amp')
title('flute');

soundsc(result3, fs);


%% (h)
% xt = cos(2*pi*f*t);
% xt2 = cos(2*pi*2*f*t);
% xt4 = cos(2*pi*4*f*t);  % add harmonic freq
% 
% xt3 = xt+xt2+xt4;
% w = gausswin(L)';
% result4 = xt3.* w;
% 
% subplot(515)
% plot(t,result4)
% xlabel('time [s]');
% ylabel('Amp')
% title('add harmonic frequency and apply Gaussian window');
% 
% soundsc(result4,fs)




