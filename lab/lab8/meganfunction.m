function [ak,bk,f0,Series] = FourierSeriesMegan(input,order,t)

T = length(t);
f0 = 1/T;

ak = zeros(order);
bk = zeros(order);

dt = t(2)-t(1);
a0 = 1/T * sum(input)*dt;
Series = a0;

for k=1:order
    ak(k) = 2/T * sum(input*cos(2*pi*k*f0*t)) *dt;
    bk(k) = 2/T * sum(input*sin(2*pi*k*f0*t)) *dt;
    Series = Series + ak(k)*cos(2*pi*k*f0*t) + bk(k)*sin(2*pi*k*f0*t);
end

end



