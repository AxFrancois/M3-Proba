clear variables;
close all;
clc;

%% Empirique
min = 1;
max = 2;

N = 50000;
X = 1+rand(1,N);
Y = 1+rand(1,N);
EspEmpU = mean(X)
VarEmpU = std(X)

% S
S = X + Y;
minS = 2 * min;
maxS = 2 * max;
EspEmpS = mean(S)
VarEmpS = std(S)

% P
P = X.*Y;
minP = min^2;
maxP = max^2;
EspEmpP = mean(P)
VarEmpP = std(P)

%Q
Q = X./Y;
minQ = min/max;
maxQ = max/min;
EspEmpQ = mean(Q)
VarEmpQ = std(Q)

%% Theorique
%S
t1 = minS:0.1:((minS+maxS)/2);
t2 = ((minS+maxS)/2):0.1:maxS;
t2 = t2(1:end);
tS = [t1,t2];
Sth1 = t1 - 2;
Sth2 = 4 - t2;
Sth = [Sth1,Sth2];

%P
t1 = minP:0.1:maxP/2;
t2 = maxP/2:0.1:maxP;
t2 = t2(1:end);
tP = [t1,t2];
Pth1 = log(t1);
Pth2 = 2*log(2) - log(t2);
Pth = [Pth1,Pth2];

%Q
t1 = minQ:0.1:maxQ/2;
t2 = maxQ/2:0.1:maxQ;
t2 = t2(1:end);
tQ = [t1,t2];
Qth1 = 2-1./(2*t1.^2);
Qth2 = 2./t2.^2 - 1/2;
Qth = [Qth1,Qth2];

%% Affichage
NombreBarre = 50;
[h_uni,x_uni]=hist(X,NombreBarre);
h_uni = h_uni/trapz(x_uni,h_uni);

[h_S,x_S]=hist(S,NombreBarre);
h_S = h_S/trapz(x_S,h_S);

[h_P,x_P]=hist(P,NombreBarre);
h_P = h_P/trapz(x_P,h_P);

[h_Q,x_Q]=hist(Q,NombreBarre);
h_Q = h_Q/trapz(x_Q,h_Q);

subplot(2,2,1)
h1 = bar(x_uni,h_uni);
set(h1,'FaceColor', [0.5 0.5 0.5]);
axis([min max 0 1.5])
text(1.2,1.2,['loi uniforme sur [', num2str(min), ',', num2str(max), ']'])

subplot(2,2,2)
hold on
h2 = bar(x_S,h_S);
plot(tS, Sth, 'b', 'LineWidth',2)
set(h2,'FaceColor', [0.5 0.5 0.5]);
axis([minS maxS 0 1.5])
legend('emp.','th.')
legend boxoff
text(2.2,1.3,'$S = X+Y$','Interpreter','latex')

subplot(2,2,3)
hold on
h3 = bar(x_P,h_P);
plot(tP, Pth, 'b', 'LineWidth',2)
set(h3,'FaceColor', [0.5 0.5 0.5]);
axis([minP maxP 0 1.5])
legend('emp.','th.')
legend boxoff
text(1.1,1.3,'$P = X.Y$','Interpreter','latex')

subplot(2,2,4)
hold on
h4 = bar(x_Q,h_Q);
plot(tQ, Qth, 'b', 'LineWidth',2)
set(h4,'FaceColor', [0.5 0.5 0.5]);
axis([minQ maxQ 0 1.5])
legend('emp.','th.')
legend boxoff
text(1.5,0.75,'$Q = X/Y$','Interpreter','latex')


