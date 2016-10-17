function [ gradU ] = potential_totalGrad( xEval,world,potential )
%Returns the sum of the repulstive and attractive potentials at a location
%xEval in a world defined by world and with a potential defined by
%potential.
%   xEval is a 2x1 vector with the components [x; y]
%   world is a world structure as defined earlier
%   potential is a potential structure as defined earlier\
%   gradU is a 1x2 gradient vector with the components [x, y]

%Calculate the repulstive and attractive potentials
gradURep = sphere_potentialGrad(xEval,world);
gradUAttr = potential_attractive(xEval, potential);

%Return the sum of the two
gradU = gradURep + potential.alpha*gradUAttr;
end

