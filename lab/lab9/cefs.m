function [Xk,f0,Series] = cefs(input,order,t)

T = t(end)-t(1);
f0 = 1/T;

ak = zeros(1,order); 
bk = zeros(1,order);
Xk1 = zeros(1,order);
Xk2 = zeros(1,order);

dt = t(2)-t(1);
a0 = 1/T * sum(input)*dt;
Series = a0;

for k=1:order    
    for i=1:101
    ak(1,k) = ak(1,k)+ 2/T * input(i)*cos(2*pi*k*f0*t(i)) *dt;
    bk(1,k) = bk(1,k)+ 2/T * input(i)*sin(2*pi*k*f0*t(i)) *dt;   
    end 
    
    Xk1(1,k) = 0.5*( ak(1,k)-j*bk(1,k) );
    Xk2(1,k) = 0.5*( ak(1,k)+j*bk(1,k) );    
    Series = Series + Xk1(1,k)*exp(2*pi*j*k*f0*t)+ Xk2(1,k)*exp(2*pi*j*(-k)*f0*t);
end
Xk = [fliplr(Xk2),a0,Xk1];

end

