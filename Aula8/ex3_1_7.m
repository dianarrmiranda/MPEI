clear;
%% Exercício 7 -
    %A B C D  E  F
H = [0 0 0 0 1/3 0  %A
     1 0 0 0 1/3 0  %B
     0 1/2 0 1 0 0  %C 
     0 0 1 0 0 0    %D
     0 1/2 0 0 0 0  %E 
     0 0 0 0 1/3 1]; %F
% Verificar se a matriz é estocática
soma = sum(H);
x = H>=0 & H<=1;

%fprintf("Verificação: \n")
%soma
%x

%fprintf("Matriz:\n ")
%H

%% Alínea a - Page rank
N=6;

pr = ones(N,1)/N;

for i=1:10    
    pr = H*pr;
end

fprintf("Alínea A)\n Page Rank:")
pr

%% Alínea b e c - A spider trap é o C - D e o dead end é o F

H2 = H;

H2(:,6) = 1/N;

H2;

pr2 = ones(N,1)/N;

for i=1:10  
    pr2 = H2*pr;
end

fprintf("Alínea c)\n Page Rank com dead end solucionado")
pr2


%% Alínea d - Solucionar amnbos os problemas

B=0.8; %Valor aleatório próximo de 1


r = ones(N,1)/N;

A = B * H + (1-B) * ones(N)/N;

for i=1:10    
    r = A*r;
end

fprintf("Alínea d)\n Page Rank com ambos os problemas solucionados")
r

%% Alínea e - 

r = ones(N,1)/N;

iter = 0;

A = B * H + (1-B) * ones(N)/N;

newR = A * r; %new Page rank

while (sum(abs(newR - r)) > 10^-4)
    iter = iter + 1;
    r = newR;
    newR = A * newR;
end

fprintf("Alínea e)\n Page Rank: \n")
newR
fprintf("\n Foram necesária %d iterações\n", iter)