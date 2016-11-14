%ham_train contains the occurrences of each word in ham emails. 1-by-N vector
ham_train = csvread('ham_train.csv');
%spam_train contains the occurrences of each word in spam emails. 1-by-N vector
spam_train = csvread('spam_train.csv');
%N is the size of vocabulary.
N = size(ham_train, 2);
%There 9034 ham emails and 3372 spam emails in the training samples
num_ham_train = 9034;
num_spam_train = 3372;
%Do smoothing
x = [ham_train;spam_train] + 1;

%ham_test contains the occurences of each word in each ham test email. P-by-N vector, with P is number of ham test emails.
load ham_test.txt;
ham_test_tight = spconvert(ham_test);
ham_test = sparse(size(ham_test_tight, 1), size(ham_train, 2));
ham_test(:, 1:size(ham_test_tight, 2)) = ham_test_tight;
%spam_test contains the occurences of each word in each spam test email. Q-by-N vector, with Q is number of spam test emails.
load spam_test.txt;
spam_test_tight = spconvert(spam_test);
spam_test = sparse(size(spam_test_tight, 1), size(spam_train, 2));
spam_test(:, 1:size(spam_test_tight, 2)) = spam_test_tight;

%TODO
%% Implement a ham/spam email classifier, and calculate the accuracy of your classifier
% l, the likelihood matrix, p(x|y), 2-By-N matrix, N is the number of words
% ham word1 ... wordN
% spam word1 ... wordN
l = zeros(2, N);
class_sum = sum(x');
for class = 1:2
    for word = 1:N
        l(class, word) = x(class, word) / class_sum(class);
    end
end
%% calculate the largest P(word|SPAM)/P(word|HAM)
div = l(2, :) ./ l(1, :);
largest_div = l(2, 1) / l(1, 1);
largest_word = 1;
% for word = 1:N
%     temp = l(2, word) / l(1, word);
%     if temp > largest_div
%         largest_div = temp;
%         largest_word = word;
%     end
% end
[sort_div, Index] = sort(div, 'descend');
top(1) = sort_div(1);
j = 1;
%top_index(1, 1) = Index(1)
% for i = 1:10
%     
% end
cat = 0;
for i = 1:size(sort_div, 2)
    if j <= 10
        if sort_div(i) ~= top(j)
            cat = 0;
            j = j + 1;
            top(j) = sort_div(i);
        end
        cat = cat + 1;
        top_index(j, cat) = Index(i);
    end 
end
top_index
largest_div
largest_word
%% identify ham email 
% pc, p(y=class1) and p(y=class2)
pc = [0, 0];
pc(1) = num_ham_train / (num_ham_train + num_spam_train);
pc(2) = num_spam_train / (num_ham_train + num_spam_train);
%spam_test
joint1 = pxy(ham_test, l, pc);
p1 = size(ham_test, 1);
tp = 0;
fp = 0;
fn = 0;
tn = 0;
for data = 1:p1
    if joint1(data, 1) >= joint1(data, 2)
        tn = tn +1;
    else
        fp = fp + 1;
    end
end
joint2 = pxy(spam_test, l, pc);
p2 = size(spam_test,1)
for data = 1:p2
    if joint2(data, 1) >= joint2(data, 2)
        fn = fn + 1;
    else
        tp = tp + 1;
    end
end
precision = tp / (tp + fp)
recall =  tp / (tp + fn)