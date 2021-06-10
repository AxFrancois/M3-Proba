clear variables;
close all;

N=10000;

% variable aléatoire contenant N nombres répartis selon la loi normale
X=randn(1,N);   

% ==========
subplot(131);
[h1,xout1]=hist(X,10);  % h1 : ordonnées de l'histogramme de X
                        % xout1 : abscisse de l'histogramme de X
                        % remarque : l'histogramme ne s'affiche pas
bar(xout1,h1);  % affichage de l'histogramme
xlabel('X');
ylabel('h1');

% ==========
subplot(132);
[h2,xout2]=hist(X,50); 
bar(xout2,h2); 
xlabel('X');
ylabel('h2');

% ==========
subplot(133);
[h3,xout3]=hist(X,200); 
bar(xout3,h3); 
xlabel('X');
ylabel('h3');

