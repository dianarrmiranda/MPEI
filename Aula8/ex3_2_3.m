%% Exercício 3 -
clear;

%% Alínea a - 

    %a    b    c    d    e       f 
T = [0    0.5  0.5  0    0.25    0     %a
     1    0    0    0    0.25    0     %b
     0    0    0    1    0.25    0     %c
     0    0    0.5  0    0.25    1     %d
     0    0    0    0    0       0     %e
     0    0.5  0    0    0       0];   %f


% Verificar se a matriz é estocática
soma = sum(T);
x = T>=0 & T<=1;

%fprintf("Verificação: \n")
%soma
%x

%% Alíena a - 

nextp = 1e5; %número de transições
pages = zeros(length(T), 1);

start = ceil(rand()*6); %Estado inicial aleatório
seq = crawl(T, start, nextp); %Gera uma sequência aleatória

for j = seq
    pages(j) = pages(j) + 1; %vai contar quantas vezes passou em cada página
end

pageRank = pages / nextp; %faz o page rank que é a prob de cada página

fprintf("Alínea a)\n Page Rank: \n")
pageRank
fprintf("\n A melhor página é a D e a pior é a E \n")


%% Alínea b - 

B=0.85; %Valor aleatório próximo de 1

N=6;

r = ones(N,1)/N;

iter = 0;
A = B * T + (1-B) * ones(N)/N;

newR = A * r; %new Page rank

while (sum(abs(newR - r)) > 0.01)
    iter = iter + 1;
    r = newR;
    newR = A * newR;
end

fprintf("Alínea b)\n Page Rank: \n")
newR
fprintf("\n A melhor página é a D e a pior é a E \n São necessárias %d iterações.\n", iter)

%% Maneira do Miguel -

r = ones(N,1)/N; %page rank incial equiprovável
beta = 0.85;
A = beta * T + (1-beta)*ones(N)/N; 

for n=1:10000
    r_atual = A^n*r;
    r_seguinte = A^(n+1)*r;
    estavel = 0; %verifica a estabilidade do pagerank de cada página

    for i=1:6
            if abs(r_seguinte(i) - r_atual(i)) < 0.01 
                estavel = estavel + 1;
            end
    end
    if estavel == 6 %todas estáveis
        break;
    end
end

fprintf("\na) São necessárias %d iterações:\n a.pt (%.5f)\n b.es (%.5f)\n c.fr (%.5f)\n d.br (%.5f)\n e.com (%.5f)\n f.nl (%.5f)\n" ...
    ,n,r_atual(1),r_atual(2),r_atual(3),r_atual(4),r_atual(5),r_atual(6));


%% (b) Confirme os valores de pagerank obtidos usando um processo nao iterativo.

% (A-I)u aumentada com u1+u2+u3+u4+u5+u6
M = [A-eye(N); ones(1,N)]; % 6 -> length(T)
x = [0 0 0 0 0 0 1]';
u = M\x;

fprintf("b) Page rank, não iterativo:\n a.pt (%.5f)\n b.es (%.5f)\n c.fr (%.5f)\n d.br (%.5f)\n e.com (%.5f)\n f.nl (%.5f)\n",u(1),u(2),u(3),u(4),u(5),u(6));

%%
function [state] = crawl(H, first, maxN)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    beta = 0.85;
    % keep moving from state to state until state "last" is reached:
    it = 0;
    while (1)
        if (rand() < beta)
            state(end+1) = nextState(H, state(end));
        else
            state(end+1) = ceil(rand()*length(H));
        end
        if maxN == it % verifies if state(end) is absorbing
            break;
        end
        it = it + 1;
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