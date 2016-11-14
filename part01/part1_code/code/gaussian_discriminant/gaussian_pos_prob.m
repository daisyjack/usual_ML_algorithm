function p = gaussian_pos_prob(X, Mu, Sigma, Phi)
%GAUSSIAN_POS_PROB Posterior probability of GDA.
%   p = GAUSSIAN_POS_PROB(X, Mu, Sigma) compute the posterior probability
%   of given N data points X using Gaussian Discriminant Analysis where the
%   K gaussian distributions are specified by Mu, Sigma and Phi.
%
%   Inputs:
%       'X'     - M-by-N matrix, N data points of dimension M.
%       'Mu'    - M-by-K matrix, mean of K Gaussian distributions.
%       'Sigma' - M-by-M-by-K matrix (yes, a 3D matrix), variance matrix of
%                   K Gaussian distributions.
%       'Phi'   - 1-by-K matrix, prior of K Gaussian distributions.
%
%   Outputs:
%       'p'     - N-by-K matrix, posterior probability of N data points
%                   with in K Gaussian distributions.

N = size(X, 2);
K = length(Phi);
p = zeros(N, K);
% Your code HERE
for i = 1:N
    prior = zeros(1, K);
    sum = 0;
    %disp([num2str(i), ' data start']);
    %disp('prior start');
    for j = 1:K
        prior(j) = 1 / (2 * pi * (det(Sigma(:, :, j)) ^ 0.5)) * exp(-0.5 * (X(:, i) - Mu(:, j))' * ...
            inv(Sigma(:, :, j)) * (X(:, i) - Mu(:, j)));
        sum = sum + prior(j) * Phi(j);
    end
    %disp('prior end');
    
    for j = 1:K
        p(i, j) = prior(j) * Phi(j) / sum;
    end
    %disp([num2str(i), ' data end']);
    %N
end


