% mu: 2x1 matrix
% Sigma: 2x2 matrix
% phi: a number
%%
mu0 = [0;0];
Sigma0 = [1,0;0,1];
mu1 = [1;1];
Sigma1 = Sigma0;
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line', 1);
%%
mu0 = [0, 0];
Sigma0 = [1,0;0,1];
mu1 = [1, 1];
Sigma1 = [1,0;0,1];
phi = 0.99;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Line (one side)', 2);
%%
mu0 = ;
Sigma0 = ;
mu1 = ;
Sigma1 = ;
phi = ;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Parabalic', 3);
%%
mu0 = [0, 0];
Sigma0 = [1,0.5;0.5,1];
mu1 = [1, 1];
Sigma1 = [1,0.4;0.4,1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Hyperbola', 4);
%%
mu0 = [0, 0];
Sigma0 = [1,0.99;0.99,1];
mu1 = [1, 1];
Sigma1 = [1,0;0,1];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Two parallel lines.', 5);
%%
mu0 = [0, 0];
Sigma0 = [1, 0; 0, 1];
mu1 = [0, 0];
Sigma1 = [0.6, 0; 0, 0.6];
phi = 0.5;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Circle', 6);
%%
mu0 = _;
Sigma0 = _;
mu1 = _;
Sigma1 = _;
phi = _;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'Ellipsoid', 7);

mu0 = _;
Sigma0 = _;
mu1 = _;
Sigma1 = _;
phi = _;
plot_ex1(mu0, Sigma0, mu1, Sigma1, phi, 'No boundary', 8);
