function [ak,bk,f0,Series] = FourierSeriesMegan(input,order,t)

T = t(end)-t(1);
f0 = 1/T;

ak = zeros(1,order); 
bk = zeros(1,order);

dt = t(2)-t(1);
a0 = 1/T * sum(input)*dt;
Series = a0;

for k=1:order    
    for i=1:101
    ak(1,k) = ak(1,k)+ 2/T * input(i)*cos(2*pi*k*f0*t(i)) *dt;
    bk(1,k) = bk(1,k)+ 2/T * input(i)*sin(2*pi*k*f0*t(i)) *dt;
    end
    Series = Series + ak(1,k)*cos(2*pi*k*f0*t) + bk(1,k)*sin(2*pi*k*f0*t);
end

end