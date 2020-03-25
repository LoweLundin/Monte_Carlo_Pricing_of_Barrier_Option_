close all;

absplot = 1;
diffPlot = 1;

xAxLog = log10(times); %Change this to xAxLog = log10(simulations) if you want to plot as a function of the number of simulations

if absplot == 1
    
    figure()
    plot(xAxLog, barExitMat,'-o');
    hold on
    plot(xAxLog, barMat, '-o');
    plot(xAxLog, barExactMat,'-o');
    
    legend('Barrier, MC with conditional exit probability method', 'Barrier, MC', 'ExactValue')
    xlabel('Logarithm of number of timesteps')
    ylabel('Predicted price of option')
end

if diffPlot == 1
    
    diffBar = abs(barMat-barExactMat);
    diffBarExit = abs(barExitMat-barExactMat);
    
    figure()
    plot(xAxLog, diffBarExit,'-o');
    hold on
    plot(xAxLog, diffBar, '-o');
    
    legend('Barrier, MC with conditional exit probability method', 'Barrier, MC')
    xlabel('Logarithm of number of timesteps')
    ylabel('Error compared to exact')
end
