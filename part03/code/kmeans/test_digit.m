load('digit_data.mat');
%show_digit(X);
K = 30;
[idx, ctrs, iter_ctrs] = kmeans(X, K);
show_digit(ctrs);