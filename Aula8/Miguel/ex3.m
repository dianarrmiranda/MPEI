% 3. Considere as p´aginas web com as ligacoes apresentadas na figura:

  %    ->      a.pt   b.es  c.fr  d.br  e.com  f.nl
  % a.pt                 1
  % b.es       0.5                                      0.5
  % c.fr         0.5                   0.5   
  % d.br                         1
  % e.com   0.25 0.25 0.25 0.25
  % f.nl                                  1

H = [ 0 1 0 0 0 0; 0.5 0 0 0 0 0.5; 0.5 0 0 0.5 0 0; 0 0 1 0 0 0; 0.25 0.25 0.25 0.25 0 0; 0 0 0 1 0 0]';

%% (a) Usando a matriz da Google A, com β = 0.85, obtenha a estimativa do pagerank de cada p´agina 
% usando um m´etodo iterativo, repetindo o processo iterativo de c´alculo at´e que a diferenc¸a de pagerank 
% entre duas iteracoes nao exceda 0.01 em valor absoluto para todas as p´aginas. 
% As colunas e linhas da matriz devem seguir a ordem alfab´etica dos nomes das p´aginas.
% Quais as p´aginas com o menor e maior pagerank e qual o seu valor ?

X0 = ones(6,1)/6; %Estado inicial equiprovável
beta = 0.85;
A = beta*H + (1-beta)*ones(6)/6; 

for n=1: 100
    X_atual = A^n*X0;
    X_seguinte = A^(n+1)*X0;
    estavel = 0; %verifica a estabilidade do pagerank de cada página

    for i=1:6
            if X_seguinte(i) < (X_atual(i) + 0.01) && X_seguinte(i) > (X_atual(i) - 0.01)
                estavel = estavel + 1;
            end
    end
    if estavel == 6 %todas estáveis
        break;
    end
end

fprintf("a) São necessárias %d iterações:\n" + ...
    "\ta.pt (%.5f), b.es (%.5f), c.fr (%.5f), d.br (%.5f), e.com (%.5f) e f.nl (%.5f)\n" ...
    ,n,X_atual(1),X_atual(2),X_atual(3),X_atual(4),X_atual(5),X_atual(6));

%% (b) Confirme os valores de pagerank obtidos usando um processo nao iterativo.

% (A-I)u aumentada com u1+u2+u3+u4+u5+u6
M = [A-eye(6); ones(1,6)]; % 6 -> length(T)
x = [0 0 0 0 0 0 1]';
u = M\x;

fprintf("b) Probabilidades limite dos estados:\n" + ...
    "\ta.pt (%.5f), b.es (%.5f), c.fr (%.5f), d.br (%.5f), e.com (%.5f) e f.nl (%.5f)\n",u(1),u(2),u(3),u(4),u(5),u(6));
