clear all

N = 100000;

ts = 100:100:1000;
keys = 50;

res = [];

for T = ts
    lancamentos = randi(T, keys, N);
    diferentes = zeros(1, N);

    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) == keys;
    end
    res = [res sum(diferentes)/N];
end

plot(ts, res,"r*-")
title("50 keys - Probabilidade de não haver colisões")