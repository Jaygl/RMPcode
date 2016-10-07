function [ output_args ] = unicycle_test()
%UNICYCLE_TEST A quick test for the unicycle_model function. We take a
%random v and w, which we hold constant, and a starting position of
%(0,0,pi/2) and propogate the model 5 times.

%   

timesteps = randi([1 10],5,1);
total_time = sum(timesteps);

v = randn()
w = randn()
xVectorCurrent = [0; 0; pi/2];
x(1) = xVectorCurrent(1); y(1) = xVectorCurrent(2); theta(1) = xVectorCurrent(3);
for k = 1:total_time
    xVectorCurrent = unicycle_model(xVectorCurrent, v, w);
    x(k+1) = xVectorCurrent(1); y(k+1) = xVectorCurrent(2); theta(k+1) = xVectorCurrent(3);
end

plot(x, y)

end

