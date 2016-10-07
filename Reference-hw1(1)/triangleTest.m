% Name: Brendan Higgins
% Date: 09/14/16
% Class: ME570 - Robot Motion Theory
% Assignment #1

%% Question 1.3 - Triangle Test Function
function [] = triangleTest()
% The purpose of this function is to generate a random triangle by calling
% the "triangleDraw" function and then generate 100 random points and
% determine whether they are inside or outside the triangle by using the
% "triangleCheckCollisions" function.

% Clean Up
close all % close all previously generated figures
clc % clear command window

% Call triangleDraw function and provide input
vertices = rand(2,3); % generate random 3 points to create triangle
triangleDraw(vertices) % draw triangle based on random 3 points

% plot 100 random points over triangle figure
hold on
for i = 1:100
point = rand(1,2); % generates a random point & for loop iterates 100 times

% Call triangleCheckCollisions and provide input
points = [point' vertices];
flagPoints = triangleCheckCollisions(points);
if flagPoints == 1
    plot(point(1),point(2),'*g') % plot point as green * if inside triangle
elseif flagPoints == 0
    plot(point(1),point(2),'xr') % plot point as red x if outside triangle
end
end

end