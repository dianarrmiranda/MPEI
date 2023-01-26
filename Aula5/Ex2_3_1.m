clear;

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


%Exercício 1 -----------------------------------------------------
fprintf("\nExercício 1 - \n")

%Aliena a - 


cfav = sum(sum(experiencias) > 0);

probA = cfav/N;


fprintf("a) Uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito = %0.4f \n", probA)

%Aliena b - 

cfav = sum(sum(expProcMontagem) > 0);

probA_b = cfav/N;

fprintf("b) Uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito (apenas devido ao processo de montagem) = %0.4f \n", probA_b)
fprintf("   Média = %0.4f \n", probA_b * n)


















