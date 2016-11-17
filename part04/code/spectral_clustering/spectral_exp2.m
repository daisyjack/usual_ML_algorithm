load('TDT2_data', 'fea', 'gnd');

% YOUR CODE HERE
%fea = rand(50,15);
%gnd = [ones(10,1);ones(15,1)*2;ones(10,1)*3;ones(15,1)*4];
[n, p] = size(fea);
a = unique(gnd);
Possibles = perms(a);
clu_num = size(a, 1);
sum_acu = 0;
sum_mul = 0;
loop = 10;
%% spectral
options = [];
options.NeighborMode = 'Supervised';
options.gnd = gnd;
%options.WeightMode = 'HeatKernel';
%options.bLDA = 0;
options.t = 1;
W = constructW(fea,options);
idx = spectral_s(W, clu_num);
% pos = Possibles(1, :);
% mul = MutualInfo(pos(idx)', gnd);
for j = 1:loop
    idx = spectral(W, clu_num);
    max_acu = 0;
    max_mul = 0;
    idx_i = idx;
    class_idx = 1;
    class_idx_mul = 1;
    for i = 1:size(Possibles, 1)
        possible = Possibles(i, :);
        idx_i = possible(idx)';
        correct = sum(idx_i == gnd);
        acu = correct / n;
        if acu > max_acu
            max_acu = acu;
            class_idx = i;
        end
        mul = MutualInfo(idx_i, gnd);
        if mul > max_mul
            max_mul = mul;
            class_idx_mul = i;
        end
    end
    sum_acu = sum_acu + max_acu;
    sum_mul = sum_mul + max_mul;
end
avg_acu = sum_acu / loop;
avg_mul = sum_mul / loop;
%%  k-means
for j = 1:loop
    idx = litekmeans(fea, clu_num);
    Possibles = perms(a);
    max_acu = 0;
    max_mul = 0;
    idx_i = idx;
    class_idx = 1;
    class_idx_mul = 1;
    for i = 1:size(Possibles, 1)
        possible = Possibles(i, :);
        idx_i = possible(idx)';
        aa = sum(idx_i == gnd);
        correct = sum(idx_i == gnd);
        acu = correct / n;
        if acu > max_acu
            max_acu = acu;
            class_idx = i;
        end
        mul = MutualInfo(idx_i, gnd);
        if mul > max_mul
            max_mul = mul;
            class_idx_mul = i;
        end
    end
    sum_acu = sum_acu + max_acu;
    sum_mul = sum_mul + max_mul;
end
avg_acu = sum_acu / loop;
avg_mul = sum_mul / loop;