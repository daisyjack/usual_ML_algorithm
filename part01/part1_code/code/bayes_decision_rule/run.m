% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%%load data
load('data');
all_x = cat(2, x1_train, x1_test, x2_train, x2_test);
range = [min(all_x), max(all_x)];
train_x = get_x_distribution(x1_train, x2_train, range)
test_x = get_x_distribution(x1_test, x2_test, range);

%% Part1 likelihood: 
l = likelihood(train_x);

bar(range(1):range(2), l');
xlabel('x');
ylabel('P(x|\omega)');
axis([range(1) - 1, range(2) + 1, 0, 0.5]);

%TODO
%compute the number of all the misclassified x using maximum likelihood decision rule
mld_mis = 0;
[C, N] = size(l);
for i = 1:N
    col = l(:, i);
    [m, n] = find(col == max(col));
    for j = 1:C
        if ~ismember(j, m)
            mld_mis = mld_mis + test_x(j, i);
        end
    end
end
% maximum likelihood decision rule misclassified
mld_mis
test_error1 = mld_mis / sum(sum(test_x))

%% Part2 posterior:
p = posterior(train_x)

bar(range(1):range(2), p');
xlabel('x');
ylabel('P(\omega|x)');
axis([range(1) - 1, range(2) + 1, 0, 1.2]);

%TODO
%compute the number of all the misclassified x using optimal bayes decision rule
obd_mis = 0;
[C, N] = size(p);
for i = 1:N
    col = p(:, i);
    [m, n] = find(col == max(col));
    for j = 1:C
        if ~ismember(j, m)
            obd_mis = obd_mis + test_x(j, i);
        end
    end
end
% optimal bayes decision rule misclassified
obd_mis
test_error2 = obd_mis / sum(sum(test_x))
%% Part3 risk:
risk = [0, 1; 2, 0];
%TODO
%get the minimal risk using optimal bayes decision rule and risk weights
[C, N] = size(p);
con_risk = zeros(2, N);
for a = 1:2
    for x = 1:N
         con_risk(a, x) = risk(a, 1) * p(1, x) + risk(a, 2) * p(2, x);
    end
end

min_total = 0;
for x = 1:N
    min_total = min_total + min(con_risk(:, x));
end
% minimal total risk
min_total