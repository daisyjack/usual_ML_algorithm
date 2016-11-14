%%load data
clear;
load('data');
all_x = cat(2, x1_train, x1_test, x2_train, x2_test);
range = [min(all_x), max(all_x)];
train_x = get_x_distribution(x1_train, x2_train, range);
test_x = get_x_distribution(x1_test, x2_test, range)

%% Part1 likelihood: 
% l = likelihood(train_x);
% train_x;
% l
A = [1,2,3,3;1,2,3,3];
B = [1;2;3];
A(1);
A = [6 9 4 5 5];
[B, I] = sort(A,'descend')
% ismember(3, A)
% %[m,i] = find(max([1,2,3,3]));