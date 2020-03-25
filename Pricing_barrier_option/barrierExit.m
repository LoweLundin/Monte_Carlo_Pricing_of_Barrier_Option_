function barEx = barrierExit(s_zero, K, B, r, sigma, sigVar, T, gamma, Sims, timesteps)

V(1:Sims) = s_zero;
P(1:timesteps) = 0;

payOff(1:Sims) = 0;

if sigVar ~= 0
    end

dt=T/timesteps;

for s=1:1:Sims
    loopIndex = 1;
    bBlown = 0;
    
    for t=dt:dt:T
        dW=normrnd(0,1)*sqrt(dt);
        
        sBef = V(s);
        V(s)=V(s)+r*(V(s))*dt + sigma*((V(s)).^gamma)*dW;
        sPost = V(s);
        
        if V(s) >= B
            V(s) = 0;
            %disp('barrier has been blown!')
            bBlown = 1;
            break
        end
        
        P(loopIndex) = exp(-2*(B-sBef)*(B-sPost)/(sigma^2 * sBef^2 * dt));
        loopIndex = loopIndex + 1;
    end
    
    if bBlown == 0
        U = rand(1, timesteps);
        greaterArr = P > U;
        
        if sum(greaterArr)
            V(s) = 0;
        end 
    end
end

for s=1:1:Sims
    payOff(s) = max(V(s)-K, 0);
end

x=mean(payOff);
%fprintf("Mean of payoff: %f \n", x);

val = x * exp(-r * T);
%fprintf("Now value is %f", val)

barEx = val;

end