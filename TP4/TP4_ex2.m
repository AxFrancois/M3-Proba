clear variables;
close all;
clc;

choice = 1;

switch choice
    case 1
        N = 50000;
        a=-3;
        b=2;

        X =rand(1,N);

        F = 6.^X - 4; %fonction réciproque de 1/ln(6) * 1/(x+4)

        [h_empX, xout] = hist(F,50); %histogramme
        h_empX = h_empX/trapz(xout,h_empX);
        EspEmp = mean(F);
        VarEmp = std(F);


        x = a:0.1:b;
        h_theo =1/log(6) * 1./(x+4);
        EspTh = 1/log(6) * (5-4*log(6));
        VarTh = EspTh ^2 - (16*log(6) - 45/2);


        hold on
        h=bar(xout, h_empX);
        set(h,'FaceColor', [0.5 0.5 0.5]);
        plot(x, h_theo, 'b', 'LineWidth',2)
        xlabel('x (valeurs de X)')
        ylabel('Densité de probabilité')
        axis([-3.5 2.5 0 0.6])
        title(['Simulation de la loi uniforme sur l intervalle [', num2str(a), ',' , num2str(b), ']'])
        legend('empirique','théorique')
        legend boxoff

        txt1 = texlabel(sprintf('Experiences : %d',N));
        text(0,0.5,txt1)

        text(0,0.45,['$E_{emp}(X)= $', num2str(EspEmp)],'Interpreter','latex')
        text(0,0.40,['$E_{th}(X)= $', num2str(EspTh)],'Interpreter','latex')

        text(0,0.35,['$V_{emp}(X)= $', num2str(VarEmp)],'Interpreter','latex')
        text(0,0.30,['$V_{th}(X)= $', num2str(VarTh)],'Interpreter','latex')
        
    case 2
        n=100000;                   % nombre d’expériences
        Y1= 0.5 * rand(1,n);        % VA uniforme sur [0,1/2] 
        Y2= 0.5 + 0.5 * rand(1,n);  % VA uniforme sur [1/2,1]
        X1= sqrt(8*Y1);             % simulation de la VA X sur [0,2[
        X2= 4 - 2*sqrt(2-2*Y2);     % simulation de la VA X sur [2,4[
        X= [X1,X2];                 % concaténation des VA X1 et X2
        [h,xout]=hist(X,50);        % calcul de l’histogramme de X
        hold on
        h= h/trapz(xout,h);
        hbar=bar(xout,h);          % affichage de l’histogramme de X
        mu_emp=mean(X);             % moyenne empirique
        sigma_emp=std(X);           % écart type empirique
        mu_th=2;                    % moyenne théorique
        sigma_th= sqrt(2/3);                 % écart type théorique
        fprintf('Moyenne empirique : %f,\t Moyenne théorique : %f\n',mu_emp,mu_th);
        fprintf('Ecart type empirique : %f,\t Ecart type théorique : %f\n',sigma_emp,sigma_th);

        y1 = 0:0.1:2;
        y2 = 2:0.1:4;
        y2 = y2(1,:);
        y = [y1, y2];
        x1 = 1/4 * y1;
        x2 = 1/4 * (4 - y2);
        x = [x1, x2];

        set(hbar,'FaceColor', [0.5 0.5 0.5]);
        plot(y, x, 'b', 'LineWidth',2)
        
end

