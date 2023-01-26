N = 100000;

n = 20;
m = 100;

lancamentos = randi(m, n, N);

diferentes = zeros(1, N);

for col=1:N
    diferentes(col) = length(unique(lancamentos(:,col))) == n;
end




p1 = sum(diferentes)/N


