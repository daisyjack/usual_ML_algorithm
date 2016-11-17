load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% YOUR CODE HERE

% 1. Feature preprocessing
%% 2. Run PCA
%show_face(fea_Train);
dim = 128;
[eigvector_Train, eigvalue_Train] = pca(fea_Train, dim);
[eigvector_Test, eigvalue_Test] = pca(fea_Test, dim);
%% 3. Visualize eigenface
%show_face(eigvector_Train');
%% 4. Project data on to low dimensional space
eig_fea_Train = fea_Train * eigvector_Train;
eig_fea_Test = fea_Test * eigvector_Train;
%% 5. Run KNN in low dimensional space
% y_test = knn(eig_fea_Test', eig_fea_Train', gnd_Train', 1)';
% error = 1 - sum(y_test == gnd_Test) / size(gnd_Test, 1);
%% 6. Recover face images form low dimensional space, visualize them
show_face(eig_fea_Train * eigvector_Train');