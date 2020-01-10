%% Part 1

%% (a)

[y,fs] = audioread('song.mp4');

%% (b)

[y,fs] = audioread('song.mp4', [73*fs 83*fs]);

%% (c)

soundsc(y,fs);

%% (d)

t = 73:1/fs:83;

subplot(231)
plot(t,y);
title('original song');
xlabel('time [s]');
ylabel('amp');

%% (e)

soundsc(y,fs*2);

subplot(232)
plot(0.5*t,y);
title('2*fs');
xlabel('time [s]');
ylabel('amp');


% The lasting time seems shorter and the frequency seems higher.

%% (f)

soundsc(y,fs*0.5);

subplot(233)
plot(2*t,y);
title('0.5*fs');
xlabel('time [s]');
ylabel('amp');


% echo and time longer frequency lower

%% (g)

Y = y(:,1)+y(:,2);

hf = zeros(1,length(t));
hf(1,find(t==76)) = -1;
hf(1,find(t==79)) = 1;

highpass = conv(Y,hf);
soundsc(highpass,fs);

subplot(234)
plot(highpass);
title('highpass');
xlabel('time [s]');
ylabel('amp');

%% (h)

lf1 = 0:0.01:1;
lf2 = -lf1+1-0.01;
lf = [lf1,lf2];

lowpass = conv(Y,lf);
soundsc(lowpass,fs);

subplot(235)
plot(lowpass);
title('lowpass');
xlabel('time [s]');
ylabel('amp');


%% (i)

bf1 = ones(1,20);
bf2 = -ones(1,20);
bf=[bf1,bf2];

bandpass = conv(Y,bf);
soundsc(bandpass,fs);

subplot(236)
plot(bandpass);
title('bandpass');
xlabel('time [s]');
ylabel('amp');



