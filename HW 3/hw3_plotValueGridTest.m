function hw3_plotValueGridTest
x=0:1:10;
y=-1:1:5;
val=round(1000*rand(length(y)-1,length(x)-1));
disp(val)
hw3_plotValueGrid(x,y,val)
axis equal

