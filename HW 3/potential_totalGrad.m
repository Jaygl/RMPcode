function [ gradU ] = potential_totalGrad( xEval,world,potential )
%POTENTIAL_TOTALGRAD Summary of this function goes here
%   Detailed explanation goes here

gradURep = sphere_potentialGrad(xEval,world);
gradUAttr = potential_attractive(xEval, potential);

gradU = gradURep + potential.alpha*gradUAttr;
end

