clear variables;
close all;
clc;

k1 =3:1:8  %-2:1:7; %3:1:8;
X = [4/20,1/20,3/20,7/20,2/20,3/20]; %1/(length(k1)) * ones(1,length(k1)); %[4/20,1/20,3/20,7/20,2/20,3/20];

%% a
subplot(3,1,1);
h1=bar(k1, X);
set(h1,'FaceColor', [0.5 0.5 0.5]);
xlabel('k (valeurs de X)')
ylabel('P(X=k)')


mu = k1*X'
sigma = sqrt(k1.^2*X'-mu^2)
text(7,0.35,['Moyenne : ', num2str(mu)])
text(7,0.3,['Ecart type : ', num2str(sigma)])

%% b 

X1X2=conv(X,X);
k2 = 2*min(k1):1:2*max(k1);

subplot(3,1,2);
h2=bar(k2, X1X2);
set(h2,'FaceColor', [0.5 0.5 0.5]);
xlabel('k (valeurs de X1+X2)')
ylabel('P(X1+X2=k)')

%% c
n = 10;
Z = X;
for k  = 1:(n-1)
    Z = conv(Z,X);
end
k3 = n*min(k1):1:n*max(k1);
muZ = n * mu;
sigmaZ = sigma * sqrt(n);

t = n*min(k1):0.01:n*max(k1);
Norm = 1/(sigmaZ * sqrt(2*pi)) * exp(-(t-muZ).^2 /(2*sigmaZ^2));

subplot(3,1,3);
hold on
h3=bar(k3, Z);
plot(t, Norm, 'b', 'LineWidth',2)
set(h3,'FaceColor', [0.5 0.5 0.5]);
xlabel('k (valeurs de Z = X1+X2+...)')
ylabel('P(Z=k)')
legend('loi de Z = X_1 + ... + X_n','densité limite (TCL)')
legend boxoff

txt1 = texlabel(sprintf('n = %d',n));
text(70,0.07,txt1)
text(70,0.06,['$E(Z)= $', num2str(muZ)],'Interpreter','latex')
text(70,0.05,['$V(Z)= $', num2str(sigmaZ)],'Interpreter','latex')

