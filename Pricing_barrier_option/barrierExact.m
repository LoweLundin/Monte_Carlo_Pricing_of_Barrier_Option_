function res = barrierExact(s, K, B, r, sigma, T)

a = (B/s)^(-1+(2*r/sigma^2));
b = (B/s)^(1+(2*r/sigma^2));

d1 = (log(s/K) + (r + 0.5*sigma^2)*T )/(sigma*sqrt(T));
d2 = (log(s/K) + (r - 0.5*sigma^2)*T )/(sigma*sqrt(T));
d3 = (log(s/B) + (r + 0.5*sigma^2)*T )/(sigma*sqrt(T));
d4 = (log(s/B) + (r - 0.5*sigma^2)*T )/(sigma*sqrt(T));
d5 = (log(s/B) - (r - 0.5*sigma^2)*T )/(sigma*sqrt(T));
d6 = (log(s/B) - (r + 0.5*sigma^2)*T )/(sigma*sqrt(T));
d7 = (log(s/B^2) - (r - 0.5*sigma^2)*T )/(sigma*sqrt(T));
d8 = (log(s/B^2) - (r + 0.5*sigma^2)*T )/(sigma*sqrt(T));

exactValue = s * (normcdf(d1) - normcdf(d3) - b *(normcdf(d6) - normcdf(d8))) - K * exp(-r*T)*(normcdf(d2) - normcdf(d4) - a*(normcdf(d5) - normcdf(d7)));

res = exactValue;

end