%% Exercicio 2
clear;

%% Alinea a -

    %A B C
M = [1/3 1/4 0
     1/3 11/20 1/2
     1/3 1/5 1/2];
format rat

% Verificar se a matriz é estocática
soma = sum(M);
x = M>=0 & M<=1;

fprintf("Alinea a) \nMatriz:\n")
M

fprintf("Verificação: \n")
soma
x

%% Aliena b - 

% Vetor inicial

vb = [60/90
      15/90
      15/90];
format rat

fprintf("Alinea b) \nVetor:\n")
vb

%% Alinea c - 

v30 = M^30 * vb;

fprintf("Alinea c) Grupo A: %0.0f alunos\n", v30(1)*90)
fprintf("          Grupo B: %0.0f alunos\n", v30(2)*90)
fprintf("          Grupo C: %0.0f alunos\n", v30(3)*90)

%% Alinea d - 

vd = [30/90
      30/90
      30/90];

v30d = M^30 * vd;

fprintf("Alinea d) Grupo A: %0.0f alunos\n", v30d(1)*90)
fprintf("          Grupo B: %0.0f alunos\n", v30d(2)*90)
fprintf("          Grupo C: %0.0f alunos\n", v30d(3)*90)


