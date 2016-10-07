%% Question 1.1 - Triangle Draw Function
% This function plots a triangle by connecting 3 lines. The 3 lines are
% created by calling the "points2line" function, and the input variable
% 'vertices' is a 2x6 matrix, where each column represents the x and y
% coordinates of the 3 vertices of the triangle.
    function [] = triangleDraw(vertices)
% Create Xi vectors that take coordinates from 'vertices'
    X1 = [vertices(1,1) vertices(1,2)];
    X2 = [vertices(1,1) vertices(1,3)];
    X3 = [vertices(1,2) vertices(1,3)];
    Y1 = [vertices(2,1) vertices(2,2)];
    Y2 = [vertices(2,1) vertices(2,3)];
    Y3 = [vertices(2,2) vertices(2,3)];
% Line 1: pt1 --> pt2
    pt1_1 = [X1(1) Y1(1)];
    pt2_1 = [X1(2) Y1(2)];
    line1 = points2line(pt1_1,pt2_1); % call points2line function
% Line 2: pt1 --> pt3
    pt1_2 = [X2(1) Y2(1)];
    pt2_2 = [X2(2) Y2(2)];
    line2 = points2line(pt1_2,pt2_2); % call points2line function
% Line 3: pt2 --> pt3
    pt1_3 = [X3(1) Y3(1)];
    pt2_3 = [X3(2) Y3(2)];
    line3 = points2line(pt1_3,pt2_3); % call points2line function
% Plot triangle
    plot(X1,line1,'--b',X2,line2,'--b',X3,line3,'--b','LineWidth',2)
    end