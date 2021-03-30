clear variables;
close all;
clc;

choice = 3
switch choice
%% Question 1
    case 1
        theta = 0:0.01:pi/2;
        Arc=[cos(theta); sin(theta)];
        figure(1)
        hold on
        plot(Arc(1,:), Arc(2,:))
        axis equal

        NombrePoint = 1000;
        NombrePointDansCercle = 0;
        for i = 1:NombrePoint
            Point = rand(2,1);
            if norm(Point) < 1
                color = [0,1,0];
                NombrePointDansCercle = NombrePointDansCercle + 1;
            else
                color = [1,0,0];
            end
            plot(Point(1), Point(2), '*', 'color', color)

        end

        APeuPresPi = NombrePointDansCercle/NombrePoint * 4;
        text1 = sprintf('Nombre total de points : %d', NombrePoint);
        text2 = sprintf('Nombre de points dans le quadrant : %d', NombrePointDansCercle);
        text3 = sprintf('Valeur approximative de pi : %f', APeuPresPi);
        disp('APPROXIMATION DE PI (METHODE DE MONTE-CARLO)')
        disp(text1)
        disp(text2)
        disp(text3)

%% Question 2
    case 2
        e = exp(1);
        t = 1:0.01:e;
        Courbe = log(t)./(t.^2);
        figure(3)
        hold on
        plot(t, Courbe, 'color', [0,0,1])

        NombrePoint = 10000;
        NombrePointSousLaCourbe = 0;
        for i = 1:NombrePoint
            Point = [1+ (e-1)*rand(1), 0.5*rand(1)];
            if Point(2) < log(Point(1))/(Point(1).^2)
                color = [0,1,0];
                NombrePointSousLaCourbe = NombrePointSousLaCourbe + 1;
            else
                color = [1,0,0];
            end
            plot(Point(1), Point(2), '*', 'color', color)

        end

        ValeurExacteCourbe = (e-2)/e;
        ValeurEmpiriqueCourbe = NombrePointSousLaCourbe/NombrePoint * 0.5*(e-1);
        text1 = sprintf('Nombre total de points : %d', NombrePoint);
        text2 = sprintf('Nombre de points sous la courbe : %d', NombrePointSousLaCourbe);
        text3 = sprintf('Valeur approximative de l''intégrale : %f', ValeurEmpiriqueCourbe);
        text4 = sprintf('Valeur "exacte" de l''intégrale : %f', ValeurExacteCourbe);
        disp('VALEUR APPROXIMATIVE D''UNE INTEGRALE')
        disp(text1)
        disp(text2)
        disp(text3)
        disp(text4)

%% Question 3
    case 3
        [X,Y] = meshgrid(1:.05:5);
        Courbe = 1./(X+Y).^3;
        figure(3)
        hold on
        mesh(X,Y, Courbe)
        view(-131,22)
        grid on
        xlim([1,3])
        xlabel('x')
        ylim([2,5])
        ylabel('y')
        zlim([0,0.04])
        zlabel('$\displaystyle 1/(x+y)^3$','interpreter','latex')

        NombrePoint = 10000;
        NombrePointSousLaCourbe = 0;
        for i = 1:NombrePoint
            Point = [1+2*rand(1), 2+2*rand(1), 0.04*rand(1)];
            if Point(3) < 1/(Point(1)+Point(2)).^3
                color = [0,1,0];
                NombrePointSousLaCourbe = NombrePointSousLaCourbe + 1;
            else
                color = [1,0,0];
            end
            plot3(Point(1), Point(2), Point(3), '*', 'color', color)

        end

        ValeurExacteCourbe = 2/75
        ValeurEmpiriqueCourbe = NombrePointSousLaCourbe/NombrePoint * 2*2*0.04;
        text1 = sprintf('Nombre total de points : %d', NombrePoint);
        text2 = sprintf('Nombre de points sous la courbe : %d', NombrePointSousLaCourbe);
        text3 = sprintf('Valeur approximative de l''intégrale : %f', ValeurEmpiriqueCourbe);
        %text4 = sprintf('Valeur "exacte" de l''intégrale : %f', ValeurExacteCourbe);
        disp('VALEUR APPROXIMATIVE D''UNE INTEGRALE')
        disp(text1)
        disp(text2)
        disp(text3)
        disp(text4)
        %}
end
