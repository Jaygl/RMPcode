function [ UAttr ] = attractive_potential( xEval, potential )
%Determines the Attractive potential at a point xEval by the potential of
%type 'potential'
%   xEval is a 2x1 vector with entries [x y].
%   potential is a struct following the definition in the homework. It has
%   fields xGoal (goal location), alpha (weight), and type

d = sqrt((xEval(1) - potential.xGoal(1))^2 + (xEval(2) - potential.xGoal(2))^2);

%Determine the value p, which depends on the type of potential.
if strcmp(potential.type, 'quadratic')
    p = 2;
elseif strcmp(potential.type, 'conic')
    p = 1;
else
    Error('Not a valid potential type.')
end

%Calculate UAttr
UAttr = d^p;
end
