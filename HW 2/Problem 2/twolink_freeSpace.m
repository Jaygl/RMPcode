function [ freespace ] = twolink_freeSpace(  )
%TWOLINK_FREESPACE Evaluates the free configuration space across the full
%range of possible values, which for theta will be [0 2*pi] with
%theta_steps steps. Generates a plot of this free configuration space,
%theta1 vs theta2, as well as stepping through all possible configurations
%during the calculation.

%Load the point data for all the obstacles, points
load('twolink_testData.mat')

%how many discrete values we want to check for each theta. These will be
%evenly distributed.
theta_steps = 30;
%Define the configuration space we wish to test
[theta1,theta2] = meshgrid(linspace(0, 2*pi, theta_steps),linspace(0, 2*pi, theta_steps));
%This will keep track of the subset of the configuration space that is free
%space
freespace = zeros(theta_steps, theta_steps);

%Plot our obstacles
plot(points(1,:), points(2,:), 'ko')
xlabel('X position')
ylabel('Y position')
hold on

for k = 1:numel(theta1)
    %Evaluate each position
    freespace(k) = twolinkCheckCollision(theta1(k), theta2(k), points);
    if freespace(k) == 0
        %If there isn't a collision, draw this on the real-time map
        twolinkDraw(theta1(k), theta2(k), 'k')
        pause(.01)
    end
    
end
figure
%Plot the free configuration space.
surf(theta1, theta2, freespace)
xlabel('Theta 1')
ylabel('Theta 2')

end

