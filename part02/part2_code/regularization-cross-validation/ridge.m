function w = ridge(X, y, lambda)
%RIDGE Ridge Regression.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w: learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
[p, N] = size(X);
X = [ones(1, N); X];
w = pinv((X * X' + lambda * eye(p+1))) * X * y';
%w = (X * X')^-1 * X * y';
end
