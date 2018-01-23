load('best.mat');

x_test = ones(1,10003);
y_test = ones(1,1);

files = dir('../dataset/test/final/rice/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/rice/',file.name));
    dominantRedValue = mean2(temp(:, :, 1));
    dominantGreenValue = mean2(temp(:, :, 2));
    dominantBlueValue = mean2(temp(:, :, 3));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)', dominantBlueValue, dominantRedValue, dominantGreenValue];
    y_test = [y_test;1];
end

files = dir('../dataset/test/final/bread/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/bread/',file.name));
    dominantRedValue = mean2(temp(:, :, 1));
    dominantGreenValue = mean2(temp(:, :, 2));
    dominantBlueValue = mean2(temp(:, :, 3));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)', dominantBlueValue, dominantRedValue, dominantGreenValue];
    y_test = [y_test;2];
end

files = dir('../dataset/test/final/meat/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/meat/',file.name));
    dominantRedValue = mean2(temp(:, :, 1));
    dominantGreenValue = mean2(temp(:, :, 2));
    dominantBlueValue = mean2(temp(:, :, 3));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)', dominantBlueValue, dominantRedValue, dominantGreenValue];
    y_test = [y_test;3];
end

files = dir('../dataset/test/final/pizza/*.jpg');
for file = files'
    file.name
    temp = imread(strcat('../dataset/test/final/pizza/',file.name));
    dominantRedValue = mean2(temp(:, :, 1));
    dominantGreenValue = mean2(temp(:, :, 2));
    dominantBlueValue = mean2(temp(:, :, 3));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)', dominantBlueValue, dominantRedValue, dominantGreenValue];
    y_test = [y_test;4];
end

% temp = imread('../dataset/test/final/rice/rice1.jpg');
% temp = rgb2gray(temp);
% 
% figure
% imshow(mat2gray(temp));

x_test =  x_test(2:end, :);
y_test = y_test(2:end, :);

res = predict(Theta1, Theta2, double(x_test))

fprintf('\nTraining Set Accuracy: %f\n', mean(double(res == y_test)) * 100);

