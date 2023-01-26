%Exercício 3 -------------------------------------------------------------------------
clear;
fprintf("\nExercício 3 - \n")

N=1e5;
n = 8;

p1 = 0.002; %0.2/100
p2 = 0.005; %0.5/100
pa = 0.01;  %1/100

exp1 = rand(n, N) < p1; %Experiencias primeiro componente

exp2 = rand(n, N) < p2; %Experiências segundo componente

expProcMontagem = rand(n, N) < pa; %Experiências segundo componente

experiencias = exp1 + exp2 + expProcMontagem;

%Alinea a - Função massa probabilidade

arr_n = 0:n;
probsX = zeros(1,n);
for i=0:n
    cfav = sum(sum(experiencias) == i);
    probsX(1,i+1) = cfav / N;
end

subplot(121)
stem(arr_n, probsX)
xlim([-0.2 8.2])
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X (Alinea A)");
grid on

fprintf("a) Gráfico \n")

%Alinea b - 

probX_maiorOUigual2 = 0;

for i=3:n+1
    probX_maiorOUigual2 = probX_maiorOUigual2 + probsX(i);
end

fprintf("b) Probabilidade de (X >= 2) = %f \n", probX_maiorOUigual2)

%Alinea c - Valor esperado, variância e desvio padrão
media = sum(arr_n.*probsX);

var = sum((arr_n.^2).*probsX) - media^2;

dp = sqrt(var);

fprintf("c) Valor esperado (E[X]) = %0.4f \n", media)
fprintf("   Variância (var(X)) = %0.4f \n", var)
fprintf("   Desvio Padrão = %0.4f \n", dp)

%Alinea d-----------------------------------------------------------------
fprintf("\nAlinea d - \n")
N=1e5;
n = 16;

p1 = 0.002; %0.2/100
p2 = 0.005; %0.5/100
pa = 0.01;  %1/100

ptotal = p1+p2+pa;

exp1 = rand(n, N) < p1; %Experiencias primeiro componente

exp2 = rand(n, N) < p2; %Experiências segundo componente

expProcMontagem = rand(n, N) < pa; %Experiências segundo componente

experiencias = exp1 + exp2 + expProcMontagem;

%Alinea a - Função massa probabilidade

arr_n = 0:n;
probsX = zeros(1,n);
for i=0:n
    cfav = sum(sum(experiencias) == i);
    probsX(1,i+1) = cfav / N;
end

subplot(122)
stem(arr_n, probsX)
xlim([-0.5 16.5])
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X (Alínea d)");
grid on

fprintf("a) Gráfico \n")

%Alinea b - 

probX_maiorOUigual2 = 0;

for i=3:n+1
    probX_maiorOUigual2 = probX_maiorOUigual2 + probsX(i);
end

fprintf("b) Probabilidade de (X >= 2) = %f \n", probX_maiorOUigual2)

%Alinea c - Valor esperado, variância e desvio padrão
media = sum(arr_n.*probsX);

var = sum((arr_n.^2).*probsX) - media^2;

dp = sqrt(var);

fprintf("c) Valor esperado (E[X]) = %0.4f \n", media)
fprintf("   Variância (var(X)) = %0.4f \n", var)
fprintf("   Desvio Padrão = %0.4f \n", dp)




