%Ex3
%Reprendre les résultats de l'exercice 5 chap 3 (continues) et les vérifier
%empiriquement à l'aide d'un programme Matlab

clear variables;
close all;
clc;

%a

N = 50000;
X = rand(1,N);
Y = rand(1,N);
Z = min(X,Y);

[h_Z,x_Z]=hist(Z,50);
h_Z = h_Z/trapz(x_Z,h_Z);

z = 0:0.01:1;
fz = 2* (1 -z);
figure(1)
hold on
h1 = bar(x_Z,h_Z);
set(h1,'FaceColor', [0.5 0.5 0.5]);
plot(z, fz, 'b', 'LineWidth',2)

%b

lambda = 3;

X = -log(rand(1,N))/lambda;
Y = -log(rand(1,N))/lambda;
Z = min(X,Y);

[h_Z,x_Z]=hist(Z,50);
h_Z = h_Z/trapz(x_Z,h_Z);

z = 0:0.01:max(Z);
fz = 2*lambda * exp(-2*lambda*z);

figure(2)
hold on
h1 = bar(x_Z,h_Z);
set(h1,'FaceColor', [0.5 0.5 0.5]);
plot(z, fz, 'b', 'LineWidth',2)