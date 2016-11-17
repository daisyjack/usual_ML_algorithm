function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE
D = sum(W,2);
%D = sparse(diag(D));
L = diag(D) - W;
[V,~] = eigs(L, k+1, 'SA');
V = V(:,2:k+1);
idx = litekmeans(V, k);
end
