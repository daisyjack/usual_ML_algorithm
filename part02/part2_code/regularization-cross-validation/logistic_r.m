function w = logistic_r(X, y, lambda)
%LR Logistic Regression.
%
%   INPUT:  X:   training sample features, P-by-N matrix.
%           y:   training sample labels, 1-by-N row vector.
%           lambda: regularization parameter.
%
%   OUTPUT: w    : learned parameters, (P+1)-by-1 column vector.
%

% YOUR CODE HERE
y(find(y == -1)) = 0;
[p, N] = size(X);
X = [ones(1, N); X];
w = rand(p + 1, 1);
a = 0.001;
%w_pre = w;
%w = w + a * X * (y' - (1 ./ (1 + exp(w' * X * -1))'));
iter = 0;
while iter < 500
    w = w + a * (X * (y' - (1 ./ (1 + exp(w' * X * -1))')) + 2*lambda*w);
    iter = iter + 1;
end
end
