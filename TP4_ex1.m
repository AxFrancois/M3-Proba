clear variables;
close all;
clc;

N = 50000;
a=-2;
b=3;
X = a + (b-a)* rand(1,N);

[h_empX, xout] = hist(X,50); %histogramme
h_empX = h_empX/trapz(xout,h_empX);
EspEmp = h_empX * xout';
VarEmp = std(X)

h_theo = 1/(b-a) * ones(1,length(h_empX));
EspTh = (a+b)/2;
VarTh = sqrt(((b-a)^2)/12)


hold on
h=bar(xout, h_empX);
set(h,'FaceColor', [0.5 0.5 0.5]);
plot(xout, h_theo, 'b', 'LineWidth',2)
xlabel('x (valeurs de X)')
ylabel('Densité de probabilité')
axis([a b 0 1])
title(['Simulation de la loi uniforme sur l intervalle [', num2str(a), ',' , num2str(b), ']'])
legend('empirique','théorique')
legend boxoff

txt1 = texlabel(sprintf('Experiences : %d',N));
text(0,0.8,txt1)

text(0,0.75,['$E_{emp}(X)= $', num2str(EspEmp)],'Interpreter','latex')
text(0,0.70,['$E_{th}(X)= $', num2str(EspTh)],'Interpreter','latex')

text(0,0.65,['$V_{emp}(X)= $', num2str(VarEmp)],'Interpreter','latex')
text(0,0.60,['$V_{th}(X)= $', num2str(VarTh)],'Interpreter','latex')
