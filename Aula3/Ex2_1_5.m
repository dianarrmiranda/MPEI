% A = "Soma == 9"
% B = "O 2º é par"
% C = "Pelo menos um 5"
% D = "Nenhum é 1"


N = 100000;

n = 2;

lancamentos = randi([1,6],n,N);


%Probabilidade A
soma = sum(lancamentos);

x = soma == 9;

cFavA = sum(x);

pA = cFavA/N 
pAt = 4/36

%Probabilidade B

par = rem(lancamentos(2,:) , 2) ==0; %vê se o segundo valor é par

cFavB = sum(par);

pB = cFavB/N 
pBt = 1/2

%Probabilidade C

for col=1:N
   cinco(col) = lancamentos(1,col) == 5 || lancamentos(2,col)==5;
end

cFavC = sum(cinco);

pC = cFavC/N 
pCt = 11/36

%Probabilidade D

for col=1:N
   nenhum1(col) = lancamentos(1,col) ~= 1 && lancamentos(2,col) ~= 1;
end

cFavD = sum(nenhum1);

pD = cFavD/N 
pDt = 25/36
