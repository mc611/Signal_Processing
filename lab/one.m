%% 1 
p=10;
t=2*p;
k1=sin(2*pi*t)*exp(4*p);
k2=sin(2*pi*t).*exp(4*p);

% k1=k2=-1.153055254393609e+03
% I think the answer is not correct. The answer should be 0.
% It is one dimension, so there is no difference between using * and .*

%% 2
p=2.65;
t=2*p;
k1=sin(2*pi*t)*exp(4*p);
k2=sin(2*pi*t).*exp(4*p);

% k1=k2=3.817049866908111e+04

%% 3
b=0.7;
g=exp(1)*atan(72)*exp(2*b);

% g=17.162075139603410

%% 4
t=log10(74)*log(67);

%t=7.859544815884318

%% 5
r=1;
ang=95/180*pi;
x=r*cos(ang);
y=r*sin(ang);

% x=-0.087155742747658
% y=0.996194698091746

%% 6
A=[4 10 10 18 34 36 48 40];
M=mean(A);
S=std(A);

% M=25
% S=16.457738084473906

%% 7
A=[4 10; 10 18; 34 36; 48 40];
M=mean(A,'all');
S=std(A,0,'all');

% M= mean(A(:)) is also okay.


% M=25
% S=16.457738084473906
% It does not change.

%% 8
r= normrnd(10,4,[5,2]);

% [4.600452239373915,9.180135766800902;
%22.139693865327416,9.503422607134752;
%12.901616899784422,15.958790431141860;
%9.747780507241375,15.636137959201918;
%12.858971615304384,15.668769653718456]

%% 9
A=[4.600452239373915,9.180135766800902;22.139693865327416,9.503422607134752;12.901616899784422,15.958790431141860;9.747780507241375,15.636137959201918;12.858971615304384,15.668769653718456];
M=mean(A,'all');
S=std(A,0,'all');

% M=12.819577154502940 expect to be 10
% S=4.876369257464310  expect to be 4
% To get closer to expected result, we should make more number involved.

%% 10
r= normrnd(10,4,[50,20]);
M= mean(r,'all');
S= std(r,0,'all');

% M=10.085266188538476;
% S=4.004224724380620;
% My solution improve accuracy.
% This is beacuse when more numbers involved, they fit normal distribution
% better.

%% 11

% So far, so good.
