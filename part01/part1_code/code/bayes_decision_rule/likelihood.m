function l = likelihood(x)
%LIKELIHOOD Different Class Feature Liklihood 
%
%   INPUT:  x, features of different class, C-By-N vector
%           C is the number of classes, N is the number of different feature
%
%   OUTPUT: l,  likelihood of each feature(from smallest feature to biggest feature) given by each class, C-By-N matrix
%

[C, N] = size(x);
l = zeros(C, N);
%TODO
class_sum = zeros(1, C);
for class = 1:C
    for feature = 1:N
        class_sum(class) = class_sum(class) + x(class, feature);
    end
end
for class = 1:C
    for feature = 1:N
        l(class, feature) = x(class, feature) / class_sum(class);
    end
end

end
