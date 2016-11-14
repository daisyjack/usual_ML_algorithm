function [w, iter] = perceptron(X, y)
%PERCEPTRON Perceptron Learning Algorithm.
%
%   INPUT:  X: training sample features, P-by-N matrix.
%           y: training sample labels, 1-by-N row vector.
%
%   OUTPUT: w:    learned perceptron parameters, (P+1)-by-1 column vector.
%           iter: number of iterations
%

% YOUR CODE HERE
%%
% X = [1,2,3,-1]
% X(1)
% if [1, 1]
%     15
% end
%%
[p, N] = size(X);
X = [ones(1, N); X];
w = rand(p + 1, 1);
iter = 0;
k = 1;
while true
    if (w' * X) .* y > 0
        fprintf('iter %d.\n', iter);
        disp(['correct', iter]);
        disp(w);
        break;
    end
    sample = X(:, k);
    if w' * sample * y(k) <= 0
        w = w + sample * y(k);
        iter = iter + 1;
        %fprintf('one loop %d.\n', k);
    end
    k = k + 1;
    if k == N + 1
        k = 1;
    end
end
%%
end
