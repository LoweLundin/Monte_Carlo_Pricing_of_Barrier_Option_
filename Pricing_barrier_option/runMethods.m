clear all

s_zero = 14;
T = 0.5;
K = 15;
B = 20;
sigma = 0.25;
r = 0.1;
gamma = 1;
sigVar = 0.9;

rng(100, 'twister');  %Seeding random number generator

%Feel free to try our different values for times and simulations, but mind
%that complexity is O(times*simulations), meaning that the problem scales
%quickly.
times = [1 10 20 40 60 80 100]; % Timesteps to run simulation with
simulations = 10000; % Number of simulations to run, 10^6 recommended for accurate results, but is time consuming

numOfSim = length(simulations);
numOfStep = length(times);

barMat(numOfStep:numOfSim) = 0;
barExitMat(numOfStep:numOfSim) = 0;
barExactMat(numOfStep:numOfSim) = 0;

stepIndex = 1;
simIndex = 1;

tic;

exactValue = barrierExact(s_zero, K, B, r, sigma, T);

for steps = times 
    for sims = simulations 
        
        barMat(stepIndex, simIndex) = barrier(s_zero, K, B, r, sigma, sigVar, T, gamma, sims, steps);
        barExitMat(stepIndex, simIndex) = barrierExit(s_zero, K, B, r, sigma, sigVar, T, gamma, sims, steps);
        barExactMat(stepIndex, simIndex) = exactValue;

        simIndex = simIndex +1;
    end
    
    stepIndex = stepIndex +1;
    simIndex = 1;
end

toc
