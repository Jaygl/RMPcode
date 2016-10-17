function [] = sphereworld_plot_test()
%Simple function to test the functionality of
%sphereworld_plot(world,xGoal). Loads the data in sphereworld.mat and then
%uses sphereworld_plot to display the information.

load('sphereworld.mat')
sphereworld_plot(world,xGoal)

end