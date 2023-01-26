clear all
 
%Alinea A - S = {0, 1, 2, 3 , 4}

x = 0:4; %dados possiveis de sair

%Probabilidades por simulação 

N = 1e5;
p = 0.5;

matrix = rand(4,N);
lancamentos = matrix < 0.5;

for i=0:4
    soma =  sum(lancamentos) == i;
    cfav = sum(soma);
    px(i+1) = cfav/N; %probabilidades
end

fprintf("Alinea a) \n")
fprintf("   Probabilidades: \n     f[0] = %0.4f \n     f[1] = %0.4f \n     f[2] = %0.4f \n     f[3] = %0.4f \n     f[4] = %0.4f \n" , px(1), px(2), px(3), px(4), px(5))

stem(x,px);
xlabel("x_i");
ylabel("P[X = x_i] - probabilidade(x)");
title("Função massa probabilidade de X");
xlim([-0.5,4.5]);
ylim([0,0.4]);
grid on

fprintf("Alinea b) \n")

%Média ou valor esperado
media = sum(x.*px);
fprintf("   Média: %0.4f \n", media)

%Variância
variancia = sum((x.^2).*px) - media^2;
fprintf("   Variância: %0.4f \n", variancia)

%Desvio padrão
dp = sqrt(variancia);
fprintf("   Desvio Padrão: %0.4f \n", dp)


fprintf("Alinea c) \n")
fprintf("Alinea d) \n")
fprintf("Alinea e) \n")

fprintf("Alinea f) \n")

probsTeoricas = [0.0625 0.25 0.375 0.25 0.0625];

prob2coroas = sum(probsTeoricas(1:3));
prob1coroa = sum(probsTeoricas(1:2));
prob1a3coroas = sum(probsTeoricas(2:4));

fprintf("  i. Probabilidade de obter pelo menos 2 coroas = %0.4f \n", prob2coroas)
fprintf("  ii. Probabilidade de obter ate 1 coroa = %0.4f \n", prob1coroa)
fprintf("  iii. Probabilidade de obter entre 1 e 3 coroas. = %0.4f \n", prob1a3coroas)














