%Exercício 4 -------------------------------------------------------------------------
clear;
fprintf("\nExercício 4 - \n")

N = 1e5;
n = 20;

probCC = 0.9;
pa = 0.001;
p1 = 0.002; %0.2/100
p2 = 0.005; %0.5/10

m=1; %Número de amostras

exp1 = rand(n, N) < p1; %Experiencias primeiro componente

exp2 = rand(n, N) < p2; %Experiências segundo componente

expProcMontagem = rand(n, N) < pa; %Experiências segundo componente

experiencias = exp1 + exp2 + expProcMontagem;

%Alinea a - 

brinquedosSelec = zeros(1,N);

for i=1:N
    x = randperm(n,1);
    brinquedosSelec(1,i) = experiencias(x, i);
end

cfav = sum(brinquedosSelec == 0);

prob = cfav/N;

fprintf("a) A probabilidade da caixa ser comercializada quando m=1 é de %f. \n", prob)

%Alinea a - 

brinquedosSelec_b = zeros(1,N);
ex = zeros(1,19);
probs_b = zeros(1,19);
for m_b=1:19
    for i=1:N
        x_b = randperm(n,m_b);
        for xx=1:length(x_b)
            ex(1,xx) = experiencias(x_b(1,xx), i);
        end
        brinquedosSelec_b(m_b,i) = sum(ex);
    end
    probs_b(1,m_b) = sum( brinquedosSelec_b(m_b,:) == 0)/N;
end

mm = 1:19;
stem(mm, probs_b)
grid on

fprintf("b) Para uma probablilidade maior de que 90 o menor valor de m é 1 e o maior valor de m é 13 \n")
