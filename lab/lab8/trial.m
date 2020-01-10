close all
  clc
  syms t n
  pi=3.1416;
A = [-pi 0 pi]; %intervalos
f = [-1 2]; %funciones
f = sym(f);
T = max(A)-min(A);
wo = 2*pi/(T);
Ao = 0;
for i=1:length(f)
    Ao = Ao +int(f(i), A(i), A(i+1));
end
Ao =(2*Ao/T)
An = 0;
syms n t pi
for i=1:length(f)      
      An = An + int(f(i)*cos(n*wo*t), A(i), A(i+1))
  end
Bn = 0;
for i=1:length(f)
    Bn = Bn + int(f(i)*sin(n*wo*t), A(i), A(i+1));
end
Bn = simple(2*Bn/T)