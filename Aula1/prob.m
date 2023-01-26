function [probSimulacao] = prob(k, n, p, N)
%Cálculo de probabilidade de K caras em n moedas

lancamentos = rand(n, N) > (1-p);
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N;

end