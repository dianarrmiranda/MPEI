%% Exercício 1 -
clear;
%% Alínea a) - 
     %1    2      4    3   5
T = [0.8   0     0.3   0   0    %1
     0.2   0.6   0.2   0   0    %2
     0     0.1   0.4   0   0    %4
     0     0.3   0     1   0    %3
     0     0     0.1   0   1];  %5

soma1=0;
soma2=0;
soma3=0;

nextp=1e4;

stateAbsorv5 = 0;
stateAbsorv3 = 0; 

for iter=1:nextp
    state = crawl(T,1,[4,5]);
    num_trans = length(state)-1;
    soma1 = soma1 + num_trans; 

    if state(length(state)) == 4
        stateAbsorv3 = stateAbsorv3 + 1;
    else
        stateAbsorv5 = stateAbsorv5 + 1;
    end
end

for iter=1:nextp
    state = crawl(T,2,[4,5]);
    num_trans = length(state)-1;
    soma2 = soma2 + num_trans;  
end


for iter=1:nextp
    state = crawl(T,3,[4,5]);
    num_trans = length(state)-1;
    soma3 = soma3 + num_trans;  
end



fprintf("Alínea a) \n")
fprintf("  Número de passos médio até absorção começando no estado 1: %f\n", soma1/nextp)
fprintf("  Número de passos médio até absorção começando no estado 2: %f\n", soma2/nextp)
fprintf("  Número de passos médio até absorção começando no estado 4: %f\n", soma3/nextp)
fprintf("  Começando no estado 1, a probabilidade de absorção do estado 3: %f\n", stateAbsorv3/nextp)
fprintf("  Começando no estado 1, a probabilidade de absorção do estado 5: %f\n", stateAbsorv5/nextp)

%% Alínea b - 

nTrMin = 0; %número de transições minimas
nTrMax = 0; %número de transições minimas

for i = 1:nextp
    state1 = ceil(rand()*3); %gerar estado inicial aleatório
    state = crawl(T, state1, [4 5]);
    if (length(state) < nTrMin)
        nTrMin = length(state);
    elseif (length(state) >  nTrMax)
        nTrMax = length(state);        
    end
end

fprintf("Alínea b) \n")
fprintf("  Comprimento mínimo: %d\n", nTrMin)
fprintf("  Comprimento máximo: %d\n", nTrMax)