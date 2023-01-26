N = 100000;

T = 1000;
keys = 10;

lancamentos = randi(T, keys, N);

diferentes = zeros(1, N);

for col=1:N
    diferentes(col) = length(unique(lancamentos(:,col))) < keys;
end

p1 = sum(diferentes)/N
