% Load the input img
img = imread("softstone.PNG");
img_gray =rgb2gray(img);
% Create the convolution mask
mask = [1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9;];
% Create an output img with the same dimensions as the input img
blurred_img = zeros(size(img_gray));
% Looping over the rows and columns of the img
for i = 1:size(img_gray,1)
    for j = 1:size(img_gray,2)
        % Looping over the rows and columns of the convolution mask
        for m = 1:size(mask,1)
            for n = 1:size(mask,2)
                % Checking if the current position in the mask is within the bounds of the img
                if (i + m - 2 >= 1 && i + m - 2 <= size(img_gray,1)) && (j + n - 2 >= 1 && j + n - 2 <= size(img_gray,2))
                    % Perform the convolution
                    blurred_img(i,j) = blurred_img(i,j) + img_gray(i + m - 2, j + n - 2) * mask(m,n);
                end
            end
        end
    end
end
img_blured= uint8(blurred_img);
% subtract the blured img form the original 
img_gray_blur = (img_gray - img_blured);
% the k constant greater than 1
k = 2;
% apply the constant to the img
img_k_gray_blur = k*(img_gray_blur);
% high-boost filtering
filter_img = img_gray + img_k_gray_blur;

subplot(2, 3, 1);
imshow(img);
title('Original image');
subplot(2, 3, 2);
imshow(img_gray);
title('Gray image');
subplot(2, 3, 3);
imshow(img_blured);
title('Blur image');
subplot(2, 3, 4);
imshow(img_gray_blur);
title('Original - Blur image');
subplot(2, 3, 5);
imshow(img_k_gray_blur);
title('k*(Original - Blur image)');
subplot(2, 3, 6);
imshow(filter_img);
title('filtered image');
