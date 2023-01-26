clear all

%Alinea A - O espaço de amostragem é constituido por 100 casos possiveis
%todos com probabilidade de 1%.
%           A probabilidade dos acontecimentos elementares é 1/100 = 0.01.
%           Temos 100 notas, logo temos 100 probabilidades elementares, em
%           que em cada uma só se vai tirar uma nota. 

%Alinea B - O espaço de amostragem é S = {5, 50, 100}

x = [5,50,100]; %dados possiveis de sair

fx = [90/100, 9/100, 1/100]; %probabilidade de cada uma das possibibilidades

subplot(1,2,1);
stem(x,fx);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X");
xlim([0,105]);
grid on

%Alinea C - 
pacumul = cumsum(fx);

subplot(1,2,2)
stairs([0 x 105],[0 pacumul 1]);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Distribuição acumulada");
xlim([0,105]);
ylim([0.89,1.01]);
grid on

