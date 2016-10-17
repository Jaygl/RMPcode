function [ xEvalAll ] = potential_planner( xStart,world,potential,epsilon )
%Gradient descent planner that starts at location xStart within world
%'world' and potential 'potential'. Takes up to 1000 steps of size epsilon
%in an attempt to converge on ||grad(U)|| < 10e-3. Saves the intermediate
%points in xEvalAll
%   xStart is a 2x1 vector with components [x y]
%   world is a world structure as described previously
%   potential is a potential structure as described previously
%   epsilon is a scaler that represents the step size

xEvalAll = xStart;

%For up to 1000 steps
while size(xEvalAll,2) < 1000
    %Get current position
    xEval = xEvalAll(:,end);
    %evaluate gradient at current position
    gradU = potential_totalGrad(xEval, world, potential);
    if sqrt(dot(gradU,gradU)) <= 10e-3
        %if ||grad(U)|| < 10e-3, then we have converged to local minimum
        disp('Reached local minimum...')
        return
    else
        %Otherwise keep going
        xEvalAll(:,end+1) = xEval - epsilon*gradU;
    end
end

