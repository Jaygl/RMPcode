syms X Y
jacobian([2*X/(1+X^2+Y^2), 2*Y/(1+X^2+Y^2), (1-X^2-Y^2)/(1+X^2+Y^2)], [X, Y])

