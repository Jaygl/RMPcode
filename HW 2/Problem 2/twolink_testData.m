function [  ] = twolink_testData(  )
%TWOLINKTESTDATA Generates a set of 20 random x,y pairs and saves them to
%the variable 'points' in the file 'twolink_testData.mat'

points = 20*(rand(2,20)-.5);
save('twolink_testData', 'points')

end

