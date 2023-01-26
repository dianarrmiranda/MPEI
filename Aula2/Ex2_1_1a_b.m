clear;

%Obtenha por simulação uma estimativa da probabilidade do acontecimento 
% "ter pelo menos um filho rapaz" em famílias com 2 filhos.

N = 100000;

fam = rand(2,N) < 0.5; %Experiencia 

cfav = sum(sum(fam) >=1); %Casos favoráveis

p = cfav/N 

%(b) Determine o valor teorico do acontecimento da alínea anterior e compare-o 
% com a estimativa obtida por simulacão. Os valores são iguais? Porquê?

pTeorico = 3/4 % MM, MF, FM, FF - 3 favoraveis em 4
