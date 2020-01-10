function flipshift(t,x1,flip,scale,shift)
%input: the origin t and the origin function x1
%       flip = +1 or -1, +1 means no flip, -1 means there exits flip
%       scale = the times faster
%       shift = position shift, + means to left, - means to right. 
%       note that the shift shoud be after flip and scale


%output: the new t2
%        plot x2, x2 is the new function

plot(t,x1);
hold on; 
t2=t/(flip*scale)-shift;
t2;
plot((t/(flip*scale)-shift), x1);
end

