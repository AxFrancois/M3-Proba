clear variables;
close all;
clc;

disp('1 : Uniforme, 2 : Bernoulli, 3 : Binomiale, 4 : Geometrique')
choice = input('')

%Constantes
 N = 10000;
 X = zeros(1,N);

switch choice
    %% Uniforme
    case 1
        disp('Intervalle de la Loi Uniforme : [1,n]. n = ? (entier)')
        n = input('')
        
        %% Empirique
        for k = 1:N
            X(k)=LoiUniforme(n);
        end
        [h_emp, xout] = hist(X,1:n);%histogramme
        h_emp = h_emp./N;
        
        EspEmp = mean(X);
        VarEmp = std(X)^2;

        %% Theorique
        Xtheo = 1/n * ones(1,n);
        
        %esp et variance théo
        
        %% Affichage
        hold on
        bar(xout,h_emp,1, 'g')
        bar(xout,Xtheo,'r')
        
        legend('empirique','théorique')
        legend boxoff
        xlabel('$k $','Interpreter','latex')
        ylabel('$P(X = k)$','Interpreter','latex')
        title(['Loi Uniforme : [1,' num2str(n), ']'])
        
    %% Bernoulli
    case 2
        disp('Loi de Bernoulli de probabilité p : B(p)]. p = ? (0 <= p <= 1)')
        p = input('')
        
        %% Empirique
        for k = 1:N
            X(k)=LoiBernoulli(p);
        end
        [h_emp, xout] = hist(X,0:1);%histogramme
        h_emp = h_emp./N;
        
        EspEmp = mean(X);
        VarEmp = std(X)^2;
        
        bar(xout,h_emp,1)
        set(gca,'xticklabel',{'échec', 'succès'})
        ylabel('$P(X = echec/succes)$','Interpreter','latex')
        
    %% Binomiale    
    case 3
        disp('Loi Binomiale de n tentative et de probabilité p : B(n,p)]')
        disp('n = ? (entier)')
        n = input('')
        disp('p = ? (0 <= p <= 1)')
        p = input('')
        
        %% Empirique
        for k = 1:N
            X(k)=LoiBinomiale(n,p);
        end
        
        [h_emp, xout] = hist(X,0:n);%histogramme
        h_emp = h_emp./N;
        
        
        bar(xout,h_emp,1)
        xlabel('$k $','Interpreter','latex')
        ylabel('$P(X = k)$','Interpreter','latex')
        
    %% Geometrique    
    case 4
        disp('Loi Geometrique de probabilité p : G(p)]. p = ? (0 <= p <= 1)')
        p = input('')
        
        %% Empirique
        for k = 1:N
            X(k)=LoiGeometrique(p);
        end
        
        [h_emp, xout] = hist(X,1:max(X));%histogramme
        h_emp = h_emp./N;
        bar(xout,h_emp,1)
        xlabel('$k $','Interpreter','latex')
        ylabel('$P(X = k)$','Interpreter','latex')
end