img = imread('sample3.jpg');
fea = double(reshape(img, size(img, 1)*size(img, 2), 3));
% YOUR (TWO LINE) CODE HERE
K = 64;
[idx, ctrs, iter_ctrs] = kmeans(fea, K);
fea = ctrs(idx, :);
imshow(uint8(reshape(fea, size(img))));
