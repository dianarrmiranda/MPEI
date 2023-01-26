clear all

%30% de peça defeituosas
%5 peças tomadas aleatoriamente

N=1e5;

S = 0:5; %Espaço de amostragem


%Probabilidades Aleatórias
exp = rand(5,N);

experiencias = exp < 0.3;

for i=0:5 
    cfav = sum(sum(experiencias) == i);
    px(i+1) = cfav/N;
end

%Função massa de probabilidade de X
subplot(1,2,1)
stem(S, px)
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X");
xlim([-0.5,5.5]);
grid on

%Função distribuiçao acumulada de probabilidade de X

pacumul = cumsum(px);

subplot(1,2,2)
stairs([0 S 6],[0 pacumul 1]);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Distribuição acumulada");
xlim([0,5.5]);
ylim([0.15,1.02]);
grid on



fprintf("Probabilidades: \n     f[0] = %0.4f \n     f[1] = %0.4f \n     f[2] = %0.4f \n     f[3] = %0.4f \n     f[4] = %0.4f \n     f[5] = %0.4f \n" , px(1), px(2), px(3), px(4), px(5), px(6))

fprintf("Alinea a)\n  iii. Probabilidade de no máximo 2 peças serem defeituosas = %0.4f \n", pacumul(3))