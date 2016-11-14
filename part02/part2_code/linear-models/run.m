% You can use this skeleton or write your own.
% You are __STRONGLY__ suggest to run this script section-by-section using Ctrl+Enter.
% See http://www.mathworks.cn/cn/help/matlab/matlab_prog/run-sections-of-programs.html for more details.

%% Part1: Preceptron
nRep = 1000; % number of replicates
nTrain = 10; % number of training data

sumIter = 0;
sumETest = 0;
train = 10;
test = 5;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    [w_g, iter] = perceptron(X, y);
    % Compute training, testing error
    [X_t, y_t, w_f_t] = mkdata(train + test);
    [w_t, iter_t] = perceptron(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
    % Sum up number of iterations
    sumIter = sumIter + iter;
end
avgIter = sumIter / nRep;
E_test = sumETest / nRep;
E_train = 0;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
fprintf('Average number of iterations is %d.\n', avgIter);
plotdata(X, y, w_f, w_g, 'Pecertron');

%% Part2: Preceptron: Non-linearly separable case
nTrain = 100; % number of training data
[X, y, w_f] = mkdata(nTrain, 'noisy');
[w_g, iter] = perceptron(X, y);


%% Part3: Linear Regression
nRep = 1000; % number of replicates
nTrain = 100; % number of training data

sumETrain = 0;
sumETest = 0;
train = 100;
test = 50;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = linear_regression(X, y);
    % Compute training, testing error
    sumETrain = sumETrain + 1 - sum((w_g'* [ones(1, nTrain); X] .* y) > 0) / nTrain;
    [X_t, y_t, w_f_t] = mkdata(train + test);
    w_t = linear_regression(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
end
E_train = sumETrain / nRep;
E_test = sumETest / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression');

%% Part4: Linear Regression: noisy
nRep = 1000; % number of replicates
nTrain = 100; % number of training data

sumETrain = 0;
sumETest = 0;
train = 100;
test = 50;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = linear_regression(X, y);
    % Compute training, testing error
    sumETrain = sumETrain + 1 - sum((w_g'* [ones(1, nTrain); X] .* y) > 0) / nTrain;
    [X_t, y_t, w_f_t] = mkdata(train + test);
    w_t = linear_regression(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
end
E_train = sumETrain / nRep;
E_test = sumETest / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Linear Regression: noisy');

%% Part5: Linear Regression: poly_fit
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');

w = linear_regression(X, y)
% Compute training, testing error
[p, N] = size(X);
E_train = 1 - sum((w'* [ones(1, N); X] .* y) > 0) / N;
N_test = size(X_test, 2);
E_test = 1 - sum((w'* [ones(1, N_test); X_test] .* y_test) > 0) / N_test;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
%%
load('poly_train', 'X', 'y');
load('poly_test', 'X_test', 'y_test');
% X = [1,2;3,4]
% X_test = X
% poly_fit with transform
[p, N] = size(X);
X_t = [X; X(1, :).*X(2, :); X(1, :).^2; X(2, :).^2]; % CHANGE THIS LINE TO DO TRANSFORMATION
N_test = size(X_test, 2);
X_test_t = [X_test; X_test(1, :).*X_test(2, :); X_test(1, :).^2; X_test(2, :).^2]; % CHANGE THIS LINE TO DO TRANSFORMATION
w = linear_regression(X_t, y);
% Compute training, testing error
E_train = 1 - sum((w'* [ones(1, N); X_t] .* y) > 0) / N;
E_test = 1 - sum((w'* [ones(1, N_test); X_test_t] .* y_test) > 0) / N_test;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);


%% Part6: Logistic Regression
nRep = 100; % number of replicates
nTrain = 100; % number of training data
sumETrain = 0;
sumETest = 0;
train = 100;
test = 50;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain);
    w_g = logistic(X, y);
    % Compute training, testing error
    sumETrain = sumETrain + 1 - sum((w_g'* [ones(1, nTrain); X] .* y) > 0) / nTrain;
    [X_t, y_t, w_f_t] = mkdata(train + test);
    w_t = logistic(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
end
E_train = sumETrain / nRep;
E_test = sumETest / nRep;

fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression');

%% Part7: Logistic Regression: noisy
nRep = 100; % number of replicates
nTrain = 100; % number of training data
%nTest = 10000; % number of training data
sumETrain = 0;
sumETest = 0;
train = 100;
test = 50;
for i = 1:nRep
    [X, y, w_f] = mkdata(nTrain, 'noisy');
    w_g = logistic(X, y);
    % Compute training, testing error
    sumETrain = sumETrain + 1 - sum((w_g'* [ones(1, nTrain); X] .* y) > 0) / nTrain;
    [X_t, y_t, w_f_t] = mkdata(train + test);
    w_t = logistic(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
end
E_train = sumETrain / nRep;
E_test = sumETest / nRep;
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'Logistic Regression: noisy');

%% Part8: SVM
nRep = 1000; % number of replicates
nTrain = 30; % number of training data
sumETrain = 0;
sumETest = 0;
train = 100;
test = 50;
totalSv = 0;
for i = 1:nRep  
    [X, y, w_f] = mkdata(nTrain);
    [w_g, num_sc] = svm(X, y);
    totalSv = totalSv + num_sc;
    % Compute training, testing error
    sumETrain = sumETrain + 1 - sum((w_g'* [ones(1, nTrain); X] .* y) > 0) / nTrain;
    [X_t, y_t, w_f_t] = mkdata(train + test);
    [w_t, sv] = svm(X_t(:, 1:train), y_t(1:train));
    errorRate = 1 - sum((w_t' * [ones(1, test); X_t(:, train + 1:train + test)] .* y_t(train + 1:train + test)) > 0) / test;
    sumETest = sumETest + errorRate;
    % Sum up number of support vectors
    
end
E_train = sumETrain / nRep;
E_test = sumETest / nRep;
totalSv
fprintf('E_train is %f, E_test is %f.\n', E_train, E_test);
plotdata(X, y, w_f, w_g, 'SVM');
