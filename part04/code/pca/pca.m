function [eigvector, eigvalue] = PCA(data, k)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The sorted eigvalue of PCA eigen-problem.
%

% YOUR CODE HERE
[n, p] = size(data);
avg = sum(data, 1) / n;
avg_data = repmat(avg, n, 1);
sigma = (data - avg_data)' * (data - avg_data);
[eigvector, eigvalue] = eigs(sigma,[], k);
eigvalue = sum(eigvalue, 1);
end