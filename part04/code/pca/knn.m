function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE
%%
dis = pdist2(X', X_train');
%X = [1 8 4;3 7 1;4 8 1]
%y_train = [1 0 1]
[B, In] = sort(dis, 2, 'ascend');
%K = 2
I = In(:, 1:K);
temp = y_train(I);
if K == 1
    %temp = temp';
    y = temp;
else
    [count out]= hist(temp', 0:max(max(temp)));
    [num idx] = max(count);
    y = out(idx)';
end

% %%
% y_result = sum(temp, 2);
% bigger = y_result > K/2;
% smaller = y_result < K/2;
% equal = y_result == K/2;
% y_result(bigger) = 1;
% y_result(smaller) = 0;
% y_result(equal) =  randi([0,1],1);
% y = y_result';
end

