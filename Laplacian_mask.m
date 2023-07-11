% Load the image and the Laplacian mask
img = imread("moon.tif");
img = im2double(img);
% Create the mask with the Laplacian operator values
mask = [1 1 1; 1 -8 1; 1 1 1];
sharp_img = zeros(size(img));

for i = 1:size(img,1)
    for j = 1:size(img,2)
        sum = 0;
        % Loop over the rows and columns of the convolution mask
        for m = 1:size(mask,1)
            for n = 1:size(mask,2)
                % Checking if the current position in the mask is within the bounds of the img
                if (i + m - 2 >= 1 && i + m - 2 <= size(img,1)) && (j + n - 2 >= 1 && j + n - 2 <= size(img,2))
                    % Perform the convolution
                    sharp_img(i,j) = sharp_img(i,j) + img(i + m - 2, j + n - 2) * mask(m,n);
                end
            end
        end
    end
end

filter_img = img - sharp_img;
subplot(1,2,1);
imshow(img);
title("Original image");
subplot(1,2,2);
imshow(filter_img);
title("Filtered image");
