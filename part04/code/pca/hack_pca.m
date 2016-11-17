function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation

img_r = double(imread(filename));

% YOUR CODE HERE
[dig_row, dig_col] = find(img_r < 255);
[eigvector, eigvalue] = pca([dig_row, dig_col], 1);

img = imrotate(img_r, atand(eigvector(1) / eigvector(2)));
end