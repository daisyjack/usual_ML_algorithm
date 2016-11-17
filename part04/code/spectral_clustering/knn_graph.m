function W = knn_graph(X, k, threshold)
%KNN_GRAPH Construct W using KNN graph
%   Input: X - data point features, n-by-p maxtirx.
%          k - number of nn.
%          threshold - distance threshold.
%
%   Output:W - adjacency matrix, n-by-n matrix.

% YOUR CODE HERE
%[D, I] = pdist2(X, X, 'euclidean', 'Smallest', k+1);
dis = pdist2(X, X);
[D, idx] = sort(dis');
[n, p] = size(X);
A = zeros(n);
for i = 1:n
    A(i, idx(1:k+1, i)) = 1;
    %A(i, I(find(D(:, i) > threshold), i)) = 0;
end
A(dis > threshold) = 0;
W = max(A, A');
W(logical(eye(n))) = 0;
end
