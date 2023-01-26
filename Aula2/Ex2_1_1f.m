clear all

N = 100000;

fam = rand(5,N) < 0.5; %Experiencia 

% p de ter 1 rapaz pelo menos

cfav1 = sum(sum(fam) >= 1); %Casos favoráveis

p1 = cfav1/N;

% p de ter pelo menos 2 rapazes

cfav2 = sum(sum(fam) >= 2);

p = cfav2/cfav1