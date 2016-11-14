function [w, num] = svm(X, y)
%SVM Support vector machine.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           num:  number of support vectors
%

% YOUR CODE HERE
[p, N] = size(X);
X = [ones(1, N); X];
H = eye(p+1);
H(1, 1) = 0;
A = -1 * repmat(y', 1, p+1) .* X';
b = -ones(N, 1);
w = quadprog(H,[],A,b);
%X' * w
num = sum((X' * w .* y') == 1);
end
