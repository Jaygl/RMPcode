%% Question 1.2 - Line Check Side Function
    function [isPtInside] = lineCheckSide(p,a,b,c)
% This function determines whether a point called 'p' is on the correct
% side of a line. It is performed by creating 3 vectors. Imagine 'a', 'b',
% and 'c' are 3 corners of a triangle. Then vector 'ab' is a->b, 'ac' is
% a->c, and 'ap' is a->p. By taking the cross product of 'ab' with 'ap' and
% of 'ab' with 'ac', one can determine whether point 'p' is on the correct
% side of the line or not, as long as both cross products are the same sign

% Calculate components of vectors 'ab', 'ac', and 'ap'
    abx = b(1) - a(1);
    aby = b(2) - a(2);
    apx = p(1) - a(1);
    apy = p(2) - a(2);
    acx = c(1) - a(1);
    acy = c(2) - a(2);

% Calculate cross product of vectors 'ab' and 'ap' (ab x ap)
    cp1 = abx*apy - aby*apx;
    
% Calculate cross product of vectors 'ab' and 'ac' (ab x ac)
    cp2 = abx*acy - aby*acx;

% Assign logical values to define where point is
    if cp1*cp2 > 0
        isPtInside = 1; % p is on correct side of line
    elseif cp1*cp2 < 0
        isPtInside = 0; % p is not on correct side of line
    end
    end