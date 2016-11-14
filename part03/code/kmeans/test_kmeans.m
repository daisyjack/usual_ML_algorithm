% a = [1 2;3 4;5 6]
% %a(randperm(3, 2),:);
% %[num, I] = max(a)
% %a(I, :);
% a([1 2 ], [1 2 1])
%%
load('kmeans_data.mat');
max = 0;
min = 0;
for i = 1:1000
    [idx, ctrs, iter_ctrs] = kmeans(X, 2);
    %kmeans_plot(X, idx, ctrs, iter_ctrs);
    dis = pdist2(X, ctrs);
    cl_dis = zeros(1, size(X, 1));
    for j = 1:size(X, 1)
        cl_dis(j) = dis(j, idx(j));
    end
    total = sum(cl_dis .^ 2);
    if i ==1
        max = total;
        min = total; 
        idx_min = idx; ctrs_min = ctrs; iter_ctrs_min = iter_ctrs;
        idx_max = idx; ctrs_max = ctrs; iter_ctrs_max = iter_ctrs;
    end
    if total > max
        max = total;
        idx_max = idx; ctrs_max = ctrs; iter_ctrs_max = iter_ctrs;
    end
    if total < min
        min = total;
        idx_min = idx; ctrs_min = ctrs; iter_ctrs_min = iter_ctrs;
    end
    fprintf('%d iter\n',i);
end
kmeans_plot(X, idx_min, ctrs_min, iter_ctrs_min);
figure;
kmeans_plot(X, idx_max, ctrs_max, iter_ctrs_max);
