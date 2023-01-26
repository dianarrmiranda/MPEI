function [pt] = probTeorico(k, n, p)
%Calculo Teorico

pt = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!

end