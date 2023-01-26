%% Exercício 2 -
clear;

%% Alínea a - 

    %9.1    1      3.2     3.3   5     9.3    Fim 
T = [0      0      0       0     0     0      0     %9.1
     0.5    0      0       0     0     0      0     %1
     0.5    0      0       0     0     0      0     %3.2
     0      1/3    0       0.2   0.1   0      0     %3.3
     0      1/3    0.6     0.5   0.4   0.3    0     %5
     0      1/3    0.4     0     0.3   0.3    0     %9.3
     0      0      0       0.3   0.2   0.4    1];   %Fim


% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Verificação: \n")
%soma
%x

%% Alínea b - 

nextp = 1e5; %número de transições
nSeq= 0;     %número sequências
nSeqFav = 0; %número de sequências favoráveis

for i = 1:nextp
    state = crawl(T, [1,2], 7);
    if (length(state) == 8 && state(7) == 6)
        nSeqFav = nSeqFav + 1;
    end
    nSeq = nSeq + 1;
end

res = nSeqFav / nSeq;

fprintf("Alínea b)\n  A probabilidade de uma sequencia de 7 dígitos iniciada por 91 e terminada em 9 é %f\n",res)

%% Alínea c - 

nSeqB= 0;     %número sequências
nSeqFavB = 0; %número de sequências favoráveis

for i = 1:nextp
    state = crawl(T, [1,2], 7);
    if (length(state) == 8)
        nSeqFavB = nSeqFavB + 1;
    end
    nSeqB = nSeqB + 1;
end

resB = nSeqFavB / nSeqB;

fprintf("Alínea c)\n  A probabilidade de uma sequencia de 7 dígitos iniciada por 91 é %f\n",resB)