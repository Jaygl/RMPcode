function [  ] = twolink_freeSpace_makeData( npoints )
%TWOLINK_FREESPACE_MAKEDATA Summary of this function goes here
%   Detailed explanation goes here

load('twolink_testData')
[theta1Grid theta2Grid flag] = twolink_freeSpace(points, npoints);
graphVector = grid2graph(theta1Grid, theta2Grid, flag);
save('twolink_freeSpace_data', 'theta1Grid', 'theta2Grid', 'graphVector')

end

