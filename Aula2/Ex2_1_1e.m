clear;

%) Considere uma família com 5 filhos. Sabendo que pelo menos um dos filhos é rapaz, 
%obtenha por simulacão uma estimativa para a probabilidade de um dos outros 
% (e apenas um) ser tambem rapaz

N = 100000;

fam = rand(5,N) < 0.5; %Experiencia 

% p de ter 1 rapaz pelo menos

cfav1 = sum(sum(fam) >= 1); %Casos favoráveis

p1 = cfav1/N;

% p de ter 2 rapazes

cfav2 = sum(sum(fam) == 2);

p = cfav2/cfav1