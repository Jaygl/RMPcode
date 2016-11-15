load('twolink_testData')
fps = 5;
figure
plot(points(1,:),points(2,:), 'k.')
hold on
[theta1Path theta2Path] = twolink_search(3.62, 0.85, 3.62, 5.54);
twolink_animatePath(theta1Path, theta2Path, fps);

figure
plot(points(1,:),points(2,:), 'k.')
hold on
[theta1Path theta2Path] = twolink_search(2.77, 2.45, 1.06, 1.814);
twolink_animatePath(theta1Path, theta2Path, fps);