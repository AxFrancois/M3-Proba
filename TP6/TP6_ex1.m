clear variables;
close all;
clc;

% empirique

N = 50000;
U1 = rand(1,N);
U2 = rand(1,N);

lambda1 = 1;
lambda2 = 2;

X = -1/lambda1 * log(1-U1);
Y = -1/lambda2 * log(1-U2);
U = X + 2*Y;

EspEmp = mean(U);
VarEmp = std(U);


% théorique
k = 0:0.1:16;
theo = k.*exp(-k);

EspTh = 2;
VarTh = 2;



% affichage
hold on
[h_x, xout]=hist(U,50);
h_x = h_x / trapz(xout,h_x);
h = bar(xout,h_x);
plot(k, theo, 'b', 'LineWidth',2)


set(h,'FaceColor', [0.5 0.5 0.5]);
xlabel('z (valeurs de Z)')
ylabel('Densité de probabilité')
title('Simulation de la loi Z')
txt1 = texlabel(sprintf('Experiences : %d',N));
text(10,0.30,txt1)

text(10,0.25,['$E_{emp}(Z)= $', num2str(EspEmp)],'Interpreter','latex')
text(10,0.20,['$E_{th}(Z)= $', num2str(EspTh)],'Interpreter','latex')

text(10,0.15,['$V_{emp}(Z)= $', num2str(VarEmp)],'Interpreter','latex')
text(10,0.10,['$V_{th}(Z)= $', num2str(VarTh)],'Interpreter','latex')

