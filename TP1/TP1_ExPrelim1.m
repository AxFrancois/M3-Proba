clear variables;
close all;

X=[1,3,6,6,1,3,3,6,1,3,6,6,3,1,3,3];

figure(1);

% ==========
[h1,xout1]=hist(X,3);  % h1 : ordonnées de l'histogramme de X
                       % xout1 : abscisse de l'histogramme de X
                       % remarque : l'histogramme ne s'affiche pas

disp([xout1;h1]);   % affichage des valeurs de xout1 et h1 dans la
                    % fenetre de commande
subplot(131);
bar(xout1,h1);      % affichage sous la forme d'un histogramme
xlabel('X');
ylabel('h1');

% ==========
[h2,xout2]=hist(X,4);
disp([xout2;h2]); 
subplot(132);
bar(xout2,h2);
xlabel('X');
ylabel('h2');

% ==========
[h3,xout3]=hist(X,1:6);
disp([xout3;h3]);
subplot(133);
bar(xout3,h3);
xlabel('X');
ylabel('h3');

