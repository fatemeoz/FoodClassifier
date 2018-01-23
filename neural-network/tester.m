load('test.mat');

x_test = ones(1,10000);
y_test = ones(1,1);

files = dir('../dataset/test/final/rice/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/rice/',file.name));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)'];
    y_test = [y_test;1];
end

files = dir('../dataset/test/final/bread/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/bread/',file.name));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)'];
    y_test = [y_test;2];
end

files = dir('../dataset/test/final/meat/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/meat/',file.name));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)'];
    y_test = [y_test;3];
end

files = dir('../dataset/test/final/pizza/*.jpg');
for file = files'
    temp = imread(strcat('../dataset/test/final/pizza/',file.name));
    temp = rgb2gray(temp);
    x_test = [x_test; temp(:)'];
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

