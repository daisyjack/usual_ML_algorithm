function idx = spectral(W, k)
%SPECTRUAL spectral clustering
%   Input:
%     W: Adjacency matrix, N-by-N matrix
%     k: number of clusters
%   Output:
%     idx: data point cluster labels, n-by-1 vector.

% YOUR CODE HERE
D = diag(sum(W, 2));
L = D - W;
[vectors, values] = eigs(L,[], k+1, 'sa');
% [~, v_idx] = sort(sum(values), 'ascend');
% vectors = vectors(:, v_idx);
vectors = vectors(:, 2:k+1);
idx = litekmeans(vectors, k);
% %%
% a = [1 2 3;4 5 6;4 5 6];
% %a([true, false,true;true, false,true]) = 0;
% a(logical(eye(3)))=0
end
