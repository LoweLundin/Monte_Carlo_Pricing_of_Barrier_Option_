function bar = barrier(s_zero, K, B, r, sigma, sigVar, T, gamma, Sims, timesteps)

V(1:Sims) = s_zero;

payOff(1:Sims) = 0;

if sigVar ~= 0
    end

dt=T/timesteps;

for s=1:1:Sims
    for t=dt:dt:T
        dW=normrnd(0,1)*sqrt(dt);
        
        V(s)=V(s)+r*(V(s))*dt + sigma*((V(s)).^gamma)*dW;
        
        if V(s) >= B
            V(s) = 0;
            %disp('barrier has been blown!')
            break
        end          
    end
end

for s=1:1:Sims
    payOff(s) = max(V(s)-K, 0);
end

x=mean(payOff);
%fprintf("Mean of payoff: %f \n", x);

nowVal = x * exp(-r * T);
%fprintf("Now value is %f", val)

bar = nowVal;

end