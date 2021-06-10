clear variables;
close all;
clc;

%% a
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
hold on
mesh(CX,CY,zeros(n_cases+1,n_cases+1));

%% b
M = zeros(n_cases ,n_cases);
x = zeros(1 ,n_cases+1);
y = x;
n_impact = 537;

for k=1:n_impact
    x(k) = 24*rand(1,1);
    y(k) = 24*rand(1,1);
    i = ceil(x(k));
    j = ceil(y(k));
    M(i,j) = M(i,j) + 1;
end

plot(x,y, 'r*')

M=M(:);
Valmax = 10;


[h_emp, xout] = hist(M(:),0:Valmax);

EcartTypeEmp = std(M)

figure(2)
hold on
bar(xout, h_emp, 1)


%% c
lambda = n_impact/n_cases^2;
P = zeros(1,Valmax+1);
for k = 0: Valmax
    P(k+1) = (lambda^k * exp(-lambda))/ (factorial(k)) ;
end

EcartTypeTheo = sqrt(lambda)

bar(xout, P*n_cases^2, 'g')


