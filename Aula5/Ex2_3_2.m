%Exercício 2 -------------------------------------------------------------------------
clear;
fprintf("\nExercício 2 - \n")

N=1e5;
n = 8;

p1 = 0.002; %0.2/100
p2 = 0.005; %0.5/100
pa = 0.01;  %1/100

ptotal = p1+p2+pa;

exp1 = rand(n, N) < p1; %Experiencias primeiro componente

exp2 = rand(n, N) < p2; %Experiências segundo componente

expProcMontagem = rand(n, N) < pa; %Experiências segundo componente

experiencias = exp1 + exp2 + expProcMontagem;

%Alinea a - 

cfav = sum(sum(experiencias) == 0);

probB = cfav/N;

fprintf("a) Uma caixa de brinquedos nao tem brinquedos com defeito = %0.4f \n", probB)

%Alinea b - Valores teóricos

probB_Teorica = nchoosek(n,0)*(ptotal)^0*(1-ptotal)^(n-0);


fprintf("b) Uma caixa de brinquedos nao tem brinquedos com defeito (Valor Teórico) = %0.4f \n", probB_Teorica)

%Os resultados são praticamente iguais 

%Alinea c - n = 2 até 20

n_c = 2:20;
probs_c = zeros(size(n_c));

for i=1:length(n_c)

    exp1_c = rand(n_c(i), N) < p1; %Experiencias primeiro componente

    exp2_c = rand(n_c(i), N) < p2; %Experiências segundo componente

    expProcMontagem_c = rand(n_c(i), N) < pa; %Experiências segundo componente

    experiencias_c = exp1_c + exp2_c + expProcMontagem_c;

    cfav_c = sum(sum(experiencias_c) == 0);

    probs_c(1,i) = cfav_c/N;

end

plot(n_c, probs_c);
xlabel("Valores de n");
ylabel("Probabilidade acontecimentos B");
title("Exercício 2 c)")

fprintf("c) Gráfico \n")

%Alinea d - 
max_cap = 0;

for i=1:length(probs_c)
    if probs_c(i) > 0.9
        max_cap = n_c(i);
    end 
end

fprintf("d) A capacidade máxima da caixa é %d \n", max_cap)


