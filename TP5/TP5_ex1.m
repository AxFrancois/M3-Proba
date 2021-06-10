clear variables;
close all;
clc;

%% 1
N = 500000;
U1 = rand(1,N);
U2 = rand(1,N);

X = sqrt(-2*log(U1)) .* cos(2*pi*U2);
Y = sqrt(-2*log(U1)) .* sin(2*pi*U2);

% X
[h_empX, xout] = hist(X,50); %histogramme
h_empX = h_empX/trapz(xout,h_empX);
EspEmpX = mean(X);
VarEmpX = std(X);

% Y 
[h_empY, yout] = hist(Y,50); %histogramme
h_empY = h_empY/trapz(yout,h_empY);
EspEmpY = mean(Y);
VarEmpY = std(Y);


% Affichage
figure(1)

subplot(2,1,1)
h1=bar(xout, h_empX);

set(h1,'FaceColor', [0.5 0.5 0.5]);
xlabel('x (valeurs de X)')
ylabel('Densité de probabilité')
title('Simulation de la loi X')
txt1 = texlabel(sprintf('Experiences : %d',N));
text(2,0.35,txt1)

text(2,0.25,['$E_{emp}(X)= $', num2str(EspEmpX)],'Interpreter','latex')
text(2,0.20,['$V_{emp}(X)= $', num2str(VarEmpX)],'Interpreter','latex')

subplot(2,1,2)
h2=bar(yout, h_empY);
set(h2,'FaceColor', [0.5 0.5 0.5]);
xlabel('y (valeurs de Y)')
ylabel('Densité de probabilité')
title('Simulation de la loi Y')
txt1 = texlabel(sprintf('Experiences : %d',N));
text(2,0.35,txt1)

text(2,0.25,['$E_{emp}(Y)= $', num2str(EspEmpY)],'Interpreter','latex')
text(2,0.20,['$V_{emp}(Y)= $', num2str(VarEmpY)],'Interpreter','latex')

%% 2


mu = 4;
sigma = 3;

t = -15+mu:0.01:15+mu;
Norm = 1/(sigma * sqrt(2*pi)) * exp(-(t-mu).^2 /(2*sigma^2));

Z = X*sigma + mu;



% Z
[h_empZ, zout] = hist(Z,50); %histogramme
h_empZ = h_empZ/trapz(zout,h_empZ);
EspEmpZ = mean(Z);
VarEmpZ = std(Z);

figure(2)
hold on
h3=bar(zout, h_empZ);

plot(t, Norm, 'b', 'LineWidth',2)
 
set(h3,'FaceColor', [0.5 0.5 0.5]);
xlabel('z (valeurs de Z)')
ylabel('Densité de probabilité')
title('Simulation de la loi Z')
txt1 = texlabel(sprintf('Experiences : %d',N));
text(10,0.12,txt1)

text(10,0.10,['$E_{emp}(Z)= $', num2str(EspEmpZ)],'Interpreter','latex')
text(10,0.08,['$E_{th}(Z)= $', num2str(mu)],'Interpreter','latex')

text(10,0.06,['$V_{emp}(Z)= $', num2str(VarEmpZ)],'Interpreter','latex')
text(10,0.04,['$V_{th}(Z)= $', num2str(sigma)],'Interpreter','latex')

