% Load the img and convert to grayscale
img = imread("noisyImage.PNG");
img_gray = rgb2gray(img);

% Get the size of the img
[img_rows, img_cols] = size(img_gray);

% Create an array to store the result of the median filter
median_img = zeros(img_rows, img_cols);

% Apply the median filter to each pixel in the img
for row = 1:img_rows
    for col = 1:img_cols
        % Define the neighborhood of the current pixel
        neighborhood = zeros(3, 3);
        neighborhood(1, 1) = img_gray(max(1, row-1), max(1, col-1));
        neighborhood(1, 2) = img_gray(max(1, row-1), col);
        neighborhood(1, 3) = img_gray(max(1, row-1), min(img_cols, col+1));
        neighborhood(2, 1) = img_gray(row, max(1, col-1));
        neighborhood(2, 2) = img_gray(row, col);
        neighborhood(2, 3) = img_gray(row, min(img_cols, col+1));
        neighborhood(3, 1) = img_gray(min(img_rows, row+1), max(1, col-1));
        neighborhood(3, 2) = img_gray(min(img_rows, row+1), col);
        neighborhood(3, 3) = img_gray(min(img_rows, row+1), min(img_cols, col+1));

        % Compute the median of the values in the neighborhood
        median_img(row, col) = median(neighborhood(:));
    end
end
% converting the img into 8 - bit to make it seen
median_img  = uint8(median_img);
% Display the result of the median filter
subplot(1,2,1);
imshow(img);
title("Original image");
subplot(1,2,2);
imshow(median_img);
title("Filtered image");
