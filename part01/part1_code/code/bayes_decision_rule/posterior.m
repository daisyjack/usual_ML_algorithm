function p = posterior(x)
%POSTERIOR Two Class Posterior Using Bayes Formula
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: p,  posterior of each class given by each feature, C-By-N matrix
%

[C, N] = size(x);
l = likelihood(x);
total = sum(sum(x));
%TODO
feature_total = sum(x);
class_total = sum(x');
p = zeros(C, N);
for class = 1:C
    for feature = 1:N
        p(class, feature) = (l(class, feature) * class_total(class) / total) / (feature_total(feature) / total);
    end
end


end
