% Load img
img = imread('Phoenix.PNG');

% calculate histogram of img
hist = zeros(256, 1); % initialize histogram array
for i = 1:size(img, 1)
  for j = 1:size(img, 2)
    % increment count for intensity value at (i,j)
    hist(img(i,j) + 1) = hist(img(i,j) + 1) + 1;
  end
end
% calculate CDF of histogram
cdf = zeros(256, 1); % initialize CDF array
cdf(1) = hist(1);
for i = 2:256
  % calculate CDF as cumulative sum of histogram
  cdf(i) = cdf(i-1) + hist(i);
end
cdf = cdf / numel(img); % normalize CDF

% map intensity values in img to new values using CDF
img_eq = zeros(size(img, 1), size(img, 2)); % initialize equalized img
for i = 1:size(img, 1)
  for j = 1:size(img, 2)
    % map intensity value at (i,j) using CDF
    img_eq(i,j) = cdf(img(i,j) + 1);
  end
end

% plot original and equalized histograms
figure;
subplot(2,2,1);
bar(hist);
title('Original histogram');
subplot(2,2,2);
bar(imhist(img_eq));
title('Equalized histogram');

% display original and equalized images
subplot(2,2,3);
imshow(img);
title('Original image');
subplot(2,2,4);
imshow(img_eq);
title('Equalized image');
