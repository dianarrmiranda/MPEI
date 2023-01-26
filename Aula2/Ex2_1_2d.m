clear all

N = 100000;

ns = 10:10:100; %inicio:passo:fim
m = 200;

res = [];

for n = ns
    lancamentos = randi(m, n, N);
    diferentes = zeros(1, N);

    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) < n;
    end
    res = [res sum(diferentes)/N];
end


subplot(1,3,1)
plot(ns, res,"r*-")
title("m=200")

%Segundo gráfico 

ns = 10:10:100; %inicio:passo:fim
m = 500;

res = [];

for n = ns
    lancamentos = randi(m, n, N);
    diferentes = zeros(1, N);

    for col=1:N
        diferentes(col) = length(unique(lancamentos(:,col))) < n;
    end
    res = [res sum(diferentes)/N];
end


subplot(1,3,2)
plot(ns, res,"r*-")
title("m=500")

%Terceiro gráfico 

ns = 10:10:100; %inicio:passo:fim
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


subplot(1,3,3)
plot(ns, res,"r*-")
title("m=1000")