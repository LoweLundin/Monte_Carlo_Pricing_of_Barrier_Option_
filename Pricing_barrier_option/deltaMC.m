close all, clear all

gamma = 1;
K = 15;
r = 0.1; 
sigma = 0.25;
B=20;
sigVar = 0;
T = 0.5;

randn('seed', 10);

M = 10^4;% number of trajectories 
N = 10^2; % number of time steps
delta = zeros(size(N));
S0 = linspace(1,60,60);
h =waitbar(0, sprintf('loading trajectories'));

sDiff = S0(2)-S0(1);

for i = 1:length(S0)
    %Swap out both sDiff's used for S0(i)*0.5 to get smoother graph
    delta(i) = (barrierExit(S0(i), K, B, r, sigma, sigVar, T, gamma, M, N) - barrierExit(S0(i)-sDiff, K, B, r, sigma, sigVar, T, gamma, M, N))/(sDiff);
    waitbar(i/length(S0),h);
end

close(h)

plot(S0, delta);
title('Delta of the option, MC')
xlabel('Price of the underlying stock')
ylabel('Delta')

%In presentation "Pricing of Barrier Option Using Monte Carlo Methods",
%linked to in GitHub-repository, the analytical delta graph is displayed on slide 8. 