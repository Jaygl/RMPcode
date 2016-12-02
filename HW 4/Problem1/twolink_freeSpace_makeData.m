function [  ] = twolink_freeSpace_makeData(  )
%TWOLINK_FREESPACE_MAKEDATA generate the test data set for the twolink
%manipulator path planning. Saves a file twolink_freeSpace_data.mat with
%theta1Grid, theta2Grid, and graphVector. By default, uses 90 points for
%the lengths of theta1 and theta2 Grids. Loads the obstacle data defined as
%points from the file twolink_testData. This is used to generate freespace
%model (using twolink_freeSpace) and subsequently the graphVector (using
%grid2graph).

%Default value of 90.
npoints = 90;
%Load the point data for obstacles
load('twolink_testData')
%Generate the freespace model using the obstacles above
[theta1Grid theta2Grid flag] = twolink_freeSpace(points, npoints);
%Turn this model into the graphVector structure
graphVector = grid2graph(theta1Grid, theta2Grid, flag);
%Save the data
save('twolink_freeSpace_data', 'theta1Grid', 'theta2Grid', 'graphVector')

end

