clear variables;
close all;
clc;

N = 5000;
X = zeros(1,N);
n=8;
for k = 1:N
    Tir = randi([1 n],1,2);
    while Tir(1) == Tir(2)
        Tir = randi([1 n],1,2);
    end
    X(k) = min(Tir);
end

%loi de probabilité empirique
[h_emp, xout] = hist(X,1:7);%histogramme
h_emp = h_emp./N;
hold on
bar(xout,h_emp,1);%affichage

EspEmp = mean(X);
VarEmp = std(X)^2;

%loi de probabilité théorique
A = zeros(1,n-1);
for k = 1:n-1
    A(k) = (2*(n-k))/(n*(n-1));
end

EspTh = (n + 1) / 3;
VarTh = (n^2 - n - 2) / 18;

bar(xout,A,'w')
legend('empirique','théorique')
legend boxoff

txt1 = texlabel(sprintf('%d boules',n));
text(6,0.2,txt1)
txt2 = texlabel(sprintf('%d expériences',N));
text(6,0.19,txt2)

text(6,0.17,['$E(X)_{emp}= $', num2str(EspEmp)],'Interpreter','latex')
text(6,0.16,['$E(X)_{th}= $', num2str(EspTh)],'Interpreter','latex')

text(6,0.14,['$V(X)_{emp}= $', num2str(VarEmp)],'Interpreter','latex')
text(6,0.13,['$V(X)_{th}= $', num2str(VarTh)],'Interpreter','latex')

