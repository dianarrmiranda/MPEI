clear all

N = 100000;

n = 20;
m = 100;

lancamentos = randi(m, n, N);

repetidos = zeros(1, N);

for col=1:N
    repetidos(col) = length(unique(lancamentos(:,col))) ~= n; %verifica se há numeros repeditos em cada coluna da matriz dos lançamentos
end


p1 = sum(repetidos)/N
