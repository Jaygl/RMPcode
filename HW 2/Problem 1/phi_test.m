function [ ] = phi_test()
%PHI_TEST A quick test function to ensure that our mapping funcitons are
%operating as expected.
%   Check a variety of permutations of our 4 mapping functions. We allow
%   for a slight error epsilon in these calculations and count the number
%   of errors exceeding the epsilon margin. 

Xtest = 2*rand(10,1)-1;
Ytest = 2*rand(10,1)-1;
epsilon = .001;
my_errs = 0;

disp('phiN(0,0,1): Should equal (0,0)')
[XN YN] = phiN(0,0,1);
[XN YN]
if sum([XN YN] - [0 0]) > epsilon
    warning('Error was made here: phiN')
    my_errs = my_errs + 1;
end
    
disp('phiNinv(0,0): Should equal (0,0,1)')
[x, y, z] = phiNinv(0,0);
[x, y, z]
if sum([x, y, z] - [0, 0, 1]) > epsilon
    warning('Error was made here: phiNinv')
    my_errs = my_errs + 1;
end

disp('phiS(0,0,-1): Should equal (0,0)')
[XS YS] = phiS(0,0,-1);
[XS YS]
if sum([XS YS] - [0 0]) > epsilon
    warning('Error was made here: phiS')
    my_errs = my_errs + 1;
end

disp('phiSinv(0,0): Should equal (0,0,-1)')
[x, y, z] = phiSinv(0,0);
[x, y, z]
if sum([x, y, z] - [0, 0, 1]) > epsilon
    warning('Error was made here: phiSinv')
    my_errs = my_errs + 1;
end


disp('PhiN(PhiNinv(Xtest, Ytest)): Should equal:')
[Xtest Ytest]
disp('Answer:')
[temp1 temp2 temp3] = phiNinv(Xtest, Ytest);
[XN, YN] = phiN(temp1, temp2, temp3);
[XN YN]
if sum(sum(([XN, YN] - [Xtest, Ytest]) > epsilon))
    warning('Error was made here: PhiN(PhiNinv())')
    my_errs = my_errs + 1;
end


disp('PhiS(PhiSinv(Xtest, Ytest)): Should equal:')
[Xtest Ytest]
disp('Answer:')
[temp1 temp2 temp3] = phiSinv(Xtest, Ytest);
[XN YN] = phiS(temp1, temp2, temp3);
[XN YN]
if sum(sum(([XN, YN] - [Xtest, Ytest]) > epsilon))
    warning('Error was made here: PhiS(PhiSinv())')
    my_errs = my_errs + 1;
end

disp(['Number of errors: ' num2str(my_errs)])
end

