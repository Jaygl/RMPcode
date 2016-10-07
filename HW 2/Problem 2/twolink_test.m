function [  ] = twolink_test(  )
%TWOLINK_TEST Loads a set of test points from the file twolink_testData and
%then generates 5 random manipulator configurations. These configurations
%are checked for collisions with the points and then plotted.
%Configurations drawn in red have had a collision, those drawn in black are
%collision-free and therefore valid configurations.

load('twolink_testData.mat');
%generate random configurations
theta1 = rand(1, 5)*2*pi;
theta2 = rand(1, 5)*2*pi;
figure
%plot the obstacles defined by points
plot(points(1,:), points(2,:), 'k.', 'linewidth', 2)
hold on
for k = 1:size(theta1, 2)
    %Check each configuration for a collision
    if twolinkCheckCollision(theta1(k), theta2(k), points)
        %if collision, plot the manipulator in red with dashed lines
        twolinkDraw(theta1(k), theta2(k), 'r--');
    else
        %if collision-free, plot the manipulator in black
        twolinkDraw(theta1(k), theta2(k), 'k');
    end
end


end

