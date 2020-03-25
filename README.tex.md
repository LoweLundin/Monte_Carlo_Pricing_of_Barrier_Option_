# Pricing-of-Barrier-Option-Monte-Carlo

Produced for course Computational Finance: Pricing and Valuation, Autumn 2019. The project uses Monte Carlo methods to price barrier options, this specific implementation is for Up-And-Out barrier options, but can easily be modified to work for other barrier options as well. 

One function is a normal Monte Carlo simulation, while the other also uses a conditional exit probability and uniformly distributed random variables to model the price in continuous time, as described by Moon, Kyoung-Sook in [EFFICIENT MONTE CARLO ALGORITHM FOR PRICING BARRIER OPTIONS](https://pdfs.semanticscholar.org/3b2e/538f515f2e9974143b7137e41473b59af0bb.pdf?_ga=2.118237708.48659677.1585140104-859390239.1585140104). 

The results are compared to an analyical solution and plotted as a function of the number of timesteps and/or simulations. 
A method to compute the delta of the option has also been implemented.

## Usage

In MATLAB, simply run:

\begin{itemize}
\item runMethods.m , with desired parameters to compute price of option.
\item plotMethods.m , to plot estimated price and error of option as a function of timesteps/simulations.
\item deltaMC.m , to compute delta of option. Compare to slide 8 in presentation.
\end{itemize}

## Related information

Presentation hosted on [Dropbox](https://www.dropbox.com/s/gggh809j7vy6sdr/Presentation_Barrier_Option_MC.pdf?dl=0)
