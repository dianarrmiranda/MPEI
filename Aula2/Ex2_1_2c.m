N = 100000;

ns = 10:10:100;
m = 1000;

res = [];

for n = ns
    lancamentos = randi(m, n, N);
    diferentes = zeros(1, N);

    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) < n;
    end
    res = [res sum(diferentes)/N];
end


subplot(1,2,1)
plot(ns, res,"r*-")
title("m=1000")

%Segundo gráfico 

ns = 10:10:100;
m = 100000;

res = [];

for n = ns
    lancamentos = randi(m, n, N);
    diferentes = zeros(1, N);

    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) < n;
    end
    res = [res sum(diferentes)/N];
end


subplot(1,2,2)
plot(ns, res, "r*-")
title("m=100000")