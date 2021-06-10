clear variables;
close all;
clc;

%% Question 1
%{
n= 100;

[h1,xout1]=hist(LancerDeSixFaces(n),1:6);
bar(xout1,h1);
xlabel('X');
ylabel('h1');
%}
%% Question 2
%Jeu A
n1=4;
nombreVictoire = 0;
nombreTest = 100000; %Loi des grands nombres
for i= 1:nombreTest
    if max(LancerDeSixFaces(n1)) == 6
        nombreVictoire = nombreVictoire + 1;
    end
end

pourcentageVictoire = nombreVictoire/nombreTest * 100;
text1 = sprintf('Jeu A : Proportion de victoire : %f', pourcentageVictoire);
disp(text1)
pourcentagetTheorique = 1-(5/6)^n1;
text2 = sprintf('Résultat théorique : %f', pourcentagetTheorique);
disp(text2)

%Jeu B
n2 = 24;
nombreVictoire = 0;
nombreTest = 100000; %Loi des grands nombres

%{
for i = 1:nombreTest
    j = 0;
    while j < n2
        if LancerDeSixFaces(2) == [6,6]
            nombreVictoire = nombreVictoire + 1;
            j = n2;
        end
        j = j+1;
    end
end
%}

for i = 1:nombreTest
    [h1,xout1]=hist(LancerDeSixFaces(n2)+LancerDeSixFaces(n2),2:12);
    if h1(end) > 0
        nombreVictoire = nombreVictoire + 1;
    end        
end

pourcentageVictoire = nombreVictoire/nombreTest * 100;
text1 = sprintf('Jeu A : Proportion de victoire : %f', pourcentageVictoire);
disp(text1)
pourcentagetTheorique = 1-(35/36)^n2;
text2 = sprintf('Résultat théorique : %f', pourcentagetTheorique);
disp(text2)
