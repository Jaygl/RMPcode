function [ U ] = potential_total( xEval,world,potential )
%Returns the sum of the repulstive and attractive potentials at a location
%xEval in a world defined by world and with a potential defined by
%potential.
%   xEval is a 2x1 vector with the components [x y]
%   world is a world structure as defined earlier
%   potential is a potential structure as defined earlier
%   U is a scaler quantity that denotes the total field strength at xEval

%Calculate the repulstive and attractive potentials
URep = sphere_potential(xEval,world);
UAttr = attractive_potential(xEval,potential);

%Return the sum of the two
U = URep + (potential.alpha)*UAttr;
end

