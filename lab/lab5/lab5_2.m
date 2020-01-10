%% Part 2 

%% (a)

I = imread('lena.jpeg');

%% (b)

I_new = I(:,:,1);

%% (c)

imshow(I_new);

%% (d)

HF = [-1,1];

%% (e)

highf = conv2(I_new,HF);

subplot(231)
imshow(highf);
axis square
title('2e-highpass')
hold on 

%% (f)

LF = gausswin(64);


%% (g)

lowf = conv2(I_new,LF);
lowf = lowf./max(lowf(:,:));

subplot(232)
imshow(lowf);
axis square
title('2g-lowpass');
hold on

%% (h)

% No. It just affect in one direction.

%% (i)

bf1 = ones(1,40);
bf2 = -ones(1,10);
bf=[bf1,bf2];


BF = bf;

bandf = conv2(I_new,BF);
bandf = bandf./max(bandf(:,:));

subplot(233)
imshow(bandf);
axis square
title('2i-bandpass')

%% (j)

HF_t = HF';
highf_t = conv2(I_new,HF_t);

subplot(234)
imshow(highf_t);
axis square
title('2j-highpass')
hold on 

%% (k)

LF_t = LF';
lowf_t = conv2(I_new,LF_t);
lowf_t = lowf_t./max(lowf_t(:,:));

subplot(235)
imshow(lowf_t);
axis square
title('2k-lowpass')
hold on 

%% (l)

BF_t = BF';
bandf_t = conv2(I_new,BF_t);
bandf_t = bandf_t./max(bandf_t(:,:));

subplot(236)
imshow(bandf_t);
axis square
title('2l-bandpass')
hold on 

%% (m)

HF_new = [1,-1;-1,1];

subplot(211)
mesh(HF_new);
title('modified high pass h[n]');

result = conv2(I_new,HF_new);
subplot(212)
imshow(result);
title('result')