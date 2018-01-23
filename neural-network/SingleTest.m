load('test2.mat');

temp = imread('../dataset/test/final/pizza/pizza9.jpg');
dominantRedValue = mean2(temp(:, :, 1));
dominantGreenValue = mean2(temp(:, :, 2));
dominantBlueValue = mean2(temp(:, :, 3));
temp = rgb2gray(temp);
x_test = [temp(:)', dominantBlueValue, dominantRedValue, dominantGreenValue];

predict(Theta1, Theta2, double(x_test))