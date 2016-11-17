function [idx, ctrs, iter_ctrs] = kmeans(X, K)
%KMEANS K-Means clustering algorithm
%
%   Input: X - data point features, n-by-p maxtirx.
%          K - the number of clusters
%
%   OUTPUT: idx  - cluster label 1-by-n
%           ctrs - cluster centers, K-by-p matrix.
%           iter_ctrs - cluster centers of each iteration, K-by-p-by-iter
%                       3D matrix.

% YOUR CODE HERE
[n, p] = size(X);
ctrs = X(randperm(n, K), :);
iter_ctrs(:,:,1) = ctrs;
iter = 2;
while true
    dis = pdist2(X, ctrs);
    [num, idx] = min(dis');
    if iter ~= 2 && all(idx == pre_idx)
        break;
    end
    %kmeans_plot(X, idx, ctrs, iter_ctrs);
%     if iter == 1000
%         break;
%     end
    pre_idx = idx;
    
    for cluster = 1:K
        cluster_sample = X(idx == cluster, :);
        ctrs(cluster, :) = sum(cluster_sample, 1) / size(cluster_sample, 1);
    end
    iter_ctrs(:, :, iter) = ctrs;
    %fprintf('%d iter finished\n',iter);
    iter = iter + 1;
end
end
