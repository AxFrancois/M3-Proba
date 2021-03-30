clear variables;
close all;
clc;

lambda = 0.3;
mu = 0.5;

N = 10000;


%% X 
%Empirique
for k = 1:N
    X(k)=LoiGeometrique(lambda);
end
        
[h_empX, xout] = hist(X,1:max(X)); %histogramme
h_empX = h_empX./N;


%Theorique
Xtheo = zeros(1,length(xout));
for k = 1:length(xout)
    Xtheo(k)=(1-lambda)^(k-1) * lambda;
end

subplot(1,3,1)
hold on
bar(xout,h_empX,1, 'g')
bar(xout,Xtheo, 0.5,'r')
xlabel('$k $','Interpreter','latex')
ylabel('$P(X = k)$','Interpreter','latex')
axis([0 max(X)/2+1 0 1])
title(['Loi de X : Geo(' num2str(lambda), ')'])
legend('empirique','théorique')
legend boxoff

%% Y 
%Empirique
for k = 1:N
    Y(k)=LoiGeometrique(mu);
end
        
[h_empY, xout] = hist(Y,1:max(Y)); %histogramme
h_empY = h_empY./N;

%Theorique
Ytheo = zeros(1,length(xout));
for k = 1:length(xout)
    Ytheo(k)=(1-mu)^(k-1) * mu;
end

subplot(1,3,2)
hold on
bar(xout,h_empY,1, 'g')
bar(xout,Ytheo, 0.5,'r')
xlabel('$k $','Interpreter','latex')
ylabel('$P(Y = k)$','Interpreter','latex')
axis([0 max(Y)/2+1 0 1])
title(['Loi de Y : Geo(' num2str(mu), ')'])
legend('empirique','théorique')
legend boxoff

%% Z
%Empirique
for k = 1:N
    Z(k)=min([X(k),Y(k)]);
end

[h_empZ, xout] = hist(Z,1:max(Z)); %histogramme
h_empZ = h_empZ./N;
subplot(1,3,3)
hold on
bar(xout,h_empZ,1, 'g')
xlabel('$k $','Interpreter','latex')
ylabel('$P(Z = k)$','Interpreter','latex')
axis([0 max(Z)/2+1 0 1])
title(['Loi de Z : inf(X,Y) : Geo(?)'])

%Theorique
