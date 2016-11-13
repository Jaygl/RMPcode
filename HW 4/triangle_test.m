%Generates a random triangle and 500 random points to test whether they are
%inside or outside of the triangle. All those inside are marked with a red
%circle, all those outside are marked with a black x

vertices = rand([2 3]);
triangleDraw(vertices, 'k')

test_points = rand(2, 500);

flagPoints = triangleCheckCollision(test_points, vertices);

for n = 1:size(test_points, 2)
    if flagPoints(n)
        plot(test_points(1,n),test_points(2,n), 'kx')
    else
        plot(test_points(1,n),test_points(2,n), 'ro')
    end
end

