% 1. Relativamente ao problema 6 da secção anterior:

%% (a) Confirme os valores calculados nas al´ıenas (f) e (g) atrav´es de simulacao 
% (fac¸a a m´edia de v´arias simulacoes). Use o c´odigo Matlab na ´ultima p´agina como base para criar a suas simulacoes.

H = [0.8 0.2 0 0 0; 0 0.6 0.3 0.1 0; 0 0 1 0 0; 0.3 0.2 0 0.4 0.1; 0 0 0 0 1]';

% (f) Qual a media (valor esperado) do nº de passos ate a absorcao começando no estado 1? Estado 2? Estado 4?
% (g) Comecando no estado 1, qual e a probabilidade de absorcao do estado 3? E do estado 5? 

N = 1e4; %Nº experiencias (aumentar eleva drasticamente o tempo de execução, daí ser um valor baixo)
N_X1 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 1
N_X2 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 2
N_X4 = zeros(N,1); %vetor para guardar o nº de passos ate absorcao, com X0 = 4

E1_ab3 = 0; %Nº absorções em 3, com X0 = 1
E1_ab5 = 0; %Nº absorções em 5, com X0 = 1

for i= 1: N
    aux = crawl(H,1,[3 5]);
    if aux(1,end) == 3
        E1_ab3 = E1_ab3 +1;
    else
        E1_ab5 = E1_ab5 +1;
    end

    N_X1(i) = length(aux)-1;       %Nº passos = length-1, pois (entre 5 dedos há 4 espaços, analogia estranha, mas penso que dá para explicar)
    N_X2(i) = length(crawl(H,2,[3 5]))-1;
    N_X4(i) = length(crawl(H,4,[3 5]))-1;
end

Media_X1 = sum(N_X1)/N; %6 f) ~=9.47   Com N =10e4, ~= 9.5094
Media_X2 = sum(N_X2)/N; %6 f) ~=4.47   Com N =10e4, ~= 4.4153
Media_X4 = sum(N_X4)/N; %6 f) ~=7.89   Com N =10e4, ~= 7.8881

Prob_Abs3 = E1_ab3/N; %6 g) 3 = 0.94737  5 = 0.05263
Prob_Abs5 = E1_ab5/N; % ou 1 - Prob_Abs3

fprintf("--------a)--------\n");
fprintf("(referente a 6f) Nº médio de passos até absorção começando no estado: 1 = %.5f  2 = %.5f  4 = %.5f\n",Media_X1,Media_X2,Media_X4);
fprintf("(referente a 6g) Probabilidade de absorção (começando no estado 1) nos estados: 3 = %.5f  5 = %.5f\n",Prob_Abs3,Prob_Abs5);

%% (b) Guarde numa variável do tipo cell array do Matlab 10000 sequˆencias que comec¸am num dos estados 
% n˜ao absorventes (escolhido com igual probabilidade). 
% Calcule os comprimentos m´ınimo e m´aximo das sequˆencias geradas.

N = 10000;
Estados = [1,2,4]; %estados não absorventes
E = datasample(Estados,N); %Estados escolhidos aleatoriamente equivalente a Estados(randi(length(Estados)))

a = cell(1,N);

for i= 1: N
    a{i} = crawl(H,1,[3 5]); %Gerar sequência
end

TamSeq = cellfun('length',a);   %Tamanho das sequências do cell array
maxSeq = max(TamSeq);   %Sequência de tamanho máximo
minSeq = min(TamSeq);   %Sequência de tamanho mínimo

fprintf("--------b)--------\n");
fprintf("Comprimento das sequências geradas    mín: %d    máx: %d\n",minSeq,maxSeq);

%%
function [state] = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
    end
end

function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end
