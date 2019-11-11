%Read image
peppers = imread('peppers.png');

%Dimensions of image
[height, wdith, colours] = size(peppers);

%Display image
figure;
imshow(peppers);

%Convert to Grayscale
gray_peppers = rgb2gray(peppers);
imshow(gray_peppers);

%Write out file
imwrite(gray_peppers, 'gray_peppers.bmp');

%Acessing pixel in int
gray_peppers(1,1); %first pixel

%Convert vals to double
dpeppers = im2double(peppers);

%Acessing pixel in dbl
dpeppers(1,1); %first pixel