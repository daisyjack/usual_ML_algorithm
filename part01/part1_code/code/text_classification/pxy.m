function joint = pxy(x, l, pc)
%pxy joint probility of x and y p(x,y) = p(x|y) * p(y)
%
%   INPUT:  x, p test samples, p-By-N matrix
%           l, likelihood matrix, 2-By-N matrix
%           pc, class occurances, 1-By-2 vertor
%
%   OUTPUT: joint,  posterior of each class given by each feature, p-By-2 matrix
%
disp('into pxy');
[p, N] = size(x);
%joint = zeros(p, 2);
% for data = 1:p
%     disp(['data ', num2str(data)]);
%     for class = 1:2
%         joint(data, class) = log(pc(class));
%         for word = 1:N
%             joint(data, class) = joint(data, class) + log(l(class, word))*x(data, word);
%         end
%     end
%     joint(data, :)
% end
joint = x * (log(l))';
disp('out pxy')
end