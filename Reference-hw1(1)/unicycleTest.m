function [x] = unicycleTest()
% This function generates random linear speeds and angular velocities for 5
% randomly generated time intervals. The "unicycleModel" function is then
% called to calculate the positions vs time.

% Clean up
close all
clc

x = [1;2;0]; % VERY initial conditions
c = 1; % initiate counter

a = 1; % min time interval
b = 10; % max time interval

t=1; % for indexing purposes
for i = 1:5
% Create 5 random time intervals with integer lengths between 1 and 10
t(i+1) = round(a + (b-a)*rand);

% Define fwd speed & angular velocity inputs for unicycle model function
v = randn;
w = 0.1*randn;

% Call unicycle model function
for k = 1:t(i+1)
    x(:,k+sum(t(1:i))) = unicycleModel(x(:,k-1+sum(t(1:i))),v,w); 
end
c = c+1; % increment counter to match current sequence with next sequence
end

% Create Plot
plot(x(1,:),x(2,:))
xlabel('X')
ylabel('Y')

end