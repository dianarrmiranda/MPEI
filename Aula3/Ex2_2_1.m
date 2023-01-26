clear;

%Considere a variavel aleatória X correspondente a face que fica para cima no 
% lançamento de 1 dado. Usando os valores teoricos:

Sx= 1:6;

probs = ones(1,6)/6;

%função massa de probabilidade

subplot(1,2,1);
stem(Sx,probs);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X");
grid on   
xlim([0 7]);


% função de distribuição acumulada

pacumul = cumsum(probs);

probs = ones(1,6)/6;

subplot(1,2,2)
stairs([0 Sx 7], [0 pacumul 1]);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Distribuição acumulada");
ylim([0 1.1])
xlim([0 7]);
grid on