%% Exercicio 7
%C="Programa é do carlos 
%E = Programa tem erro
%P(C|E)

clear all
N=1e5;

n=100; % 100 programas

ProgA=rand(20,N)<0.01;
ProgB=rand(30,N)<0.05;
ProgC=rand(50,N)<0.001;

Progs = [ProgA;ProgB;ProgC];

cfavErro=sum(sum(Progs));

cfavCeErro=sum(sum(ProgC));

probCdadoErro = cfavCeErro/cfavErro

%probabilidade André

cfavAeErro=sum(sum(ProgA));

probAdadoErro = cfavAeErro/cfavErro

%probabilidade Bruno

cfavBeErro=sum(sum(ProgB));

probBdadoErro = cfavBeErro/cfavErro